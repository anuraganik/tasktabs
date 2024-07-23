
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
