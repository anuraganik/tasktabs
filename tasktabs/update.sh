#!/bin/bash

# Function to update Dart files
update_dart_file() {
  local filepath=$1
  local content=$2

  mkdir -p "$(dirname "$filepath")"
  echo "$content" > "$filepath"
}

# Update the main.dart file
update_dart_file "lib/main.dart" '
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tasktabs/providers/auth_provider.dart';
import 'package:tasktabs/providers/job_provider.dart';
import 'package:tasktabs/providers/user_provider.dart';
import 'package:tasktabs/providers/employer_provider.dart';
import 'package:tasktabs/screens/home/home_screen.dart';
import 'package:tasktabs/screens/job/job_list_screen.dart';
import 'package:tasktabs/screens/job/job_detail_screen.dart';
import 'package:tasktabs/screens/job/post_job_screen.dart';
import 'package:tasktabs/screens/user/user_profile_screen.dart';
import 'package:tasktabs/screens/user/user_dashboard_screen.dart';
import 'package:tasktabs/screens/employer/employer_profile_screen.dart';
import 'package:tasktabs/screens/employer/employer_dashboard_screen.dart';
import 'package:tasktabs/firebase_options.dart';
import 'firebase_core/firebase_core.dart';

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
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider()),
        ChangeNotifierProvider(create: (_) => JobProvider()),
        ChangeNotifierProvider(create: (_) => UserProvider()),
        ChangeNotifierProvider(create: (_) => EmployerProvider()),
      ],
      child: MaterialApp(
        title: 'TaskTabs',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: HomeScreen(),
        routes: {
          '/dashboard': (context) => DashboardScreen(),
          '/job-list': (context) => JobListScreen(),
          '/job-detail': (context) => JobDetailScreen(job: Job(id: '', title: '', description: '', employerId: '', salary: 0.0)),
          '/post-job': (context) => PostJobScreen(),
          '/user-profile': (context) => UserProfileScreen(),
          '/user-dashboard': (context) => UserDashboardScreen(),
          '/employer-profile': (context) => EmployerProfileScreen(),
          '/employer-dashboard': (context) => EmployerDashboardScreen(),
        },
      ),
    );
  }
}
'

echo "Files updated successfully."

