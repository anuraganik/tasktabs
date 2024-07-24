#!/bin/bash

# Define the project directory
PROJECT_DIR="path_to_your_flutter_project" # Replace with your actual project path
MAIN_FILE="$PROJECT_DIR/lib/main.dart"
PUBSPEC_FILE="$PROJECT_DIR/pubspec.yaml"
ASSETS_DIR="$PROJECT_DIR/assets"

# Create the necessary directories
mkdir -p "$ASSETS_DIR"

# Copy the image file to the assets directory
cp path_to_image/image.png "$ASSETS_DIR" # Replace with your actual image path

# Update main.dart file
cat <<EOF > "$MAIN_FILE"
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Temper',
      theme: ThemeData(
        primarySwatch: Colors.green,
        scaffoldBackgroundColor: Color(0xFF083E4A),
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Temper'),
        actions: [
          TextButton(
            onPressed: () {},
            child: Text(
              'Log in',
              style: TextStyle(color: Colors.white),
            ),
          ),
          TextButton(
            onPressed: () {},
            child: Text(
              'Sign up now',
              style: TextStyle(color: Colors.white, backgroundColor: Colors.green),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: 300,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/image.png'), // Replace with the path to your image
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(
                  height: 300,
                  color: Colors.black.withOpacity(0.5),
                ),
                Positioned(
                  bottom: 50,
                  left: 20,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'WORK TO LIVE',
                        style: TextStyle(
                          fontSize: 48,
                          fontWeight: FontWeight.bold,
                          color: Colors.green,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Create a life you enjoy. Experience flexibility, security and lots of opportunities to grow. Welcome to your shift platform.',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Sign up today. Work tomorrow.',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.green,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: DropdownButtonFormField<String>(
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        hintText: 'All categories',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      items: ['Category 1', 'Category 2'].map((String category) {
                        return DropdownMenuItem<String>(
                          value: category,
                          child: Text(category),
                        );
                      }).toList(),
                      onChanged: (value) {},
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: TextFormField(
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        hintText: 'Location',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(horizontal: 32, vertical: 20),
                      backgroundColor: Colors.purple,
                    ),
                    child: Text('Find a shift'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
EOF

# Update pubspec.yaml file to include assets
if ! grep -q "assets:" "$PUBSPEC_FILE"; then
  echo "Updating $PUBSPEC_FILE to include assets"
  cat <<EOF >> "$PUBSPEC_FILE"

flutter:
  assets:
    - assets/image.png
EOF
else
  echo "Assets already included in $PUBSPEC_FILE"
fi

echo "Flutter project updated successfully."

