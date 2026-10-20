import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../models/user.dart';
import '../models/auth_request.dart';
import 'api_client.dart';

class AuthService {
  static const String _tokenKey = 'auth_token';
  static const String _userKey = 'user_data';

  final ApiClient _apiClient;

  AuthService({ApiClient? apiClient}) : _apiClient = apiClient ?? ApiClient();

  static String extractUserMessage(dynamic error) {
    if (error is ApiException) {
      return error.userMessage;
    }
    return error.toString();
  }

  static AuthResponse _failureResponse(Object error) {
    return AuthResponse(
      success: false,
      message: extractUserMessage(error),
      errorKey: error is ApiException ? error.errorKey : null,
    );
  }

  Future<AuthResponse> login(String email, String password) async {
    try {
      final request = LoginRequest(email: email, password: password);
      final response = await _apiClient.post('/login', body: request.toJson());

      // Check if the response has token and user (successful login)
      if (response.containsKey('token') && response.containsKey('user')) {
        final user = User.fromJson(response['user']);
        final token = response['token'] as String;

        await _saveUserSession(user, token);

        return AuthResponse(success: true, user: user, token: token);
      }

      // Try to parse as standard AuthResponse (for error cases)
      final authResponse = AuthResponse.fromJson(response);
      return authResponse;
    } catch (e) {
      return _failureResponse(e);
    }
  }

  Future<AuthResponse> register(RegisterRequest request) async {
    try {
      final response = await _apiClient.post(
        '/register',
        body: request.toJson(),
      );

      // Check if the response has token and user (successful registration)
      if (response.containsKey('token') && response.containsKey('user')) {
        final user = User.fromJson(response['user']);
        final token = response['token'] as String;

        await _saveUserSession(user, token);

        return AuthResponse(success: true, user: user, token: token);
      }

      // Try to parse as standard AuthResponse (for error cases)
      final authResponse = AuthResponse.fromJson(response);
      return authResponse;
    } catch (e) {
      return _failureResponse(e);
    }
  }

  Future<AuthResponse> loginWithGoogle({required String idToken}) {
    return _loginWithIdentityProvider('/google-auth', {'idToken': idToken});
  }

  Future<AuthResponse> loginWithApple({
    required String identityToken,
    required String authorizationCode,
    required String? givenName,
    required String? familyName,
  }) {
    return _loginWithIdentityProvider('/apple-auth', {
      'identityToken': identityToken,
      'authorizationCode': authorizationCode,
      'givenName': givenName,
      'familyName': familyName,
    });
  }

  Future<AuthResponse> _loginWithIdentityProvider(
    String path,
    Map<String, dynamic> body,
  ) async {
    try {
      final response = await _apiClient.post(path, body: body);

      if (response.containsKey('token') && response.containsKey('user')) {
        final user = User.fromJson(response['user']);
        final token = response['token'] as String;

        await _saveUserSession(user, token);

        return AuthResponse(
          success: true,
          user: user,
          token: token,
          created: response['created'] as bool,
        );
      }

      // Try to parse as standard AuthResponse (for error cases)
      final authResponse = AuthResponse.fromJson(response);
      return authResponse;
    } catch (e) {
      return _failureResponse(e);
    }
  }

  Future<Map<String, String?>> getOAuthConfig() async {
    final response = await _apiClient.get('/oauth-config');
    return {
      'clientId': response['clientId'] as String,
      'clientSecret': response['clientSecret'] as String?,
    };
  }

  Future<bool> logout() async {
    try {
      await _apiClient.post('/logout');
    } catch (e) {
      // Continue with local logout even if server logout fails
    }

    await clearUserSession();
    return true;
  }

  Future<User?> getCurrentUser() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final userData = prefs.getString(_userKey);

      if (userData != null) {
        final userJson = json.decode(userData) as Map<String, dynamic>;
        return User.fromJson(userJson);
      }
    } catch (e) {
      // User data is corrupted, clear it
      await clearUserSession();
    }

    return null;
  }

  Future<String?> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_tokenKey);
  }

  Future<bool> isLoggedIn() async {
    final user = await getCurrentUser();
    final token = await getToken();
    return user != null && token != null;
  }

  Future<AuthResponse> refreshUserData() async {
    try {
      final response = await _apiClient.get('/me');
      final user = User.fromJson(response['user']);

      await _saveUserData(user);

      return AuthResponse(success: true, user: user);
    } catch (e) {
      return _failureResponse(e);
    }
  }

  Future<AuthResponse> updateProfile(Map<String, dynamic> profileData) async {
    try {
      final response = await _apiClient.put(
        '/update-profile',
        body: profileData,
      );
      final user = User.fromJson(response['user']);

      await _saveUserData(user);

      return AuthResponse(success: true, user: user);
    } catch (e) {
      return _failureResponse(e);
    }
  }

  Future<bool> checkEmailExists(String email) async {
    final response = await _apiClient.post(
      '/check-email',
      body: {'email': email},
    );
    return response['exists'] == true;
  }

  Future<void> _saveUserSession(User user, String? token) async {
    final prefs = await SharedPreferences.getInstance();

    if (token != null) {
      await prefs.setString(_tokenKey, token);
    }

    await _saveUserData(user);
  }

  Future<void> _saveUserData(User user) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_userKey, json.encode(user.toJson()));
  }

  Future<void> clearUserSession() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_tokenKey);
    await prefs.remove(_userKey);
  }

  Future<AuthResponse> deleteAccount() async {
    try {
      await _apiClient.delete('/delete-account');
      await clearUserSession();
      return AuthResponse(
        success: true,
        message: 'Account deleted successfully',
      );
    } catch (e) {
      return _failureResponse(e);
    }
  }

  Future<AuthResponse> forgotPassword(String email) async {
    try {
      await _apiClient.post('/forgot-password', body: {'email': email});
      return AuthResponse(success: true, message: 'Password reset email sent');
    } catch (e) {
      return _failureResponse(e);
    }
  }

  Future<AuthResponse> requestEmailChange(
    String email,
    String? currentPassword,
  ) async {
    try {
      await _apiClient.post(
        '/request-email-change',
        body: {'email': email, 'current_password': ?currentPassword},
      );
      return const AuthResponse(success: true);
    } catch (e) {
      return _failureResponse(e);
    }
  }

  Future<AuthResponse> changePassword(
    String currentPassword,
    String newPassword,
  ) async {
    try {
      await _apiClient.post(
        '/change-password',
        body: {
          'current_password': currentPassword,
          'new_password': newPassword,
        },
      );
      return const AuthResponse(success: true);
    } catch (e) {
      return _failureResponse(e);
    }
  }

  Future<AuthResponse> requestPasswordSetup() async {
    try {
      await _apiClient.post('/request-password-setup');
      return const AuthResponse(success: true);
    } catch (e) {
      return _failureResponse(e);
    }
  }

  Future<AuthResponse> confirmEmailChange(String token) async {
    try {
      final response = await _apiClient.post(
        '/confirm-email-change',
        body: {'token': token},
      );
      return AuthResponse(success: true, user: User.fromJson(response['user']));
    } catch (e) {
      return _failureResponse(e);
    }
  }

  Future<AuthResponse> resetPassword(String token, String newPassword) async {
    try {
      await _apiClient.post(
        '/reset-password',
        body: {'token': token, 'password': newPassword},
      );
      return AuthResponse(
        success: true,
        message: 'Password reset successfully',
      );
    } catch (e) {
      return _failureResponse(e);
    }
  }
}
