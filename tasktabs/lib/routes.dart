
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
