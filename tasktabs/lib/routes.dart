
import 'package:flutter/material.dart';
import package:tasktabs/screens/auth/login_screen.dart;
import package:tasktabs/screens/auth/signup_screen.dart;
import package:tasktabs/screens/auth/verification_screen.dart;
import package:tasktabs/screens/home/dashboard_screen.dart;
import package:tasktabs/screens/home/home_screen.dart;
import package:tasktabs/screens/job/job_list_screen.dart;
import package:tasktabs/screens/job/job_detail_screen.dart;
import package:tasktabs/screens/job/post_job_screen.dart;
import package:tasktabs/screens/user/user_profile_screen.dart;
import package:tasktabs/screens/user/user_dashboard_screen.dart;
import package:tasktabs/screens/employer/employer_profile_screen.dart;
import package:tasktabs/screens/employer/employer_dashboard_screen.dart;

final Map<String, WidgetBuilder> routes = {
  /login: (context) => LoginScreen(),
  /signup: (context) => SignupScreen(),
  /verification: (context) => VerificationScreen(),
  /dashboard: (context) => DashboardScreen(),
  /home: (context) => HomeScreen(),
  /job-list: (context) => JobListScreen(),
  /job-detail: (context) => JobDetailScreen(job: Job(id: , title: , description: , employerId: , salary: 0.0)),
  /post-job: (context) => PostJobScreen(),
  /user-profile: (context) => UserProfileScreen(),
  /user-dashboard: (context) => UserDashboardScreen(),
  /employer-profile: (context) => EmployerProfileScreen(),
  /employer-dashboard: (context) => EmployerDashboardScreen(),
};

