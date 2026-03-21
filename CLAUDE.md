<!-- SPDX-FileCopyrightText: 2026 Arcangelo Massari <info@arcangelomassari.com> -->
<!-- SPDX-License-Identifier: AGPL-3.0-or-later -->

# AstroGods

Flutter cross-platform astrology app (Android, Linux, Windows, Web).

## Project structure

- `lib/` - Dart source code (screens, models, providers, services, widgets)
- `android/`, `linux/`, `windows/` - Platform-specific runner code
- `assets/` - Images, logos, flags
- `branding/` - Marketing assets (screenshots, banners, logos)
- `lib/l10n/` - Localization files (English, Italian)
- `generated/` - Flatpak build files
- `snap/` - Snap packaging
- `.github/workflows/` - CI/CD (build, verify, publish for each platform)

## REUSE compliance

This project follows the REUSE spec 3.3. License: `AGPL-3.0-or-later`. Copyright: `Arcangelo Massari <info@arcangelomassari.com>`.

When adding new files:

- **Commentable files** (Dart, YAML, Shell, XML, etc.): run `reuse annotate --copyright="Arcangelo Massari <info@arcangelomassari.com>" --license="AGPL-3.0-or-later" --year=2026 <file>`
- **Non-commentable files** (JSON, PNG, SVG, ARB, lock files, etc.): add the path to the appropriate `[[annotations]]` block in `REUSE.toml`
- **Flutter framework files**: use `The Flutter Authors` copyright with `BSD-3-Clause`
- **Auto-generated files** (plugin registrants, generated plugins): add to the Flutter generated block in `REUSE.toml`
- Run `reuse lint` to verify compliance after changes
