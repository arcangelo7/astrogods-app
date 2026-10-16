import 'dart:math';

const double eclipticObliquityDeg = 23.44;
final double _eclipticObliquityRad = eclipticObliquityDeg * pi / 180;
final _Vector3 _northEclipticPole = _Vector3(
  0,
  -sin(_eclipticObliquityRad),
  cos(_eclipticObliquityRad),
);

enum EclipticVisibility { risesAndSets, circumpolar, neverRises }

class EclipticHorizonSnapshot {
  final double siderealAngleRad;
  final double ascendantLongitudeDeg;
  final double horizonAngleDeg;
  final double ascendantSpeed;

  const EclipticHorizonSnapshot({
    required this.siderealAngleRad,
    required this.ascendantLongitudeDeg,
    required this.horizonAngleDeg,
    required this.ascendantSpeed,
  });
}

class EclipticLongitudeSnapshot {
  final EclipticVisibility visibility;
  final double requestedLongitudeDeg;
  final double resolvedLongitudeDeg;
  final double siderealAngleRad;
  final double horizonAngleDeg;
  final double ascendantSpeed;

  const EclipticLongitudeSnapshot({
    required this.visibility,
    required this.requestedLongitudeDeg,
    required this.resolvedLongitudeDeg,
    required this.siderealAngleRad,
    required this.horizonAngleDeg,
    required this.ascendantSpeed,
  });
}

EclipticHorizonSnapshot eclipticHorizonForSiderealHours({
  required double latitudeDeg,
  required double siderealHours,
}) {
  return _snapshotForSiderealAngle(
    latitudeDeg: latitudeDeg,
    siderealAngleRad: _normalizeRadians(siderealHours / 24 * 2 * pi),
  );
}

EclipticLongitudeSnapshot eclipticHorizonForLongitude({
  required double latitudeDeg,
  required double longitudeDeg,
}) {
  final requestedLongitude = _normalizeDegrees(longitudeDeg);
  final visibility = eclipticVisibilityForLongitude(
    latitudeDeg: latitudeDeg,
    longitudeDeg: requestedLongitude,
  );
  final resolvedLongitude = visibility == EclipticVisibility.risesAndSets
      ? requestedLongitude
      : nearestRisingLongitude(
          latitudeDeg: latitudeDeg,
          longitudeDeg: requestedLongitude,
        );
  final siderealAngleRad = siderealAngleAtRisingLongitude(
    latitudeDeg: latitudeDeg,
    longitudeDeg: resolvedLongitude,
  );
  final snapshot = _snapshotForSiderealAngle(
    latitudeDeg: latitudeDeg,
    siderealAngleRad: siderealAngleRad,
  );

  return EclipticLongitudeSnapshot(
    visibility: visibility,
    requestedLongitudeDeg: requestedLongitude,
    resolvedLongitudeDeg: resolvedLongitude,
    siderealAngleRad: snapshot.siderealAngleRad,
    horizonAngleDeg: snapshot.horizonAngleDeg,
    ascendantSpeed: snapshot.ascendantSpeed,
  );
}

EclipticVisibility eclipticVisibilityForLongitude({
  required double latitudeDeg,
  required double longitudeDeg,
}) {
  final latitudeRad = latitudeDeg * pi / 180;
  final longitudeRad = _normalizeDegrees(longitudeDeg) * pi / 180;
  final declination = asin(sin(_eclipticObliquityRad) * sin(longitudeRad));
  final horizonLimit = pi / 2 - latitudeRad;

  if (declination.abs() <= horizonLimit + 1e-9) {
    return EclipticVisibility.risesAndSets;
  }

  return declination >= 0
      ? EclipticVisibility.circumpolar
      : EclipticVisibility.neverRises;
}

double nearestRisingLongitude({
  required double latitudeDeg,
  required double longitudeDeg,
}) {
  final normalizedLongitude = _normalizeDegrees(longitudeDeg);
  final latitudeRad = latitudeDeg * pi / 180;
  final risingBand = cos(latitudeRad) / sin(_eclipticObliquityRad);

  if (risingBand >= 1) {
    return normalizedLongitude;
  }

  final boundary = asin(risingBand.clamp(0.0, 1.0)) * 180 / pi;
  final validIntervals = [
    (0.0, boundary),
    (180.0 - boundary, 180.0 + boundary),
    (360.0 - boundary, 360.0),
  ];

  for (final interval in validIntervals) {
    final (start, end) = interval;
    if (normalizedLongitude >= start && normalizedLongitude <= end) {
      return normalizedLongitude;
    }
  }

  final candidates = [
    boundary,
    180.0 - boundary,
    180.0 + boundary,
    360.0 - boundary,
  ];

  var bestLongitude = candidates.first;
  var bestDistance = double.infinity;

  for (final candidate in candidates) {
    final distance = _circularDistanceDegrees(normalizedLongitude, candidate);
    if (distance < bestDistance) {
      bestDistance = distance;
      bestLongitude = candidate;
    }
  }

  return _normalizeDegrees(bestLongitude);
}

double siderealAngleAtRisingLongitude({
  required double latitudeDeg,
  required double longitudeDeg,
}) {
  final latitudeRad = latitudeDeg * pi / 180;
  if (cos(latitudeRad).abs() < 1e-9) {
    return 0;
  }

  final longitudeRad = _normalizeDegrees(longitudeDeg) * pi / 180;
  final declination = asin(sin(_eclipticObliquityRad) * sin(longitudeRad));
  final rightAscension = atan2(
    sin(longitudeRad) * cos(_eclipticObliquityRad),
    cos(longitudeRad),
  );
  final horizonHourAngle = acos(
    (-tan(latitudeRad) * tan(declination)).clamp(-1.0, 1.0),
  );

  return _normalizeRadians(rightAscension - horizonHourAngle);
}

EclipticHorizonSnapshot _snapshotForSiderealAngle({
  required double latitudeDeg,
  required double siderealAngleRad,
}) {
  final latitudeRad = latitudeDeg * pi / 180;
  final zenith = _Vector3(
    cos(latitudeRad) * cos(siderealAngleRad),
    cos(latitudeRad) * sin(siderealAngleRad),
    sin(latitudeRad),
  );
  final east = _Vector3(-sin(siderealAngleRad), cos(siderealAngleRad), 0);
  final risingPoint = _eastIntersectionPoint(zenith: zenith, east: east);
  final horizonTangent = zenith.cross(risingPoint);
  final eclipticTangent = _northEclipticPole.cross(risingPoint);
  final angleCosine =
      (horizonTangent.dot(eclipticTangent).abs() /
              (horizonTangent.length * eclipticTangent.length))
          .clamp(0.0, 1.0);

  return EclipticHorizonSnapshot(
    siderealAngleRad: _normalizeRadians(siderealAngleRad),
    ascendantLongitudeDeg: _eclipticLongitudeFromVector(risingPoint),
    horizonAngleDeg: acos(angleCosine) * 180 / pi,
    ascendantSpeed: cos(latitudeRad).abs() < 1e-9
        ? 0
        : _ascendantSpeed(
            latitudeDeg: latitudeDeg,
            siderealAngleRad: siderealAngleRad,
          ),
  );
}

_Vector3 _eastIntersectionPoint({
  required _Vector3 zenith,
  required _Vector3 east,
}) {
  var point = _northEclipticPole.cross(zenith).normalized;
  if (point.dot(east) < 0) {
    point = -point;
  }
  return point;
}

double _ascendantSpeed({
  required double latitudeDeg,
  required double siderealAngleRad,
}) {
  const step = 1e-4;
  final before = _ascendantLongitudeAtSiderealAngle(
    latitudeDeg: latitudeDeg,
    siderealAngleRad: siderealAngleRad - step,
  );
  final after = _ascendantLongitudeAtSiderealAngle(
    latitudeDeg: latitudeDeg,
    siderealAngleRad: siderealAngleRad + step,
  );
  final longitudeDelta = _normalizeSignedDegrees(after - before);
  final siderealDeltaDeg = step * 180 / pi;
  return longitudeDelta / (2 * siderealDeltaDeg);
}

double _ascendantLongitudeAtSiderealAngle({
  required double latitudeDeg,
  required double siderealAngleRad,
}) {
  final latitudeRad = latitudeDeg * pi / 180;
  final zenith = _Vector3(
    cos(latitudeRad) * cos(siderealAngleRad),
    cos(latitudeRad) * sin(siderealAngleRad),
    sin(latitudeRad),
  );
  final east = _Vector3(-sin(siderealAngleRad), cos(siderealAngleRad), 0);
  final risingPoint = _eastIntersectionPoint(zenith: zenith, east: east);
  return _eclipticLongitudeFromVector(risingPoint);
}

double _eclipticLongitudeFromVector(_Vector3 vector) {
  final y =
      vector.y * cos(_eclipticObliquityRad) +
      vector.z * sin(_eclipticObliquityRad);
  final longitude = atan2(y, vector.x);
  return _normalizeDegrees(longitude * 180 / pi);
}

double _normalizeDegrees(double degrees) {
  final normalized = degrees % 360;
  return normalized < 0 ? normalized + 360 : normalized;
}

double _normalizeRadians(double radians) {
  final normalized = radians % (2 * pi);
  return normalized < 0 ? normalized + 2 * pi : normalized;
}

double _normalizeSignedDegrees(double degrees) {
  final normalized = _normalizeDegrees(degrees);
  return normalized > 180 ? normalized - 360 : normalized;
}

double _circularDistanceDegrees(double a, double b) {
  return _normalizeSignedDegrees(a - b).abs();
}

class _Vector3 {
  final double x;
  final double y;
  final double z;

  const _Vector3(this.x, this.y, this.z);

  _Vector3 operator -() => _Vector3(-x, -y, -z);

  double get length => sqrt(x * x + y * y + z * z);

  _Vector3 get normalized {
    final factor = length;
    return _Vector3(x / factor, y / factor, z / factor);
  }

  _Vector3 cross(_Vector3 other) {
    return _Vector3(
      y * other.z - z * other.y,
      z * other.x - x * other.z,
      x * other.y - y * other.x,
    );
  }

  double dot(_Vector3 other) {
    return x * other.x + y * other.y + z * other.z;
  }
}
