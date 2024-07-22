import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'screens/home_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: "AIzaSyBmn18oxref7PeY7gR5aY2gWTVbAFCoT78",
      authDomain: "tasktabs-auranik.firebaseapp.com",
      projectId: "tasktabs-auranik",
      storageBucket: "tasktabs-auranik.appspot.com",
      messagingSenderId: "40723457877",
      appId: "1:40723457877:web:example",
      measurementId: "G-example",
    ),
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

