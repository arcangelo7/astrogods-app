import 'package:material_ui/material_ui.dart';

import '../models/user.dart';
import '../models/auth_request.dart';
import '../services/auth_service.dart';
import 'language_provider.dart';
import 'theme_provider.dart';

class AuthProvider extends ChangeNotifier {
  final AuthService _authService;

  User? _currentUser;
  bool _isAuthenticated = false;
  bool _isLoading = false;
  bool _hasInitialized = false;
  String? _errorMessage;
  String? _errorKey;
  LanguageProvider? _languageProvider;
  ThemeProvider? _themeProvider;

  AuthProvider({AuthService? authService})
    : _authService = authService ?? AuthService() {
    _checkInitialAuthState();
  }

  void setLanguageProvider(LanguageProvider languageProvider) {
    _languageProvider = languageProvider;
  }

  void setThemeProvider(ThemeProvider themeProvider) {
    _themeProvider = themeProvider;
  }

  User? get currentUser => _currentUser;
  bool get isAuthenticated => _isAuthenticated;
  bool get isLoading => _isLoading || !_hasInitialized;
  String? get errorMessage => _errorMessage;
  String? get errorKey => _errorKey;

  Future<void> _checkInitialAuthState() async {
    try {
      final isLoggedIn = await _authService.isLoggedIn();
      _isAuthenticated = isLoggedIn;
      _hasInitialized = true;
      notifyListeners();
    } catch (e) {
      _hasInitialized = true;
      notifyListeners();
    }
  }

  Future<void> initialize() async {
    if (!_hasInitialized) {
      await _checkInitialAuthState();
    }

    _setLoading(true);
    try {
      final user = await _authService.getCurrentUser();
      final token = await _authService.getToken();
      if (user != null && token != null) {
        _currentUser = user;
        _isAuthenticated = true;
        _syncUserWithProviders();
      } else {
        await _authService.clearUserSession();
        _isAuthenticated = false;
      }
    } catch (e) {
      _errorMessage = AuthService.extractUserMessage(e);
      _isAuthenticated = false;
    } finally {
      _setLoading(false);
    }
  }

  Future<bool> login(String email, String password) async {
    _setLoading(true);
    _clearError();

    try {
      final response = await _authService.login(email, password);

      if (response.success && response.user != null) {
        _currentUser = response.user;
        _isAuthenticated = true;
        _syncUserWithProviders();
        notifyListeners();
        return true;
      } else {
        _errorMessage = response.message!;
        notifyListeners();
        return false;
      }
    } catch (e) {
      _errorMessage = AuthService.extractUserMessage(e);
      notifyListeners();
      return false;
    } finally {
      _setLoading(false);
    }
  }

  Future<bool> register(RegisterRequest request) async {
    _setLoading(true);
    _clearError();

    try {
      final response = await _authService.register(request);

      if (response.success && response.user != null) {
        _currentUser = response.user;
        _isAuthenticated = true;
        _syncUserWithProviders();
        notifyListeners();
        return true;
      } else {
        _errorMessage = response.message!;
        _errorKey = response.errorKey;
        notifyListeners();
        return false;
      }
    } catch (e) {
      _errorMessage = AuthService.extractUserMessage(e);
      notifyListeners();
      return false;
    } finally {
      _setLoading(false);
    }
  }

  Future<AuthResponse> loginWithGoogle({required String idToken}) {
    return _loginWithIdentityProvider(
      () => _authService.loginWithGoogle(idToken: idToken),
    );
  }

  Future<AuthResponse> loginWithApple({
    required String identityToken,
    required String authorizationCode,
    required String? givenName,
    required String? familyName,
  }) {
    return _loginWithIdentityProvider(
      () => _authService.loginWithApple(
        identityToken: identityToken,
        authorizationCode: authorizationCode,
        givenName: givenName,
        familyName: familyName,
      ),
    );
  }

  Future<AuthResponse> _loginWithIdentityProvider(
    Future<AuthResponse> Function() login,
  ) async {
    _setLoading(true);
    _clearError();

    try {
      final response = await login();

      if (response.success && response.user != null) {
        _currentUser = response.user;
        _isAuthenticated = true;
        _syncUserWithProviders();
        notifyListeners();
      } else {
        _errorMessage = response.message!;
        notifyListeners();
      }
      return response;
    } catch (e) {
      _errorMessage = AuthService.extractUserMessage(e);
      notifyListeners();
      return const AuthResponse(success: false);
    } finally {
      _setLoading(false);
    }
  }

  Future<void> logout() async {
    _setLoading(true);

    try {
      await _authService.logout();

      _currentUser = null;
      _isAuthenticated = false;

      notifyListeners();
    } catch (e) {
      _errorMessage = AuthService.extractUserMessage(e);
    } finally {
      _setLoading(false);
    }
  }

  void clearSessionAfterAccountDeletion() {
    _setLoading(true);

    try {
      _currentUser = null;
      _isAuthenticated = false;

      notifyListeners();
    } catch (e) {
      _errorMessage = AuthService.extractUserMessage(e);
    } finally {
      _setLoading(false);
    }
  }

  Future<void> refreshUserData() async {
    if (!_isAuthenticated) return;

    try {
      final response = await _authService.refreshUserData();
      if (response.success && response.user != null) {
        _currentUser = response.user;
        _syncUserWithProviders();
        notifyListeners();
      }
    } catch (e) {
      _errorMessage = AuthService.extractUserMessage(e);
      notifyListeners();
    }
  }

  Future<bool> updateProfile(Map<String, dynamic> profileData) async {
    if (!_isAuthenticated) return false;

    _setLoading(true);
    _clearError();

    try {
      final response = await _authService.updateProfile(profileData);

      if (response.success && response.user != null) {
        _currentUser = response.user;
        _syncUserWithProviders();
        notifyListeners();
        return true;
      } else {
        _errorMessage = response.message!;
        _errorKey = response.errorKey;
        notifyListeners();
        return false;
      }
    } catch (e) {
      _errorMessage = AuthService.extractUserMessage(e);
      notifyListeners();
      return false;
    } finally {
      _setLoading(false);
    }
  }

  Future<bool> checkEmailExists(String email) async {
    _clearError();

    try {
      return await _authService.checkEmailExists(email);
    } catch (e) {
      _errorMessage = AuthService.extractUserMessage(e);
      return false;
    }
  }

  void _setLoading(bool loading) {
    _isLoading = loading;
    notifyListeners();
  }

  void stopLoading() {
    _setLoading(false);
  }

  void _clearError() {
    _errorMessage = null;
    _errorKey = null;
  }

  void _syncUserWithLanguageProvider() {
    if (_languageProvider != null && _currentUser != null) {
      _languageProvider!.setCurrentUser(_currentUser);
    }
  }

  void _syncUserWithThemeProvider() {
    if (_themeProvider != null && _currentUser != null) {
      _themeProvider!.setCurrentUser(_currentUser);
    }
  }

  void _syncUserWithProviders() {
    _syncUserWithLanguageProvider();
    _syncUserWithThemeProvider();
  }

  void clearError() {
    _clearError();
    notifyListeners();
  }

  Future<bool> requestEmailChange(String email, String? currentPassword) =>
      _runAccountRequest(
        () => _authService.requestEmailChange(email, currentPassword),
      );

  Future<bool> changePassword(String currentPassword, String newPassword) =>
      _runAccountRequest(
        () => _authService.changePassword(currentPassword, newPassword),
      );

  Future<bool> requestPasswordSetup() =>
      _runAccountRequest(_authService.requestPasswordSetup);

  Future<bool> _runAccountRequest(
    Future<AuthResponse> Function() request,
  ) async {
    _setLoading(true);
    _clearError();

    try {
      final response = await request();
      if (!response.success) {
        _errorMessage = response.message!;
      }
      return response.success;
    } catch (e) {
      _errorMessage = AuthService.extractUserMessage(e);
      return false;
    } finally {
      _setLoading(false);
    }
  }

  Future<bool> confirmEmailChange(String token) async {
    _setLoading(true);
    _clearError();

    try {
      final response = await _authService.confirmEmailChange(token);
      if (!response.success) {
        _errorMessage = response.message!;
        return false;
      }
      if (_isAuthenticated) {
        await refreshUserData();
      }
      return true;
    } catch (e) {
      _errorMessage = AuthService.extractUserMessage(e);
      return false;
    } finally {
      _setLoading(false);
    }
  }

  Future<bool> forgotPassword(String email) async {
    _setLoading(true);
    _clearError();

    try {
      final response = await _authService.forgotPassword(email);

      if (response.success) {
        notifyListeners();
        return true;
      } else {
        _errorMessage = response.message!;
        notifyListeners();
        return false;
      }
    } catch (e) {
      _errorMessage = AuthService.extractUserMessage(e);
      notifyListeners();
      return false;
    } finally {
      _setLoading(false);
    }
  }

  Future<bool> resetPassword(String token, String newPassword) async {
    _setLoading(true);
    _clearError();

    try {
      final response = await _authService.resetPassword(token, newPassword);

      if (response.success) {
        notifyListeners();
        return true;
      } else {
        _errorMessage = response.message!;
        notifyListeners();
        return false;
      }
    } catch (e) {
      _errorMessage = AuthService.extractUserMessage(e);
      notifyListeners();
      return false;
    } finally {
      _setLoading(false);
    }
  }
}
