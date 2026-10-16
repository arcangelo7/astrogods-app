import 'package:flutter/foundation.dart';
import 'package:material_ui/material_ui.dart';
import 'package:go_router/go_router.dart';
import 'package:liquid_glass_widgets/liquid_glass_widgets.dart';
import 'package:provider/provider.dart';

import '../i18n/translations.g.dart';
import '../constants/text_styles.dart';
import '../providers/auth_provider.dart';
import '../utils/snackbar_utils.dart';
import 'glass_navigation_dock.dart';

class MainNavigationWrapper extends StatelessWidget {
  final int selectedIndex;
  final Widget child;

  const MainNavigationWrapper({
    super.key,
    required this.selectedIndex,
    required this.child,
  });

  bool get _useLiquidGlass =>
      !kIsWeb && defaultTargetPlatform == TargetPlatform.iOS;

  List<GlassNavigationItem> _getGlassNavigationItems(BuildContext context) => [
    GlassNavigationItem(
      icon: Icons.home_outlined,
      selectedIcon: Icons.home,
      label: Translations.of(context).ui.homeTitle,
    ),
    GlassNavigationItem(
      icon: Icons.person_outline,
      selectedIcon: Icons.person,
      label: Translations.of(context).ui.personalityTitle,
    ),
    GlassNavigationItem(
      icon: Icons.favorite_outline,
      selectedIcon: Icons.favorite,
      label: Translations.of(context).ui.relationshipsTitle,
    ),
    GlassNavigationItem(
      icon: Icons.schedule_outlined,
      selectedIcon: Icons.schedule,
      label: Translations.of(context).ui.predictionsTitle,
    ),
  ];

  void _onDestinationSelected(BuildContext context, int index) {
    switch (index) {
      case 0:
        context.go('/');
        break;
      case 1:
        context.go('/personality');
        break;
      case 2:
        context.go('/relationships');
        break;
      case 3:
        context.go('/predictions');
        break;
    }
  }

  String _getScreenTitle(BuildContext context) {
    final t = Translations.of(context);
    switch (selectedIndex) {
      case 0:
        return t.ui.appTitle;
      case 1:
        return t.ui.personalityTitle;
      case 2:
        return t.ui.relationshipsTitle;
      case 3:
        return t.ui.predictionsTitle;
      default:
        return t.ui.appTitle;
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_useLiquidGlass) {
      return _buildLiquidGlassLayout(context);
    }
    return _buildFallbackLayout(context);
  }

  Widget _buildLiquidGlassLayout(BuildContext context) {
    return LiquidGlassScope(
      child: Stack(
        children: [
          Positioned.fill(
            child: GlassBackgroundSource(
              child: Material(type: MaterialType.transparency, child: child),
            ),
          ),
          Positioned.fill(
            child: Scaffold(
              backgroundColor: Colors.transparent,
              extendBody: true,
              extendBodyBehindAppBar: true,
              appBar: _buildAppBar(context),
              drawer: _buildDrawer(context),
              body: const SizedBox.shrink(),
              bottomNavigationBar: GlassNavigationDock(
                selectedIndex: selectedIndex,
                items: _getGlassNavigationItems(context),
                onItemSelected: (index) =>
                    _onDestinationSelected(context, index),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFallbackLayout(BuildContext context) {
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      appBar: _buildAppBar(context),
      drawer: _buildDrawer(context),
      body: Stack(
        children: [
          child,
          GlassNavigationDock(
            selectedIndex: selectedIndex,
            items: _getGlassNavigationItems(context),
            onItemSelected: (index) => _onDestinationSelected(context, index),
          ),
        ],
      ),
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return AppBar(
      title: Text(
        _getScreenTitle(context),
        style: TextStyle(
          color: selectedIndex == 0
              ? Theme.of(context).colorScheme.onSurface
              : Theme.of(context).appBarTheme.titleTextStyle?.color,
        ),
      ),
      foregroundColor: selectedIndex == 0
          ? Theme.of(context).colorScheme.onSurface
          : Theme.of(context).appBarTheme.foregroundColor,
      iconTheme: IconThemeData(
        color: selectedIndex == 0
            ? Theme.of(context).colorScheme.onSurface
            : Theme.of(context).appBarTheme.iconTheme?.color,
      ),
    );
  }

  Widget _buildDrawer(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.surface,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(color: Colors.black),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Image.asset(
                  'assets/images/logos/astrogods_logo_80.webp',
                  width: 80,
                  height: 80,
                ),
                const SizedBox(height: 8),
                Text(
                  Translations.of(context).ui.appTitle,
                  style: AppTextStyles.drawerHeaderStyle,
                ),
              ],
            ),
          ),
          ListTile(
            leading: const Icon(Icons.book_outlined),
            title: Text(Translations.of(context).codex.codexTitle),
            onTap: () {
              Navigator.pop(context);
              context.push('/codex');
            },
          ),
          Consumer<AuthProvider>(
            builder: (context, authProvider, child) {
              if (authProvider.isAuthenticated) {
                return ListTile(
                  leading: const Icon(Icons.bookmark_outline),
                  title: Text(Translations.of(context).ui.savedChartsTitle),
                  onTap: () {
                    Navigator.pop(context);
                    context.push('/saved-charts');
                  },
                );
              } else {
                return const SizedBox.shrink();
              }
            },
          ),
          const Divider(),
          Consumer<AuthProvider>(
            builder: (context, authProvider, child) {
              if (authProvider.isAuthenticated) {
                return ListTile(
                  leading: const Icon(Icons.person_outlined),
                  title: Text(Translations.of(context).ui.profile),
                  onTap: () {
                    Navigator.pop(context);
                    context.push('/profile');
                  },
                );
              } else {
                return const SizedBox.shrink();
              }
            },
          ),
          ListTile(
            leading: const Icon(Icons.payment_outlined),
            title: Text(Translations.of(context).ui.viewPlans),
            onTap: () {
              Navigator.pop(context);
              context.push('/subscription-plans');
            },
          ),
          ListTile(
            leading: const Icon(Icons.settings_outlined),
            title: Text(Translations.of(context).ui.settingsTitle),
            onTap: () {
              Navigator.pop(context);
              context.push('/settings');
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.groups_outlined),
            title: Text(Translations.of(context).about.aboutAndFaq),
            onTap: () {
              Navigator.pop(context);
              context.push('/about-faq');
            },
          ),
          ListTile(
            leading: const Icon(Icons.privacy_tip_outlined),
            title: Text(Translations.of(context).legal.privacyPolicy),
            onTap: () {
              Navigator.pop(context);
              context.push('/privacy-policy');
            },
          ),
          ListTile(
            leading: const Icon(Icons.description_outlined),
            title: Text(Translations.of(context).ui.termsOfService),
            onTap: () {
              Navigator.pop(context);
              context.push('/terms-and-conditions');
            },
          ),
          const Divider(),
          Consumer<AuthProvider>(
            builder: (context, authProvider, child) {
              if (authProvider.isAuthenticated) {
                return ListTile(
                  leading: const Icon(Icons.logout_outlined),
                  title: Text(Translations.of(context).ui.logout),
                  onTap: () async {
                    Navigator.pop(context);
                    await authProvider.logout();
                    if (context.mounted) {
                      SnackbarUtils.showSuccess(
                        context,
                        Translations.of(context).ui.logoutSuccessful,
                      );
                    }
                  },
                );
              } else {
                return ListTile(
                  leading: const Icon(Icons.login_outlined),
                  title: Text(Translations.of(context).ui.login),
                  onTap: () {
                    Navigator.pop(context);
                    context.go('/login');
                  },
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
