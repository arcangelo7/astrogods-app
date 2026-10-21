import 'package:material_ui/material_ui.dart';
import 'package:flutter/services.dart';

import '../constants/text_styles.dart';
import '../constants/colors.dart';

class AppTheme {
  static const Color _seedColor = AppColors.seedColor;
  static const _dialogTheme = DialogThemeData(
    insetPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 24),
  );

  static ThemeData buildDarkTheme(ColorScheme scheme) {
    return ThemeData(
      fontFamily: AppTextStyles.fontFamily,
      fontFamilyFallback: AppTextStyles.fontFamilyFallback,
      dialogTheme: _dialogTheme,
      useMaterial3: true,
      colorScheme: scheme,
      scaffoldBackgroundColor: scheme.surface,
      canvasColor: scheme.surface,
      appBarTheme: AppBarTheme(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        scrolledUnderElevation: 0,
        surfaceTintColor: Colors.transparent,
        foregroundColor: scheme.onSurface,
        iconTheme: IconThemeData(color: scheme.onSurface),
        titleTextStyle: TextStyle(
          color: scheme.onSurface,
          fontSize: AppTextStyles.bodyLargeSize,
          fontWeight: AppTextStyles.semibold,
        ),
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.light,
          statusBarBrightness: Brightness.dark,
          systemNavigationBarColor: Colors.transparent,
          systemNavigationBarIconBrightness: Brightness.light,
        ),
      ),
      drawerTheme: DrawerThemeData(
        backgroundColor: scheme.surface,
        surfaceTintColor: Colors.transparent,
      ),
      cardTheme: CardThemeData(
        color: scheme.surfaceContainerLow,
        surfaceTintColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
          side: BorderSide(color: scheme.primary.withValues(alpha: 0.2)),
        ),
      ),
      dividerTheme: DividerThemeData(
        color: scheme.outline.withValues(alpha: 0.15),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style:
            OutlinedButton.styleFrom(
              foregroundColor: scheme.onSurface,
              side: BorderSide(color: scheme.outline, width: 1.5),
              textStyle: const TextStyle(
                letterSpacing: AppTextStyles.tightLetterSpacing,
                fontWeight: AppTextStyles.semibold,
              ),
              backgroundColor: Colors.transparent,
            ).copyWith(
              overlayColor: WidgetStateProperty.all(
                scheme.secondary.withValues(alpha: 0.12),
              ),
            ),
      ),
      navigationBarTheme: NavigationBarThemeData(
        backgroundColor: scheme.surface.withValues(alpha: 0.95),
        indicatorColor: scheme.secondary,
        iconTheme: WidgetStateProperty.resolveWith((states) {
          final bool selected = states.contains(WidgetState.selected);
          return IconThemeData(
            color: selected
                ? scheme.onSecondary
                : scheme.onSurface.withValues(alpha: 0.7),
          );
        }),
        labelTextStyle: WidgetStateProperty.resolveWith((states) {
          final bool selected = states.contains(WidgetState.selected);
          return TextStyle(
            color: selected
                ? scheme.onSurface
                : scheme.onSurface.withValues(alpha: 0.7),
            fontWeight: selected ? AppTextStyles.bold : AppTextStyles.medium,
          );
        }),
      ),
      chipTheme: _chipTheme(scheme, backgroundAlpha: 0.1),
      iconTheme: IconThemeData(color: scheme.onSurface.withValues(alpha: 0.7)),
    );
  }

  static ThemeData buildLightTheme(ColorScheme scheme) {
    return ThemeData(
      fontFamily: AppTextStyles.fontFamily,
      fontFamilyFallback: AppTextStyles.fontFamilyFallback,
      dialogTheme: _dialogTheme,
      useMaterial3: true,
      colorScheme: scheme,
      scaffoldBackgroundColor: scheme.surface,
      canvasColor: scheme.surface,
      appBarTheme: AppBarTheme(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        scrolledUnderElevation: 0,
        surfaceTintColor: Colors.transparent,
        foregroundColor: scheme.onSurface,
        iconTheme: IconThemeData(color: scheme.onSurface),
        titleTextStyle: TextStyle(
          color: scheme.onSurface,
          fontSize: AppTextStyles.bodyLargeSize,
          fontWeight: AppTextStyles.semibold,
        ),
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.dark,
          statusBarBrightness: Brightness.light,
          systemNavigationBarColor: Colors.transparent,
          systemNavigationBarIconBrightness: Brightness.dark,
        ),
      ),
      drawerTheme: DrawerThemeData(
        backgroundColor: scheme.surface,
        surfaceTintColor: Colors.transparent,
      ),
      cardTheme: CardThemeData(
        color: scheme.surfaceContainerLow,
        surfaceTintColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
          side: BorderSide(color: scheme.primary.withValues(alpha: 0.15)),
        ),
      ),
      dividerTheme: DividerThemeData(
        color: scheme.outline.withValues(alpha: 0.1),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style:
            OutlinedButton.styleFrom(
              foregroundColor: scheme.primary,
              side: BorderSide(color: scheme.primary, width: 1.5),
              textStyle: const TextStyle(
                letterSpacing: AppTextStyles.tightLetterSpacing,
                fontWeight: AppTextStyles.semibold,
              ),
              backgroundColor: Colors.transparent,
            ).copyWith(
              overlayColor: WidgetStateProperty.all(
                scheme.primary.withValues(alpha: 0.08),
              ),
            ),
      ),
      navigationBarTheme: NavigationBarThemeData(
        backgroundColor: scheme.surface.withValues(alpha: 0.95),
        indicatorColor: scheme.primary,
        iconTheme: WidgetStateProperty.resolveWith((states) {
          final bool selected = states.contains(WidgetState.selected);
          return IconThemeData(
            color: selected
                ? scheme.onPrimary
                : scheme.onSurface.withValues(alpha: 0.7),
          );
        }),
        labelTextStyle: WidgetStateProperty.resolveWith((states) {
          final bool selected = states.contains(WidgetState.selected);
          return TextStyle(
            color: selected
                ? scheme.primary
                : scheme.onSurface.withValues(alpha: 0.7),
            fontWeight: selected ? AppTextStyles.bold : AppTextStyles.medium,
          );
        }),
      ),
      chipTheme: _chipTheme(scheme, backgroundAlpha: 0.05),
      iconTheme: IconThemeData(color: scheme.onSurface.withValues(alpha: 0.7)),
    );
  }

  static ChipThemeData _chipTheme(
    ColorScheme scheme, {
    required double backgroundAlpha,
  }) {
    return ChipThemeData(
      backgroundColor: scheme.primary.withValues(alpha: backgroundAlpha),
      selectedColor: scheme.primary,
      showCheckmark: false,
      // Theme animations lerp a WidgetStateColor into a plain color, so the
      // selected label color is set by ChoiceChipGroup.
      labelStyle: TextStyle(color: scheme.onSurface),
    );
  }

  static ColorScheme get darkScheme =>
      ColorScheme.fromSeed(seedColor: _seedColor, brightness: Brightness.dark);

  static ColorScheme get lightScheme =>
      ColorScheme.fromSeed(seedColor: _seedColor, brightness: Brightness.light);

  static ThemeData get darkTheme => buildDarkTheme(darkScheme);
  static ThemeData get lightTheme => buildLightTheme(lightScheme);
}
