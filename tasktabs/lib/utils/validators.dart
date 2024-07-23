
class Validators {
  static String? validateEmail(String value) {
    if (value.isEmpty) {
      return 'Email cannot be empty';
    }
    final RegExp emailExp = RegExp(r'^[^@]+@[^@]+\.[^@]+');
    if (!emailExp.hasMatch(value)) {
      return 'Invalid email address';
    }
    return null;
  }

  static String? validatePassword(String value) {
    if (value.isEmpty) {
      return 'Password cannot be empty';
    }
    if (value.length < 6) {
      return 'Password must be at least 6 characters long';
    }
    return null;
  }

  static String? validateName(String value) {
    if (value.isEmpty) {
      return 'Name cannot be empty';
    }
    return null;
  }

  static String? validatePhoneNumber(String value) {
    if (value.isEmpty) {
      return 'Phone number cannot be empty';
    }
    final RegExp phoneExp = RegExp(r'^\+?[0-9]{10,12}$');
    if (!phoneExp.hasMatch(value)) {
      return 'Invalid phone number';
    }
    return null;
  }
}
