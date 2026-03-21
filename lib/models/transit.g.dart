// SPDX-FileCopyrightText: 2026 Arcangelo Massari <info@arcangelomassari.com>
//
// SPDX-License-Identifier: AGPL-3.0-or-later

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transit.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TransitLocation _$TransitLocationFromJson(Map<String, dynamic> json) =>
    TransitLocation(
      place: json['place'] as String,
      latitude: (json['latitude'] as num).toDouble(),
      longitude: (json['longitude'] as num).toDouble(),
      timezone: json['timezone'] as String,
    );

Map<String, dynamic> _$TransitLocationToJson(TransitLocation instance) =>
    <String, dynamic>{
      'place': instance.place,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'timezone': instance.timezone,
    };

DailyTransitReading _$DailyTransitReadingFromJson(Map<String, dynamic> json) =>
    DailyTransitReading(
      readingId: (json['reading_id'] as num).toInt(),
      reading: json['reading'] as String,
      date: DateTime.parse(json['date'] as String),
      location: TransitLocation.fromJson(
        json['location'] as Map<String, dynamic>,
      ),
      version: json['version'] as String?,
      createdOn: json['created_on'] == null
          ? null
          : DateTime.parse(json['created_on'] as String),
      cached: json['cached'] as bool?,
    );

Map<String, dynamic> _$DailyTransitReadingToJson(
  DailyTransitReading instance,
) => <String, dynamic>{
  'reading_id': instance.readingId,
  'reading': instance.reading,
  'date': instance.date.toIso8601String(),
  'location': instance.location,
  'version': instance.version,
  'created_on': instance.createdOn?.toIso8601String(),
  'cached': instance.cached,
};

MonthlyTransitReading _$MonthlyTransitReadingFromJson(
  Map<String, dynamic> json,
) => MonthlyTransitReading(
  readingId: (json['reading_id'] as num).toInt(),
  reading: json['reading'] as String,
  year: (json['year'] as num).toInt(),
  month: (json['month'] as num).toInt(),
  location: TransitLocation.fromJson(json['location'] as Map<String, dynamic>),
  version: json['version'] as String?,
  createdOn: json['created_on'] == null
      ? null
      : DateTime.parse(json['created_on'] as String),
  cached: json['cached'] as bool?,
);

Map<String, dynamic> _$MonthlyTransitReadingToJson(
  MonthlyTransitReading instance,
) => <String, dynamic>{
  'reading_id': instance.readingId,
  'reading': instance.reading,
  'year': instance.year,
  'month': instance.month,
  'location': instance.location,
  'version': instance.version,
  'created_on': instance.createdOn?.toIso8601String(),
  'cached': instance.cached,
};

TransitRequest _$TransitRequestFromJson(Map<String, dynamic> json) =>
    TransitRequest(
      birthChartId: (json['birth_chart_id'] as num).toInt(),
      date: json['date'] as String?,
      year: (json['year'] as num?)?.toInt(),
      month: (json['month'] as num?)?.toInt(),
      location: json['location'] as Map<String, dynamic>,
    );

Map<String, dynamic> _$TransitRequestToJson(TransitRequest instance) =>
    <String, dynamic>{
      'birth_chart_id': instance.birthChartId,
      'date': instance.date,
      'year': instance.year,
      'month': instance.month,
      'location': instance.location,
    };

DailyTransitSummary _$DailyTransitSummaryFromJson(Map<String, dynamic> json) =>
    DailyTransitSummary(
      id: (json['id'] as num).toInt(),
      date: DateTime.parse(json['date'] as String),
      place: json['place'] as String,
      birthChartName: json['birth_chart_name'] as String?,
      birthChartId: (json['birth_chart_id'] as num).toInt(),
      hasReading: json['has_reading'] as bool,
      readingLanguage: json['reading_language'] as String?,
      createdOn: DateTime.parse(json['created_on'] as String),
    );

Map<String, dynamic> _$DailyTransitSummaryToJson(
  DailyTransitSummary instance,
) => <String, dynamic>{
  'id': instance.id,
  'date': instance.date.toIso8601String(),
  'place': instance.place,
  'birth_chart_name': instance.birthChartName,
  'birth_chart_id': instance.birthChartId,
  'has_reading': instance.hasReading,
  'reading_language': instance.readingLanguage,
  'created_on': instance.createdOn.toIso8601String(),
};

MonthlyTransitSummary _$MonthlyTransitSummaryFromJson(
  Map<String, dynamic> json,
) => MonthlyTransitSummary(
  id: (json['id'] as num).toInt(),
  year: (json['year'] as num).toInt(),
  month: (json['month'] as num).toInt(),
  place: json['place'] as String,
  birthChartName: json['birth_chart_name'] as String?,
  birthChartId: (json['birth_chart_id'] as num).toInt(),
  hasReading: json['has_reading'] as bool,
  readingLanguage: json['reading_language'] as String?,
  createdOn: DateTime.parse(json['created_on'] as String),
);

Map<String, dynamic> _$MonthlyTransitSummaryToJson(
  MonthlyTransitSummary instance,
) => <String, dynamic>{
  'id': instance.id,
  'year': instance.year,
  'month': instance.month,
  'place': instance.place,
  'birth_chart_name': instance.birthChartName,
  'birth_chart_id': instance.birthChartId,
  'has_reading': instance.hasReading,
  'reading_language': instance.readingLanguage,
  'created_on': instance.createdOn.toIso8601String(),
};
