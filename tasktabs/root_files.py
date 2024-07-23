import os

# Define the directory structure
root_files = {
    'lib/firebase_options.dart': """
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_core_platform_interface/firebase_core_platform_interface.dart';

class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (FirebasePlatform.instance is FirebaseAndroidPlatform) {
      return android;
    } else if (FirebasePlatform.instance is FirebaseIOSPlatform) {
      return ios;
    } else if (FirebasePlatform.instance is FirebaseWebPlatform) {
      return web;
    }
    throw UnsupportedError('DefaultFirebaseOptions are not supported for this platform.');
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: "AIzaSyBmn18oxref7PeY7gR5aY2gWTVbAFCoT78",
    authDomain: "tasktabs-auranik.firebaseapp.com",
    projectId: "tasktabs-auranik",
    storageBucket: "tasktabs-auranik.appspot.com",
    messagingSenderId: "40723457877",
    appId: "1:40723457877:web:d8bfb939719e264ca371dc",
    measurementId: "G-875SPF3YF5",
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: "AIzaSyBmn18oxref7PeY7gR5aY2gWTVbAFCoT78",
    authDomain: "tasktabs-auranik.firebaseapp.com",
    projectId: "tasktabs-auranik",
    storageBucket: "tasktabs-auranik.appspot.com",
    messagingSenderId: "40723457877",
    appId: "1:40723457877:android:d8bfb939719e264ca371dc",
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: "AIzaSyBmn18oxref7PeY7gR5aY2gWTVbAFCoT78",
    authDomain: "tasktabs-auranik.firebaseapp.com",
    projectId: "tasktabs-auranik",
    storageBucket: "tasktabs-auranik.appspot.com",
    messagingSenderId: "40723457877",
    appId: "1:40723457877:ios:d8bfb939719e264ca371dc",
    iosBundleId: "com.example.tasktabs",
  );
}
""",
    'lib/main.dart': """
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:provider/provider.dart';
import 'providers/auth_provider.dart';
import 'providers/job_provider.dart';
import 'providers/user_provider.dart';
import 'providers/employer_provider.dart';
import 'screens/auth/login_screen.dart';
import 'screens/auth/signup_screen.dart';
import 'screens/auth/verification_screen.dart';
import 'screens/home/home_screen.dart';
import 'screens/home/dashboard_screen.dart';
import 'screens/job/job_list_screen.dart';
import 'screens/job/job_detail_screen.dart';
import 'screens/job/post_job_screen.dart';
import 'screens/user/user_profile_screen.dart';
import 'screens/user/user_dashboard_screen.dart';
import 'screens/employer/employer_profile_screen.dart';
import 'screens/employer/employer_dashboard_screen.dart';
import 'routes.dart';

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
          primarySwatch: Colors.purple,
        ),
        initialRoute: '/',
        routes: appRoutes,
      ),
    );
  }
}
""",
    'lib/routes.dart': """
import 'package:flutter/material.dart';
import 'screens/auth/login_screen.dart';
import 'screens/auth/signup_screen.dart';
import 'screens/auth/verification_screen.dart';
import 'screens/home/home_screen.dart';
import 'screens/home/dashboard_screen.dart';
import 'screens/job/job_list_screen.dart';
import 'screens/job/job_detail_screen.dart';
import 'screens/job/post_job_screen.dart';
import 'screens/user/user_profile_screen.dart';
import 'screens/user/user_dashboard_screen.dart';
import 'screens/employer/employer_profile_screen.dart';
import 'screens/employer/employer_dashboard_screen.dart';

final Map<String, WidgetBuilder> appRoutes = {
  '/': (context) => LoginScreen(),
  '/signup': (context) => SignupScreen(),
  '/verification': (context) => VerificationScreen(),
  '/home': (context) => HomeScreen(),
  '/dashboard': (context) => DashboardScreen(),
  '/jobs': (context) => JobListScreen(),
  '/job_detail': (context) => JobDetailScreen(),
  '/post_job': (context) => PostJobScreen(),
  '/user_profile': (context) => UserProfileScreen(),
  '/user_dashboard': (context) => UserDashboardScreen(),
  '/employer_profile': (context) => EmployerProfileScreen(),
  '/employer_dashboard': (context) => EmployerDashboardScreen(),
};
"""
}

# Create root files
for file_path, content in root_files.items():
    dir_name = os.path.dirname(file_path)
    if dir_name:
        os.makedirs(dir_name, exist_ok=True)
    with open(file_path, 'w') as f:
        f.write(content)

print("Root files created successfully.")

