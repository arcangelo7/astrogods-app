import '../i18n/translations.g.dart';

class AuthValidators {
  static String? validateEmail(String? value, Translations t) {
    if (value == null || value.isEmpty) {
      return t.ui.pleaseFillAllFields;
    }
    if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
      return t.ui.invalidEmail;
    }
    return null;
  }

  static String? validatePassword(String? value, Translations t) {
    if (value == null || value.isEmpty) {
      return t.ui.pleaseFillAllFields;
    }
    if (value.length < 8) {
      return t.ui.passwordTooShort;
    }
    return null;
  }

  static String? validateConfirmPassword(
    String? value,
    String originalPassword,
    Translations t,
  ) {
    if (value == null || value.isEmpty) {
      return t.ui.pleaseFillAllFields;
    }
    if (value != originalPassword) {
      return t.ui.passwordsDoNotMatch;
    }
    return null;
  }

  static String? validateRequiredField(String? value, Translations t) {
    if (value == null || value.isEmpty) {
      return t.ui.pleaseFillAllFields;
    }
    return null;
  }
}
