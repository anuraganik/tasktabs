#!/bin/bash

# Create necessary directories
mkdir -p lib/components/common
mkdir -p lib/screens/home
mkdir -p lib/screens/auth
mkdir -p lib/models
mkdir -p lib/services
mkdir -p lib/utils
mkdir -p lib/widgets

# Create firebase_options.dart
cat <<EOL > lib/firebase_options.dart
import 'package:firebase_core/firebase_core.dart';

class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    return FirebaseOptions(
      apiKey: "AIzaSyBmn18oxref7PeY7gR5aY2gWTVbAFCoT78",
      authDomain: "tasktabs-auranik.firebaseapp.com",
      projectId: "tasktabs-auranik",
      storageBucket: "tasktabs-auranik.appspot.com",
      messagingSenderId: "40723457877",
      appId: "1:40723457877:web:d8bfb939719e264ca371dc",
      measurementId: "G-875SPF3YF5",
    );
  }
}
EOL

# Create button.dart
cat <<EOL > lib/components/common/button.dart
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color color;

  CustomButton({required this.text, required this.onPressed, required this.color});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: color, // Changed from 'primary' to 'backgroundColor'
      ),
      onPressed: onPressed,
      child: Text(text),
    );
  }
}
EOL

# Create main.dart
cat <<EOL > lib/main.dart
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'screens/home/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tasktabs',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
    );
  }
}
EOL

# Create home_screen.dart
cat <<EOL > lib/screens/home/home_screen.dart
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Screen'),
      ),
      body: Center(
        child: Text('Welcome to Home Screen'),
      ),
    );
  }
}
EOL

# Update pubspec.yaml
cat <<EOL > pubspec.yaml
name: tasktabs
description: A new Flutter project for finding temporary workers and work shifts.

publish_to: 'none' # Remove this line if you wish to publish to pub.dev

version: 1.0.0+1

environment:
  sdk: ">=2.12.0 <3.0.0"

dependencies:
  flutter:
    sdk: flutter
  provider: ^6.0.1
  firebase_core: ^2.0.0
  firebase_auth: ^4.0.0
  cloud_firestore: ^4.0.0
  firebase_messaging: ^14.9.4

dev_dependencies:
  flutter_test:
    sdk: flutter
  mockito: ^5.0.15

flutter:
  uses-material-design: true

  assets:
    - assets/images/
    - assets/fonts/
    - assets/icons/
EOL

# Get dependencies
flutter pub get

echo "Setup complete. You can now run 'flutter run -d chrome' to start the application."

