import os

# Define the directory structure
directory_structure = {
    'lib/test/widget': {
        'home_screen_test.dart': """
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tasktabs/screens/home/home_screen.dart';
import 'package:tasktabs/providers/job_provider.dart';
import 'package:provider/provider.dart';
import 'package:tasktabs/models/job.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';
import 'home_screen_test.mocks.dart';

@GenerateMocks([JobProvider])
void main() {
  group('HomeScreen Widget Tests', () {
    testWidgets('HomeScreen displays jobs', (WidgetTester tester) async {
      final mockJobProvider = MockJobProvider();
      final job = Job(id: '1', title: 'Test Job', description: 'Job Description', employerId: '1');
      when(mockJobProvider.jobs).thenReturn([job]);

      await tester.pumpWidget(
        ChangeNotifierProvider<JobProvider>.value(
          value: mockJobProvider,
          child: MaterialApp(
            home: HomeScreen(),
          ),
        ),
      );

      expect(find.text('Test Job'), findsOneWidget);
      expect(find.text('Job Description'), findsOneWidget);
    });
  });
}
""",
        'job_list_screen_test.dart': """
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tasktabs/screens/job/job_list_screen.dart';
import 'package:tasktabs/providers/job_provider.dart';
import 'package:provider/provider.dart';
import 'package:tasktabs/models/job.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';
import 'job_list_screen_test.mocks.dart';

@GenerateMocks([JobProvider])
void main() {
  group('JobListScreen Widget Tests', () {
    testWidgets('JobListScreen displays job list', (WidgetTester tester) async {
      final mockJobProvider = MockJobProvider();
      final job = Job(id: '1', title: 'Test Job', description: 'Job Description', employerId: '1');
      when(mockJobProvider.jobs).thenReturn([job]);

      await tester.pumpWidget(
        ChangeNotifierProvider<JobProvider>.value(
          value: mockJobProvider,
          child: MaterialApp(
            home: JobListScreen(),
          ),
        ),
      );

      expect(find.text('Test Job'), findsOneWidget);
      expect(find.text('Job Description'), findsOneWidget);
    });
  });
}
""",
        'user_dashboard_test.dart': """
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tasktabs/screens/user/user_dashboard_screen.dart';
import 'package:tasktabs/providers/user_provider.dart';
import 'package:provider/provider.dart';
import 'package:tasktabs/models/user.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';
import 'user_dashboard_test.mocks.dart';

@GenerateMocks([UserProvider])
void main() {
  group('UserDashboardScreen Widget Tests', () {
    testWidgets('UserDashboardScreen displays user info', (WidgetTester tester) async {
      final mockUserProvider = MockUserProvider();
      final user = User(id: '1', name: 'Test User', email: 'test@test.com', phoneNumber: '1234567890');
      when(mockUserProvider.user).thenReturn(user);

      await tester.pumpWidget(
        ChangeNotifierProvider<UserProvider>.value(
          value: mockUserProvider,
          child: MaterialApp(
            home: UserDashboardScreen(),
          ),
        ),
      );

      expect(find.text('Test User'), findsOneWidget);
      expect(find.text('test@test.com'), findsOneWidget);
    });
  });
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

print("Widget test files created successfully.")

