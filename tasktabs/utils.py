import os

# Define the directory structure
directory_structure = {
    'lib/utils': {
        'constants.dart': """
import 'package:flutter/material.dart';

class AppConstants {
  static const String appName = 'TaskTabs';

  // Colors
  static const Color primaryColor = Color(0xFF6200EE);
  static const Color primaryColorLight = Color(0xFFBB86FC);
  static const Color primaryColorDark = Color(0xFF3700B3);

  // Text Styles
  static const TextStyle headingStyle = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
  );
  static const TextStyle bodyStyle = TextStyle(
    fontSize: 16,
  );
}
""",
        'validators.dart': """
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
""",
        'formatters.dart': """
import 'package:intl/intl.dart';

class Formatters {
  static String formatDate(DateTime date) {
    final DateFormat formatter = DateFormat('yyyy-MM-dd');
    return formatter.format(date);
  }

  static String formatCurrency(double amount) {
    final NumberFormat formatter = NumberFormat.simpleCurrency();
    return formatter.format(amount);
  }
}
"""
    }
}

# Create directories and files
for dir_path, files in directory_structure.items():
    os.makedirs(dir_path, exist_ok=True)
    for file_name, content in files.items():
        with open(os.path.join(dir_path, file_name), 'w') as f:
            f.write(content)

print("Utils created successfully.")

