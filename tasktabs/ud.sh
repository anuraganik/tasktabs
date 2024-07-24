#!/bin/bash

# Define the paths
FLUTTER_PROJECT_DIR="$HOME/tasktabs/tasktabs"
ASSETS_DIR="$FLUTTER_PROJECT_DIR/assets"
LIB_DIR="$FLUTTER_PROJECT_DIR/lib"
IMAGE_SOURCE="$FLUTTER_PROJECT_DIR/image.png"
MAIN_DART_FILE="$LIB_DIR/main.dart"
PUBSPEC_FILE="$FLUTTER_PROJECT_DIR/pubspec.yaml"

# Create assets directory if it does not exist
mkdir -p "$ASSETS_DIR"

# Copy the image to the assets directory
cp "$IMAGE_SOURCE" "$ASSETS_DIR/image.png"

# Update main.dart
cat > "$MAIN_DART_FILE" <<EOL
import 'package:flutter/material.dart';

void main() {
  runApp(TaskTapsApp());
}

class TaskTapsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TaskTaps',
      theme: ThemeData(
        primarySwatch: Colors.green,
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
        title: Text('TaskTaps'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset('assets/image.png'),
            SizedBox(height: 20),
            Text(
              'WORK TO LIVE',
              style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold, color: Colors.green),
            ),
            SizedBox(height: 10),
            Text(
              'Create a life you enjoy. Experience flexibility, security\nand lots of opportunities to grow. Welcome to your shift\nplatform.',
              style: TextStyle(fontSize: 16, color: Colors.white),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 10),
            Text(
              'Sign up today. Work tomorrow.',
              style: TextStyle(fontSize: 16, color: Colors.green),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Expanded(
                    child: DropdownButtonFormField(
                      items: [
                        DropdownMenuItem(child: Text('Category 1'), value: 'Category 1'),
                        DropdownMenuItem(child: Text('Category 2'), value: 'Category 2'),
                      ],
                      onChanged: (value) {},
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Category',
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Location',
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text('Find a shift'),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.purple,
                    ),
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
EOL

# Update pubspec.yaml to include assets
if ! grep -q "assets:" "$PUBSPEC_FILE"; then
  echo "flutter:" >> "$PUBSPEC_FILE"
  echo "  assets:" >> "$PUBSPEC_FILE"
  echo "    - assets/image.png" >> "$PUBSPEC_FILE"
else
  if ! grep -q "assets/image.png" "$PUBSPEC_FILE"; then
    sed -i "/assets:/a\    - assets/image.png" "$PUBSPEC_FILE"
  fi
fi

echo "Flutter project updated successfully."

