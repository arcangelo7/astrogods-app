// SPDX-FileCopyrightText: 2026 Arcangelo Massari <info@arcangelomassari.com>
//
// SPDX-License-Identifier: AGPL-3.0-or-later

import 'package:web/web.dart' as web;

Future<void> launchUrl(String url) async {
  web.window.open(url, '_blank');
}