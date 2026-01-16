import 'package:flutter/material.dart';
import 'dart:async';
import '../l10n/app_localizations.dart';
import '../widgets/starry_night_background.dart';
import '../widgets/gradient_button.dart';
import '../constants/text_styles.dart';

class HomeScreen extends StatefulWidget {
  final VoidCallback? onGetStarted;

  const HomeScreen({super.key, this.onGetStarted});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  late AnimationController _letterSpacingController;
  late AnimationController _subtitleController;
  late Animation<double> _titleAnimation;
  late Animation<double> _titleOpacityAnimation;
  late Animation<double> _titleLetterSpacingAnimation;
  late List<Animation<double>> _subtitleAnimations;
  late List<Animation<double>> _subtitleOpacityAnimations;
  Timer? _animationDelayTimer;
  List<String> _subtitleParts = [];

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final l10n = AppLocalizations.of(context)!;
    _subtitleParts = [
      l10n.subtitlePart1,
      l10n.subtitlePart2,
      l10n.subtitlePart3,
    ];
  }

  @override
  void initState() {
    super.initState();

    _letterSpacingController = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    );

    _subtitleController = AnimationController(
      duration: const Duration(seconds: 6),
      vsync: this,
    );

    _titleAnimation = Tween<double>(begin: -26.0, end: 0.0).animate(
      CurvedAnimation(
        parent: _letterSpacingController,
        curve: const Interval(0.0, 0.4, curve: Curves.easeOut),
      ),
    );

    _titleOpacityAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _letterSpacingController,
        curve: const Interval(0.0, 0.5, curve: Curves.easeOut),
      ),
    );

    _titleLetterSpacingAnimation = TweenSequence<double>([
      TweenSequenceItem(
        tween: Tween<double>(
          begin: 8.0,
          end: 1.0,
        ).chain(CurveTween(curve: Curves.easeInOut)),
        weight: 60,
      ),
      TweenSequenceItem(
        tween: Tween<double>(
          begin: 1.0,
          end: 8.0,
        ).chain(CurveTween(curve: Curves.easeInOut)),
        weight: 40,
      ),
    ]).animate(_letterSpacingController);

    _subtitleAnimations = [
      Tween<double>(begin: 0.0, end: 0.0).animate(
        CurvedAnimation(
          parent: _subtitleController,
          curve: const Interval(0.15, 1.0, curve: Curves.ease),
        ),
      ),

      Tween<double>(begin: 0.0, end: 0.0).animate(
        CurvedAnimation(
          parent: _subtitleController,
          curve: const Interval(0.25, 0.45, curve: Curves.ease),
        ),
      ),

      Tween<double>(begin: 0.0, end: 0.0).animate(
        CurvedAnimation(
          parent: _subtitleController,
          curve: const Interval(0.35, 0.55, curve: Curves.ease),
        ),
      ),
    ];

    _subtitleOpacityAnimations = [
      Tween<double>(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(
          parent: _subtitleController,
          curve: const Interval(0.15, 0.35, curve: Curves.ease),
        ),
      ),

      Tween<double>(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(
          parent: _subtitleController,
          curve: const Interval(0.25, 0.45, curve: Curves.ease),
        ),
      ),

      Tween<double>(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(
          parent: _subtitleController,
          curve: const Interval(0.35, 0.55, curve: Curves.ease),
        ),
      ),
    ];

    // Defer animation start to after first frame renders
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _animationDelayTimer = Timer(const Duration(milliseconds: 150), () {
        if (mounted) {
          _letterSpacingController.forward();
          _subtitleController.forward();
        }
      });
    });
  }

  @override
  void dispose() {
    _animationDelayTimer?.cancel();
    _letterSpacingController.dispose();
    _subtitleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isLandscape = size.width > size.height;
    final isMobile = size.shortestSide < 600;

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: StarryNightBackground(
        showPlanet: true,
        subtle: false,
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.only(
              left: 24.0,
              right: 24.0,
              top: isLandscape && isMobile ? 8.0 : 0,
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: isLandscape && isMobile
                    ? MainAxisAlignment.start
                    : MainAxisAlignment.center,
                children: [
                  // Animated title
                  AnimatedBuilder(
                    animation: _letterSpacingController,
                    builder: (context, child) {
                      return Transform.translate(
                        offset: Offset(0, _titleAnimation.value),
                        child: Opacity(
                          opacity: _titleOpacityAnimation.value,
                          child: Text(
                            'ASTROGODS',
                            style:
                                (isLandscape && isMobile
                                        ? AppTextStyles.getH3Style(context).copyWith(fontSize: 36)
                                        : isMobile
                                            ? AppTextStyles.getH2Style(context)
                                            : AppTextStyles.getHeroStyle(context))
                                    .copyWith(
                                      letterSpacing:
                                          _titleLetterSpacingAnimation.value,
                                      color: Theme.of(context).colorScheme.onSurface,
                                      shadows: [
                                        Shadow(
                                          offset: const Offset(2, 2),
                                          blurRadius: 4,
                                          color: Theme.of(context).colorScheme.shadow.withValues(alpha: 0.5),
                                        ),
                                      ],
                                    ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      );
                    },
                  ),
                  SizedBox(height: isLandscape && isMobile ? 20 : 40),
                  // Animated subtitle with three parts on same line
                  AnimatedBuilder(
                    animation: _subtitleController,
                    builder: (context, child) {
                      return Wrap(
                        alignment: WrapAlignment.center,
                        children: [
                          for (int i = 0; i < _subtitleParts.length; i++) ...[
                            Transform.translate(
                              offset: Offset(0, _subtitleAnimations[i].value),
                              child: Opacity(
                                opacity: _subtitleOpacityAnimations[i].value,
                                child: Text(
                                  _subtitleParts[i],
                                  style:
                                      (isMobile
                                              ? AppTextStyles.getBodyLargeStyle(context)
                                              : AppTextStyles.getSubtitleLargeStyle(context))
                                          .copyWith(
                                            color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.8),
                                            letterSpacing: 4.0,
                                          ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                            if (i < _subtitleParts.length - 1)
                              const SizedBox(width: 8),
                          ],
                        ],
                      );
                    },
                  ),
                  SizedBox(height: isLandscape && isMobile ? 40 : 80),
                  // Get started button
                  GradientButton(
                    text: AppLocalizations.of(context)!.getStarted,
                    onPressed: widget.onGetStarted ?? () {},
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
