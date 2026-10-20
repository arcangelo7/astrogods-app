import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../i18n/translations.g.dart';
import '../models/reading_chunk.dart';
import '../config/environment.dart';
import '../config/router.dart';

class ApiClient {
  static const Duration timeout = Duration(seconds: 30);
  static String get baseUrl => Environment.apiBaseUrl;

  final http.Client _client = http.Client();

  static const String _chartTokensKey = 'birth_chart_tokens';
  static final RegExp _birthChartPath = RegExp(
    r'^/birth-chart/(\d+)(?:[/?]|$)',
  );

  /// Keeps the token that proves who created a chart while signed out, so
  /// the creator can still open it, also after signing in.
  static Future<void> saveBirthChartToken(
    int birthChartId,
    String token,
  ) async {
    final prefs = await SharedPreferences.getInstance();
    final tokens = _decodeChartTokens(prefs);
    tokens['$birthChartId'] = token;
    await prefs.setString(_chartTokensKey, jsonEncode(tokens));
  }

  static Map<String, dynamic> _decodeChartTokens(SharedPreferences prefs) {
    final stored = prefs.getString(_chartTokensKey);
    return stored == null
        ? <String, dynamic>{}
        : jsonDecode(stored) as Map<String, dynamic>;
  }

  Future<Map<String, String>> _getHeaders(String endpoint) async {
    final headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    };

    headers['X-Client-Version'] = Environment.appVersion;

    headers['Accept-Language'] = LocaleSettings.currentLocale.languageCode;

    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('auth_token');
    if (token != null && token.isNotEmpty) {
      headers['Authorization'] = 'Bearer $token';
    }

    final chartId = _birthChartPath.firstMatch(endpoint)?.group(1);
    if (chartId != null) {
      final chartToken = _decodeChartTokens(prefs)[chartId] as String?;
      if (chartToken != null) {
        headers['X-Birth-Chart-Token'] = chartToken;
      }
    }

    return headers;
  }

  Future<Map<String, dynamic>> get(
    String endpoint, {
    Duration? requestTimeout,
    Map<String, String>? extraHeaders,
  }) async {
    try {
      final uri = Uri.parse('$baseUrl$endpoint');
      final headers = await _getHeaders(endpoint);
      final response = await _client
          .get(uri, headers: {...headers, ...?extraHeaders})
          .timeout(requestTimeout ?? timeout);

      return await _handleResponse(response);
    } on SocketException {
      throw ApiException('connection_error', errorKey: 'connection.error');
    } on TimeoutException {
      throw ApiException('connection_timeout', errorKey: 'connection.timeout');
    } on http.ClientException {
      throw ApiException(
        'server_unavailable',
        errorKey: 'connection.unavailable',
      );
    } catch (e) {
      if (e is ApiException) rethrow;
      throw ApiException('connection_error', errorKey: 'connection.error');
    }
  }

  Future<Map<String, dynamic>> post(
    String endpoint, {
    Map<String, dynamic>? body,
    Duration? requestTimeout,
  }) async {
    try {
      final uri = Uri.parse('$baseUrl$endpoint');
      final headers = await _getHeaders(endpoint);
      final response = await _client
          .post(
            uri,
            headers: headers,
            body: body != null ? json.encode(body) : null,
          )
          .timeout(requestTimeout ?? timeout);

      return await _handleResponse(response);
    } on SocketException {
      throw ApiException('connection_error', errorKey: 'connection.error');
    } on TimeoutException {
      throw ApiException('connection_timeout', errorKey: 'connection.timeout');
    } on http.ClientException {
      throw ApiException(
        'server_unavailable',
        errorKey: 'connection.unavailable',
      );
    } catch (e) {
      if (e is ApiException) rethrow;
      throw ApiException('connection_error', errorKey: 'connection.error');
    }
  }

  Future<Map<String, dynamic>> put(
    String endpoint, {
    Map<String, dynamic>? body,
    Duration? requestTimeout,
  }) async {
    try {
      final uri = Uri.parse('$baseUrl$endpoint');
      final headers = await _getHeaders(endpoint);
      final response = await _client
          .put(
            uri,
            headers: headers,
            body: body != null ? json.encode(body) : null,
          )
          .timeout(requestTimeout ?? timeout);

      return await _handleResponse(response);
    } on SocketException {
      throw ApiException('connection_error', errorKey: 'connection.error');
    } on TimeoutException {
      throw ApiException('connection_timeout', errorKey: 'connection.timeout');
    } on http.ClientException {
      throw ApiException(
        'server_unavailable',
        errorKey: 'connection.unavailable',
      );
    } catch (e) {
      if (e is ApiException) rethrow;
      throw ApiException('connection_error', errorKey: 'connection.error');
    }
  }

  Future<Map<String, dynamic>> delete(
    String endpoint, {
    Duration? requestTimeout,
  }) async {
    try {
      final uri = Uri.parse('$baseUrl$endpoint');
      final headers = await _getHeaders(endpoint);
      final response = await _client
          .delete(uri, headers: headers)
          .timeout(requestTimeout ?? timeout);

      return await _handleResponse(response);
    } on SocketException {
      throw ApiException('connection_error', errorKey: 'connection.error');
    } on TimeoutException {
      throw ApiException('connection_timeout', errorKey: 'connection.timeout');
    } on http.ClientException {
      throw ApiException(
        'server_unavailable',
        errorKey: 'connection.unavailable',
      );
    } catch (e) {
      if (e is ApiException) rethrow;
      throw ApiException('connection_error', errorKey: 'connection.error');
    }
  }

  Future<Map<String, dynamic>> _handleResponse(http.Response response) async {
    final dynamic decoded = response.body.isNotEmpty
        ? json.decode(response.body)
        : {};
    final Map<String, dynamic> data = decoded is Map<String, dynamic>
        ? decoded
        : {'data': decoded};

    if (response.statusCode == 426) {
      final message = data['error'] as String;
      appRouter.go('/update-required', extra: message);
      // Never-completing future prevents exception propagation and snackbar display
      await Completer<Never>().future;
    }

    if (response.statusCode >= 200 && response.statusCode < 300) {
      return data;
    } else {
      throw ApiException(
        data['error']!,
        statusCode: response.statusCode,
        errorType: data['error_type'],
        errorKey: data['error_key'],
      );
    }
  }

  Future<String> getRawText(
    String endpoint, {
    Duration? requestTimeout,
    Map<String, String>? extraHeaders,
  }) async {
    try {
      final uri = Uri.parse('$baseUrl$endpoint');
      final headers = await _getHeaders(endpoint);
      final response = await _client
          .get(uri, headers: {...headers, ...?extraHeaders})
          .timeout(requestTimeout ?? timeout);
      if (response.statusCode >= 200 && response.statusCode < 300) {
        return response.body;
      } else {
        throw ApiException('Request failed', statusCode: response.statusCode);
      }
    } on SocketException {
      throw ApiException('connection_error', errorKey: 'connection.error');
    } on TimeoutException {
      throw ApiException('connection_timeout', errorKey: 'connection.timeout');
    } on http.ClientException {
      throw ApiException(
        'server_unavailable',
        errorKey: 'connection.unavailable',
      );
    } catch (e) {
      if (e is ApiException) rethrow;
      throw ApiException('connection_error', errorKey: 'connection.error');
    }
  }

  Future<Uint8List> getBinary(
    String endpoint, {
    Duration? requestTimeout,
  }) async {
    try {
      final uri = Uri.parse('$baseUrl$endpoint');
      final headers = await _getHeaders(endpoint);
      // Remove JSON content type for binary response
      headers.remove('Content-Type');
      headers['Accept'] = 'application/pdf';

      final response = await _client
          .get(uri, headers: headers)
          .timeout(requestTimeout ?? timeout);

      if (response.statusCode >= 200 && response.statusCode < 300) {
        return response.bodyBytes;
      } else {
        // Try to parse error message if response is JSON
        try {
          final data = json.decode(response.body);
          throw ApiException(
            data['error'] ?? 'Request failed',
            statusCode: response.statusCode,
          );
        } catch (e) {
          if (e is ApiException) rethrow;
          throw ApiException('Request failed', statusCode: response.statusCode);
        }
      }
    } on SocketException {
      throw ApiException('connection_error', errorKey: 'connection.error');
    } on TimeoutException {
      throw ApiException('connection_timeout', errorKey: 'connection.timeout');
    } on http.ClientException {
      throw ApiException(
        'server_unavailable',
        errorKey: 'connection.unavailable',
      );
    } catch (e) {
      if (e is ApiException) rethrow;
      throw ApiException('connection_error', errorKey: 'connection.error');
    }
  }

  Stream<Map<String, dynamic>> getSSEStream(String endpoint) async* {
    try {
      final uri = Uri.parse('$baseUrl$endpoint');
      final request = http.Request('GET', uri);

      final headers = await _getHeaders(endpoint);
      headers['Accept'] = 'text/event-stream';
      headers['Cache-Control'] = 'no-cache';
      headers['Connection'] = 'keep-alive';

      request.headers.addAll(headers);

      final response = await _client.send(request);

      if (response.statusCode < 200 || response.statusCode >= 300) {
        final body = await response.stream.bytesToString();
        Map<String, dynamic> errorData = {};
        try {
          errorData = json.decode(body);
        } catch (e) {
          // Body is not JSON
        }
        throw ApiException(
          errorData['error'] as String,
          statusCode: response.statusCode,
          errorType: errorData['error_type'] as String?,
          errorKey: errorData['error_key'] as String?,
        );
      }

      await for (String line
          in response.stream
              .transform(utf8.decoder)
              .transform(const LineSplitter())) {
        if (line.startsWith('data: ')) {
          final jsonStr = line.substring(6);
          if (jsonStr.trim().isEmpty) continue;

          try {
            final data = json.decode(jsonStr);
            yield data;
          } catch (e) {
            // Skip invalid JSON data
            continue;
          }
        }
      }
    } on SocketException {
      throw ApiException('connection_error', errorKey: 'connection.error');
    } on TimeoutException {
      throw ApiException('connection_timeout', errorKey: 'connection.timeout');
    } on http.ClientException {
      throw ApiException(
        'server_unavailable',
        errorKey: 'connection.unavailable',
      );
    } catch (e) {
      if (e is ApiException) rethrow;
      throw ApiException('connection_error', errorKey: 'connection.error');
    }
  }

  Stream<Map<String, dynamic>> getSSEStreamWithReconnect(
    String endpoint, {
    int maxRetries = 5,
    Duration retryDelay = const Duration(seconds: 2),
  }) async* {
    int retryCount = 0;

    while (retryCount < maxRetries) {
      try {
        await for (var event in getSSEStream(endpoint)) {
          retryCount = 0;
          yield event;

          if (event['type'] == 'complete' || event['type'] == 'error') {
            return;
          }
        }
        return;
      } on ApiException catch (e) {
        if (e.statusCode == 403) rethrow;
        retryCount++;
        if (retryCount >= maxRetries) rethrow;
        await Future.delayed(retryDelay);
        yield {'type': 'reconnecting', 'attempt': retryCount};
      }
    }
  }

  Stream<ReadingChunk> streamReadingChunks(String endpoint) async* {
    await for (final data in getSSEStreamWithReconnect(endpoint)) {
      if (data.containsKey('error')) {
        yield ReadingChunk(
          content: '',
          topic: 'Error',
          isComplete: true,
          error: data['error'],
        );
        return;
      }

      final type = data['type'];

      if (type == 'reconnecting') {
        yield ReadingChunk(
          content: '',
          topic: 'Reconnecting',
          isComplete: false,
          isReconnecting: true,
        );
      } else if (type == 'chunk') {
        yield ReadingChunk(
          content: data['content'],
          topic: data['topic'] ?? '',
          isComplete: false,
        );
      } else if (type == 'section_end') {
        yield ReadingChunk(
          content: '',
          topic: data['topic'],
          isComplete: false,
          isSectionEnd: true,
        );
      } else if (type == 'topic_change') {
        yield ReadingChunk(
          content: '',
          topic: data['topic'],
          isComplete: false,
          isTopicChange: true,
        );
      } else if (type == 'complete') {
        yield ReadingChunk(
          content: data['content'] ?? '',
          topic: data['topic'] ?? '',
          isComplete: true,
          readingId: data['reading_id'],
          language: data['language'],
        );
      } else if (type == 'error') {
        yield ReadingChunk(
          content: '',
          topic: 'Error',
          isComplete: true,
          error: data['error'],
        );
      }
    }
  }

  Stream<Map<String, dynamic>> getStream(String endpoint) async* {
    try {
      final uri = Uri.parse('$baseUrl$endpoint');
      final request = http.Request('GET', uri);
      final headers = await _getHeaders(endpoint);
      request.headers.addAll(headers);

      final response = await _client.send(request);

      if (response.statusCode >= 200 && response.statusCode < 300) {
        await for (String chunk
            in response.stream
                .transform(utf8.decoder)
                .transform(const LineSplitter())) {
          if (chunk.isNotEmpty && chunk.startsWith('data: ')) {
            final jsonStr = chunk.substring(6); // Remove 'data: ' prefix
            try {
              final data = json.decode(jsonStr);
              yield data;
            } catch (e) {
              // Skip invalid JSON chunks
            }
          }
        }
      } else {
        final body = await response.stream.bytesToString();
        final data = json.decode(body);
        throw ApiException(data['error']!, statusCode: response.statusCode);
      }
    } on SocketException {
      throw ApiException('connection_error', errorKey: 'connection.error');
    } on TimeoutException {
      throw ApiException('connection_timeout', errorKey: 'connection.timeout');
    } on http.ClientException {
      throw ApiException(
        'server_unavailable',
        errorKey: 'connection.unavailable',
      );
    } catch (e) {
      if (e is ApiException) rethrow;
      throw ApiException('connection_error', errorKey: 'connection.error');
    }
  }

  Future<Map<String, dynamic>> getSubscriptionStatus() async {
    return await get('/subscription-status');
  }

  Future<Map<String, dynamic>> createPortalSession({
    String? priceId,
    String? returnUrl,
  }) async {
    final body = <String, dynamic>{};
    if (priceId != null) {
      body['price_id'] = priceId;
    }
    if (returnUrl != null) {
      body['return_url'] = returnUrl;
    }
    return await post('/create-portal-session', body: body);
  }

  void dispose() {
    _client.close();
  }
}

class ApiException implements Exception {
  final String message;
  final int? statusCode;
  final String? errorType;
  final String? errorKey;

  const ApiException(
    this.message, {
    this.statusCode,
    this.errorType,
    this.errorKey,
  });

  String get userMessage => message;

  bool get isSubscriptionError => errorKey?.startsWith('subscription.') == true;

  @override
  String toString() =>
      'ApiException: $message${statusCode != null ? ' (Status: $statusCode)' : ''}${errorType != null ? ' (Type: $errorType)' : ''}';
}
