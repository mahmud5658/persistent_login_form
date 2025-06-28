class InputValidator {
  static final RegExp _emailRegExp =
  RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');

  static final RegExp _passwordRegExp = RegExp(r'^.{7,}$');

  static final RegExp _nameRegExp = RegExp(r'^[A-Za-z\s]+$');

  static String? validateEmail(String value) {
    if (value.isEmpty) {
      return 'Email is required';
    } else if (!_emailRegExp.hasMatch(value)) {
      return 'Enter a valid email address';
    }
    return null;
  }

  static String? validatePassword(String value) {
    if (value.isEmpty) {
      return 'Password is required';
    } else if (!_passwordRegExp.hasMatch(value)) {
      return 'Password must be at least 7 characters long';
    }
    return null;
  }

  static String? validateName(String value) {
    if (value.isEmpty) {
      return 'Name is required';
    } else if (!_nameRegExp.hasMatch(value)) {
      return 'Name can only contain letters and spaces';
    }
    return null;
  }
}
