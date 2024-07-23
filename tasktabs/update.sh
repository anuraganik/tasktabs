#!/bin/bash

# Define the base directory
BASE_DIR=$(pwd)

# Create necessary directories
mkdir -p lib/screens/home

# Write firebase_options.dart
cat <<EOL > $BASE_DIR/lib/firebase_options.dart
import 'package:firebase_core/firebase_core.dart';

class DefaultFirebaseOptions {
  static const FirebaseOptions currentPlatform = FirebaseOptions(
    apiKey: "AIzaSyBmn18oxref7PeY7gR5aY2gWTVbAFCoT78",
    authDomain: "tasktabs-auranik.firebaseapp.com",
    projectId: "tasktabs-auranik",
    storageBucket: "tasktabs-auranik.appspot.com",
    messagingSenderId: "40723457877",
    appId: "1:40723457877:web:d8bfb939719e264ca371dc",
    measurementId: "G-875SPF3YF5",
  );
}
EOL

# Write main.dart
cat <<EOL > $BASE_DIR/lib/main.dart
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
      title: 'TaskTabs',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
    );
  }
}
EOL

# Write home_screen.dart
cat <<EOL > $BASE_DIR/lib/screens/home/home_screen.dart
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TaskTabs Home'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Home Screen'),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DashboardScreen()),
                );
              },
              child: Text('Go to Dashboard'),
            ),
          ],
        ),
      ),
    );
  }
}

class DashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
      ),
      body: Center(
        child: Text('Welcome to the Dashboard'),
      ),
    );
  }
}
EOL

# Print completion message
echo "Project files have been updated successfully!"

