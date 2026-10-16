import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:material_ui/material_ui.dart';
import 'package:liquid_glass_widgets/liquid_glass_widgets.dart';

class GlassNavigationItem {
  final IconData icon;
  final IconData selectedIcon;
  final String label;

  const GlassNavigationItem({
    required this.icon,
    required this.selectedIcon,
    required this.label,
  });
}

class GlassNavigationDock extends StatelessWidget {
  final int selectedIndex;
  final List<GlassNavigationItem> items;
  final ValueChanged<int> onItemSelected;

  const GlassNavigationDock({
    super.key,
    required this.selectedIndex,
    required this.items,
    required this.onItemSelected,
  });

  bool get _useLiquidGlass =>
      !kIsWeb && defaultTargetPlatform == TargetPlatform.iOS;

  @override
  Widget build(BuildContext context) {
    if (_useLiquidGlass) {
      return _buildLiquidGlassDock(context);
    }
    return _buildFallbackDock(context);
  }

  Widget _buildLiquidGlassDock(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final colorScheme = Theme.of(context).colorScheme;

    return GlassTabBar.bottom(
      selectedIndex: selectedIndex,
      onTabSelected: onItemSelected,
      horizontalPadding: 12,
      verticalPadding: 16,
      barHeight: 64,
      selectedIconColor: isDark ? Colors.white : colorScheme.primary,
      unselectedIconColor: isDark
          ? Colors.white54
          : colorScheme.onSurface.withValues(alpha: 0.45),
      indicatorColor: isDark
          ? Colors.white.withValues(alpha: 0.15)
          : colorScheme.primary.withValues(alpha: 0.15),
      maskingQuality: MaskingQuality.high,
      quality: GlassQuality.premium,
      settings: LiquidGlassSettings(
        blur: 12,
        thickness: 20,
        glassColor: isDark
            ? const Color.fromRGBO(255, 255, 255, 0.08)
            : const Color.fromRGBO(255, 255, 255, 0.85),
        lightAngle: 0.75 * 3.14159,
        lightIntensity: 0.7,
        ambientStrength: 0.5,
        saturation: 1.4,
        refractiveIndex: 1.2,
        chromaticAberration: 0.0,
      ),
      tabs: items
          .map(
            (item) => GlassTab(
              icon: Icon(item.icon),
              activeIcon: Icon(item.selectedIcon),
              label: item.label,
            ),
          )
          .toList(),
    );
  }

  Widget _buildFallbackDock(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final bottomPadding = MediaQuery.of(context).padding.bottom;

    return Positioned(
      left: 12,
      right: 12,
      bottom: 16 + bottomPadding,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(28),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
          child: Container(
            height: 64,
            decoration: BoxDecoration(
              color: isDark
                  ? Colors.white.withValues(alpha: 0.12)
                  : Colors.white.withValues(alpha: 0.75),
              borderRadius: BorderRadius.circular(28),
              border: Border.all(
                color: isDark
                    ? Colors.white.withValues(alpha: 0.2)
                    : Colors.white.withValues(alpha: 0.5),
                width: 1,
              ),
              boxShadow: [
                BoxShadow(
                  color: isDark
                      ? Colors.black.withValues(alpha: 0.3)
                      : Colors.black.withValues(alpha: 0.1),
                  blurRadius: 20,
                  offset: const Offset(0, 8),
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(items.length, (index) {
                return Flexible(
                  child: _FallbackNavigationItem(
                    item: items[index],
                    isSelected: selectedIndex == index,
                    onTap: () => onItemSelected(index),
                  ),
                );
              }),
            ),
          ),
        ),
      ),
    );
  }
}

class _FallbackNavigationItem extends StatelessWidget {
  final GlassNavigationItem item;
  final bool isSelected;
  final VoidCallback onTap;

  const _FallbackNavigationItem({
    required this.item,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final colorScheme = Theme.of(context).colorScheme;
    final accentColor = isDark ? colorScheme.secondary : colorScheme.primary;

    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        width: 86,
        height: 48,
        decoration: BoxDecoration(
          color: isSelected
              ? accentColor.withValues(alpha: 0.2)
              : Colors.transparent,
          borderRadius: BorderRadius.circular(21),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              isSelected ? item.selectedIcon : item.icon,
              color: isSelected
                  ? accentColor
                  : (isDark ? Colors.white70 : Colors.black54),
              size: 22,
            ),
            const SizedBox(height: 2),
            Text(
              item.label,
              style: TextStyle(
                fontSize: 12,
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
                color: isSelected
                    ? accentColor
                    : (isDark ? Colors.white70 : Colors.black54),
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}
