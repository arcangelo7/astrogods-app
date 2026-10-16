import 'package:material_ui/material_ui.dart';

import '../i18n/translations.g.dart';

String translateConnectionError(BuildContext context, String errorMessage) {
  final t = Translations.of(context);

  switch (errorMessage) {
    case 'connection_error':
      return t.ui.connectionError;
    case 'server_unavailable':
      return t.ui.serverUnavailable;
    case 'connection_timeout':
      return t.ui.connectionTimeout;
    default:
      return errorMessage;
  }
}
