import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class Environment {
  static const String _debugApiUrl = String.fromEnvironment('API_BASE_URL');

  static Future<void> init() async {
    await dotenv.load(fileName: '.env.flutter');
  }

  static String get apiBaseUrl {
    if (kDebugMode) {
      if (_debugApiUrl.isEmpty) {
        throw StateError(
          'Debug builds need --dart-define=API_BASE_URL, see the Makefile',
        );
      }
      return _debugApiUrl;
    }
    return 'https://astrogods.it/api';
  }

  static String get staticBaseUrl {
    final url = apiBaseUrl;
    return url.endsWith('/api') ? url.substring(0, url.length - 4) : url;
  }

  static String get appVersion => dotenv.env['APP_VERSION']!;
}
