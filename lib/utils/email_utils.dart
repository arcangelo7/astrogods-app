import 'package:flutter/services.dart';
import 'package:material_ui/material_ui.dart';
import 'package:url_launcher/url_launcher.dart';

import '../i18n/translations.g.dart';
import 'snackbar_utils.dart';

/// Opens a new message to [address] in the email app. Devices without an
/// email app get the address copied to the clipboard instead.
Future<void> openEmail(BuildContext context, String address) async {
  final opened = await launchUrl(Uri(scheme: 'mailto', path: address));
  if (opened || !context.mounted) return;
  await Clipboard.setData(ClipboardData(text: address));
  if (context.mounted) {
    SnackbarUtils.showInfo(
      context,
      Translations.of(context).ui.emailAddressCopied(email: address),
    );
  }
}
