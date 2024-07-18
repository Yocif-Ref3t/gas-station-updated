import 'regex.dart';

class DefaultValidation {
  static String? emailValidation(String? value) {
    if (value != null) {
      if (value.isEmpty) {
        return ("email_required");
      } else if (!(RegexApp().emailReg.hasMatch(value.trim()))) {
        return ("email_invalid");
      } else if (value
          .trim()
          .split("@")[0]
          .replaceAll(RegExp(r'[0-9]'), "")
          .isEmpty) {
        return ("email_invalid");
      } else {
        return null;
      }
    }
    return null;
  }

  static String? defaultEmailValidation(String? value) {
    if (value != null) {
      if (value.isEmpty) {
        return ("يجب اخال البريد الالكتروني");
      }
    }
    return null;
  }

  static String? defaultPasswordValidation(String? value) {
    if (value != null) {
      if (value.isEmpty) {
        return ("يجب ادخال الريقم السري");
      }
    }
    return null;
  }

  static String? defaultValidation(String? value) {
    if (value != null) {
      if (value.isEmpty) {
        return ("يجب ادخال المحتوي المطلوب");
      }
    }
    return null;
  }

  static String? defaultDropDownValidation(int? value) {
    if (value == null) {
      return ("يجب ادخال المحتوي المطلوب");
    }
    return null;
  }

  static String? passwordValidation(String? value) {
    if (value != null) {
      if (value.isEmpty) {
        return ("password_requird");
      } else if (!(value.length > 3)) {
        return ("passwors_short");
      } else if (!(value.length < 120)) {
        return ("passwors_long");
      } else {
        return null;
      }
    }
    return null;
  }
}
