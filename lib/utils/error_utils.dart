import 'package:material_ui/material_ui.dart';

import '../i18n/translations.g.dart';
import '../services/api_client.dart';

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

/// The message to show for an error caught around a backend call: the
/// backend's own message, or a generic one for anything else.
String userErrorMessage(BuildContext context, Object error) {
  if (error is ApiException) {
    return translateConnectionError(context, error.message);
  }
  return Translations.of(context).ui.unknownErrorOccurred;
}
