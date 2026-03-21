// SPDX-FileCopyrightText: 2026 Arcangelo Massari <info@arcangelomassari.com>
//
// SPDX-License-Identifier: AGPL-3.0-or-later

import 'package:url_launcher/url_launcher.dart' as launcher;

Future<void> launchUrl(String url) async {
  final Uri uri = Uri.parse(url);
  final launched = await launcher.launchUrl(uri, mode: launcher.LaunchMode.externalApplication);
  if (!launched) {
    throw Exception('Could not launch $url');
  }
}