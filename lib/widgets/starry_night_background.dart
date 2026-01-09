import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'dart:typed_data';
import 'dart:ui' as ui;
import '../constants/colors.dart';

class StarryNightBackground extends StatefulWidget {
  final Widget? child;
  final bool showPlanet;
  final bool subtle;

  const StarryNightBackground({
    super.key,
    this.child,
    this.showPlanet = true,
    this.subtle = false,
  });

  @override
  State<StarryNightBackground> createState() => _StarryNightBackgroundState();
}

class _StarLayer {
  final Float32List basePositions;
  final double starSize;
  final Color color;
  final double speedMultiplier;
  final double phaseOffset;

  _StarLayer({
    required int count,
    required this.starSize,
    required this.color,
    required this.speedMultiplier,
    required this.phaseOffset,
    required int seed,
    required Size size,
    required bool subtle,
  }) : basePositions = _generatePositions(count, seed, size, subtle);

  static Float32List _generatePositions(
    int count,
    int seed,
    Size size,
    bool subtle,
  ) {
    final random = math.Random(seed);
    final positions = Float32List(count * 2);
    final widthMultiplier = subtle ? 1.0 : 1.6;
    final heightMultiplier = subtle ? 1.0 : 2.0;

    for (int i = 0; i < count; i++) {
      positions[i * 2] = random.nextDouble() * size.width * widthMultiplier;
      positions[i * 2 + 1] = random.nextDouble() * size.height * heightMultiplier;
    }
    return positions;
  }
}

class _PlanetGeometry {
  static const double horizonApexFactor = 0.30;
  static const double radiusFactor = 1.8;

  static double getHorizonApexY(Size size) => size.height * horizonApexFactor;
  static double getPlanetRadius(Size size) => size.width * radiusFactor;
  static Offset getCenter(Size size) {
    final horizonApexY = getHorizonApexY(size);
    final planetRadius = getPlanetRadius(size);
    return Offset(size.width / 2, planetRadius + horizonApexY);
  }
}

class _StarryNightBackgroundState extends State<StarryNightBackground>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  List<_StarLayer>? _starLayers;
  Size? _lastSize;
  bool? _lastIsDark;

  ui.Image? _cachedPlanetImage;
  Size? _cachedImageSize;
  bool? _cachedImageIsDark;
  bool _isRenderingCache = false;

  @override
  void initState() {
    super.initState();

    final duration = widget.subtle
        ? const Duration(minutes: 3)
        : const Duration(seconds: 60);

    _animationController = AnimationController(
      duration: duration,
      vsync: this,
    );

    if (!widget.subtle) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted) {
          _animationController.repeat();
        }
      });
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    _cachedPlanetImage?.dispose();
    super.dispose();
  }

  List<Color> _getBackgroundColors(bool isDark) {
    if (isDark) {
      return widget.subtle
          ? [Colors.black, Colors.black]
          : [AppColors.darkBackground, AppColors.darkBackground];
    }
    return [
      AppColors.auroraTop,
      AppColors.auroraMiddle,
      AppColors.lightBackground,
    ];
  }

  void _initializeStarLayers(Size size, bool isDark) {
    if (_lastSize == size && _lastIsDark == isDark) return;
    _lastSize = size;
    _lastIsDark = isDark;

    _starLayers = [
      _StarLayer(
        count: widget.subtle ? 60 : 100,
        starSize: widget.subtle ? 0.6 : 1.0,
        color: isDark
            ? (widget.subtle
                ? Colors.white.withValues(alpha: 0.12)
                : Colors.white)
            : AppColors.lightSecondary.withValues(alpha: 0.4),
        speedMultiplier: 1.0,
        phaseOffset: 0.0,
        seed: 1,
        size: size,
        subtle: widget.subtle,
      ),
      _StarLayer(
        count: widget.subtle ? 35 : 30,
        starSize: widget.subtle ? 1.0 : 1.5,
        color: isDark
            ? (widget.subtle
                ? Colors.white.withValues(alpha: 0.18)
                : Colors.white)
            : AppColors.lightSecondary.withValues(alpha: 0.5),
        speedMultiplier: 0.5,
        phaseOffset: 0.33,
        seed: 2,
        size: size,
        subtle: widget.subtle,
      ),
      _StarLayer(
        count: widget.subtle ? 20 : 20,
        starSize: widget.subtle ? 1.4 : 3.0,
        color: isDark
            ? (widget.subtle
                ? Colors.white.withValues(alpha: 0.25)
                : Colors.white)
            : AppColors.lightSecondary.withValues(alpha: 0.6),
        speedMultiplier: 0.33,
        phaseOffset: 0.66,
        seed: 3,
        size: size,
        subtle: widget.subtle,
      ),
    ];
  }

  Future<void> _renderPlanetCache(Size size, bool isDark, double dpr) async {
    if (_isRenderingCache) return;
    if (_cachedImageSize == size && _cachedImageIsDark == isDark && _cachedPlanetImage != null) {
      return;
    }

    _isRenderingCache = true;

    final imageWidth = (size.width * dpr).ceil();
    final imageHeight = (size.height * dpr).ceil();

    final recorder = ui.PictureRecorder();
    final canvas = Canvas(
      recorder,
      Rect.fromLTWH(0, 0, imageWidth.toDouble(), imageHeight.toDouble()),
    );

    canvas.scale(dpr);

    _paintBackground(canvas, size, isDark);

    if (widget.showPlanet) {
      PlanetHorizonPainter(isDark: isDark).paint(canvas, size);
    }

    final picture = recorder.endRecording();
    final image = await picture.toImage(imageWidth, imageHeight);
    picture.dispose();

    if (mounted) {
      final oldImage = _cachedPlanetImage;
      setState(() {
        _cachedPlanetImage = image;
        _cachedImageSize = size;
        _cachedImageIsDark = isDark;
        _isRenderingCache = false;
      });
      oldImage?.dispose();
    } else {
      image.dispose();
      _isRenderingCache = false;
    }
  }

  void _paintBackground(Canvas canvas, Size size, bool isDark) {
    final gradient = LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: _getBackgroundColors(isDark),
    );

    final paint = Paint()
      ..shader = gradient.createShader(Rect.fromLTWH(0, 0, size.width, size.height));

    canvas.drawRect(Rect.fromLTWH(0, 0, size.width, size.height), paint);
  }

  @override
  Widget build(BuildContext context) {
    final bool isDark = Theme.of(context).brightness == Brightness.dark;
    final dpr = MediaQuery.of(context).devicePixelRatio;

    return LayoutBuilder(
      builder: (context, constraints) {
        final size = Size(constraints.maxWidth, constraints.maxHeight);
        _initializeStarLayers(size, isDark);

        final needsCacheUpdate = _cachedImageSize != size ||
            _cachedImageIsDark != isDark ||
            _cachedPlanetImage == null;

        if (needsCacheUpdate && !_isRenderingCache) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            if (mounted) {
              _renderPlanetCache(size, isDark, dpr);
            }
          });
        }

        return Stack(
          children: [
            if (_cachedPlanetImage != null)
              RawImage(
                image: _cachedPlanetImage,
                width: size.width,
                height: size.height,
                fit: BoxFit.fill,
              )
            else
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: _getBackgroundColors(isDark),
                  ),
                ),
                child: widget.showPlanet
                    ? CustomPaint(
                        size: size,
                        isComplex: true,
                        willChange: false,
                        painter: PlanetHorizonPainter(isDark: isDark),
                      )
                    : null,
              ),
            if (_starLayers != null)
              RepaintBoundary(
                key: ValueKey('stars_$isDark'),
                child: ClipPath(
                  clipper: widget.showPlanet ? _PlanetExclusionClipper() : null,
                  child: CustomPaint(
                    size: size,
                    isComplex: true,
                    willChange: !widget.subtle,
                    painter: _OptimizedStarPainter(
                      layers: _starLayers!,
                      controller: widget.subtle ? null : _animationController,
                      canvasSize: size,
                      subtle: widget.subtle,
                    ),
                  ),
                ),
              ),
            if (widget.child != null) widget.child!,
          ],
        );
      },
    );
  }
}

class _PlanetExclusionClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final planetRadius = _PlanetGeometry.getPlanetRadius(size);
    final center = _PlanetGeometry.getCenter(size);

    final screenPath = Path()..addRect(Rect.fromLTWH(0, 0, size.width, size.height));
    final planetPath = Path()..addOval(Rect.fromCircle(center: center, radius: planetRadius));

    return Path.combine(PathOperation.difference, screenPath, planetPath);
  }

  @override
  bool shouldReclip(_PlanetExclusionClipper oldClipper) => false;
}

class _OptimizedStarPainter extends CustomPainter {
  final List<_StarLayer> layers;
  final AnimationController? controller;
  final Size canvasSize;
  final bool subtle;

  _OptimizedStarPainter({
    required this.layers,
    required this.controller,
    required this.canvasSize,
    required this.subtle,
  }) : super(repaint: controller);

  @override
  void paint(Canvas canvas, Size size) {
    final animationValue = controller?.value ?? 0.0;

    for (final layer in layers) {
      final layerAnimValue = subtle
          ? 0.0
          : (animationValue * layer.speedMultiplier + layer.phaseOffset) % 1.0;

      final visiblePositions = _computeVisiblePositions(layer, layerAnimValue);
      if (visiblePositions.isEmpty) continue;

      final paint = Paint()
        ..style = PaintingStyle.fill
        ..color = layer.color;

      for (int i = 0; i < visiblePositions.length ~/ 2; i++) {
        canvas.drawCircle(
          Offset(visiblePositions[i * 2], visiblePositions[i * 2 + 1]),
          layer.starSize,
          paint,
        );
      }
    }
  }

  Float32List _computeVisiblePositions(_StarLayer layer, double layerAnimValue) {
    final yOffset = layerAnimValue * canvasSize.height * 2;
    final visible = <double>[];
    final starSize = layer.starSize;
    final heightBound = canvasSize.height * 2;

    for (int i = 0; i < layer.basePositions.length ~/ 2; i++) {
      final x = layer.basePositions[i * 2];
      var y = layer.basePositions[i * 2 + 1] - yOffset;

      if (y < 0) y += heightBound;

      if (y >= -starSize &&
          y <= canvasSize.height + starSize &&
          x >= -starSize &&
          x <= canvasSize.width + starSize) {
        visible.add(x);
        visible.add(y);
      }
    }
    return Float32List.fromList(visible);
  }

  @override
  bool shouldRepaint(_OptimizedStarPainter oldDelegate) {
    return oldDelegate.layers != layers ||
        oldDelegate.canvasSize != canvasSize ||
        oldDelegate.subtle != subtle;
  }
}

class _PlanetTheme {
  final Color primaryGlow;
  final Color secondaryGlow;
  final Color planetColor;
  final Color trailColor;
  final double haloAlpha1;
  final double haloAlpha2;
  final double trailAlpha1;
  final double trailAlpha2;
  final double rimAlpha;
  final double innerShadowAlpha;
  final double frontRimAlpha;

  const _PlanetTheme({
    required this.primaryGlow,
    required this.secondaryGlow,
    required this.planetColor,
    required this.trailColor,
    required this.haloAlpha1,
    required this.haloAlpha2,
    required this.trailAlpha1,
    required this.trailAlpha2,
    required this.rimAlpha,
    required this.innerShadowAlpha,
    required this.frontRimAlpha,
  });
}

class PlanetHorizonPainter extends CustomPainter {
  final bool isDark;

  const PlanetHorizonPainter({this.isDark = true});

  @override
  void paint(Canvas canvas, Size size) {
    final planetRadius = _PlanetGeometry.getPlanetRadius(size);
    final center = _PlanetGeometry.getCenter(size);
    final double minDim = math.min(size.width, size.height);

    final _PlanetTheme theme = isDark
        ? _PlanetTheme(
            primaryGlow: AppColors.cyanBlue,
            secondaryGlow: AppColors.mysticalPurple,
            planetColor: Colors.black,
            trailColor: AppColors.cyanBlue,
            haloAlpha1: 0.5,
            haloAlpha2: 0.4,
            trailAlpha1: 0.27,
            trailAlpha2: 0.13,
            rimAlpha: 0.6,
            innerShadowAlpha: 0.85,
            frontRimAlpha: 0.5,
          )
        : _PlanetTheme(
            primaryGlow: AppColors.goldenGlow,
            secondaryGlow: AppColors.amberGlow,
            planetColor: AppColors.emeraldGreen,
            trailColor: AppColors.goldenGlow,
            haloAlpha1: 1.0,
            haloAlpha2: 1.0,
            trailAlpha1: 1.0,
            trailAlpha2: 0.8,
            rimAlpha: 1.0,
            innerShadowAlpha: 1.0,
            frontRimAlpha: 1.0,
          );

    _paintAtmosphericHalos(canvas, size, center, planetRadius, minDim, theme);
    _paintRimGlow(canvas, center, planetRadius, theme);

    if (isDark) {
      final Paint planetPaint = Paint()
        ..style = PaintingStyle.fill
        ..color = theme.planetColor;
      canvas.drawCircle(center, planetRadius, planetPaint);
    } else {
      final Paint planetPaint = Paint()
        ..style = PaintingStyle.fill
        ..shader = RadialGradient(
          center: const Alignment(0.0, -0.8),
          radius: 0.6,
          colors: [
            AppColors.lightGreen,
            AppColors.emeraldGreen,
            AppColors.cobaltBlue,
            AppColors.navyBlue,
            AppColors.navyBlue,
          ],
          stops: const [0.0, 0.2, 0.35, 0.5, 0.5],
        ).createShader(Rect.fromCircle(center: center, radius: planetRadius));
      canvas.drawCircle(center, planetRadius, planetPaint);
    }

    _paintInnerShadow(canvas, center, planetRadius, minDim, theme);
    _paintForegroundRim(canvas, center, planetRadius, minDim, theme);
  }

  void _paintAtmosphericHalos(
    Canvas canvas,
    Size size,
    Offset center,
    double planetRadius,
    double minDim,
    _PlanetTheme theme,
  ) {
    canvas.save();
    final Path screenPath = Path()
      ..addRect(Rect.fromLTWH(0, 0, size.width, size.height));
    final Path planetPath = Path()
      ..addOval(Rect.fromCircle(center: center, radius: planetRadius));
    final Path outsidePlanet = Path.combine(
      PathOperation.difference,
      screenPath,
      planetPath,
    );
    canvas.clipPath(outsidePlanet);

    final double haloThickness = minDim * 0.08;
    final Paint outerHaloPaint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = haloThickness
      ..color = theme.secondaryGlow.withValues(alpha: theme.haloAlpha1)
      ..maskFilter = MaskFilter.blur(BlurStyle.normal, haloThickness * 0.22)
      ..blendMode = BlendMode.screen;
    canvas.drawCircle(
      center,
      planetRadius + haloThickness * 0.25,
      outerHaloPaint,
    );

    final double midThickness = minDim * 0.045;
    final Paint midHaloPaint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = midThickness
      ..color = theme.primaryGlow.withValues(alpha: theme.haloAlpha2)
      ..maskFilter = MaskFilter.blur(BlurStyle.normal, midThickness * 0.28)
      ..blendMode = BlendMode.screen;
    canvas.drawCircle(center, planetRadius + midThickness * 0.30, midHaloPaint);

    final double trailThickness1 = minDim * 0.12;
    final Paint trailHaloPaint1 = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = trailThickness1
      ..color = theme.trailColor.withValues(alpha: theme.trailAlpha1)
      ..maskFilter = MaskFilter.blur(BlurStyle.normal, trailThickness1 * 0.50)
      ..blendMode = isDark ? BlendMode.screen : BlendMode.multiply;
    canvas.drawCircle(
      center,
      planetRadius + trailThickness1 * 0.80,
      trailHaloPaint1,
    );

    final double trailThickness2 = minDim * 0.18;
    final Paint trailHaloPaint2 = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = trailThickness2
      ..color = theme.trailColor.withValues(alpha: theme.trailAlpha2)
      ..maskFilter = MaskFilter.blur(BlurStyle.normal, trailThickness2 * 0.60)
      ..blendMode = isDark ? BlendMode.screen : BlendMode.multiply;
    canvas.drawCircle(
      center,
      planetRadius + trailThickness2 * 0.90,
      trailHaloPaint2,
    );
    canvas.restore();
  }

  void _paintRimGlow(
    Canvas canvas,
    Offset center,
    double planetRadius,
    _PlanetTheme theme,
  ) {
    final double rimRadius = planetRadius * 1.012;
    final Paint rimPaint = Paint()
      ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 10)
      ..blendMode = BlendMode.screen
      ..shader = RadialGradient(
        center: Alignment.center,
        radius: 1.0,
        colors: [
          Colors.transparent,
          theme.primaryGlow.withValues(alpha: theme.rimAlpha),
          theme.primaryGlow.withValues(alpha: theme.rimAlpha),
          Colors.transparent,
        ],
        stops: const [0.956, 0.975, 0.992, 1.0],
      ).createShader(Rect.fromCircle(center: center, radius: rimRadius));
    canvas.drawCircle(center, rimRadius, rimPaint);
  }

  void _paintInnerShadow(
    Canvas canvas,
    Offset center,
    double planetRadius,
    double minDim,
    _PlanetTheme theme,
  ) {
    final double innerShadowWidth = minDim * 0.035;
    final Paint innerShadowPaint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = innerShadowWidth
      ..color = theme.primaryGlow.withValues(alpha: theme.innerShadowAlpha)
      ..maskFilter = MaskFilter.blur(BlurStyle.normal, innerShadowWidth * 0.85)
      ..blendMode = BlendMode.srcOver;
    canvas.drawCircle(
      center,
      planetRadius - innerShadowWidth * 1.2,
      innerShadowPaint,
    );
  }

  void _paintForegroundRim(
    Canvas canvas,
    Offset center,
    double planetRadius,
    double minDim,
    _PlanetTheme theme,
  ) {
    final double frontRimWidth = minDim * 0.016;
    final Paint frontRimPaint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = frontRimWidth
      ..color = theme.primaryGlow.withValues(alpha: theme.frontRimAlpha)
      ..maskFilter = MaskFilter.blur(BlurStyle.normal, frontRimWidth * 0.6)
      ..blendMode = BlendMode.screen;
    canvas.drawCircle(
      center,
      planetRadius - frontRimWidth * 0.2,
      frontRimPaint,
    );
  }

  @override
  bool shouldRepaint(covariant PlanetHorizonPainter oldDelegate) => false;
}
