
import 'package:flutter_test/flutter_test.dart';
import 'package:tasktabs/providers/job_provider.dart';
import 'package:tasktabs/models/job.dart';
import 'package:tasktabs/services/job_service.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';
import 'job_provider_test.mocks.dart';

@GenerateMocks([JobService])
void main() {
  group('JobProvider', () {
    MockJobService mockJobService;
    JobProvider jobProvider;

    setUp(() {
      mockJobService = MockJobService();
      jobProvider = JobProvider(jobService: mockJobService);
    });

    test('fetchJobs updates job list', () async {
      final job = Job(id: '1', title: 'Test Job', description: 'Job Description', employerId: '1');
      when(mockJobService.fetchJobs()).thenAnswer((_) async => [job]);

      await jobProvider.fetchJobs();

      expect(jobProvider.jobs, contains(job));
    });

    test('addJob adds a job to the list', () async {
      final job = Job(id: '1', title: 'Test Job', description: 'Job Description', employerId: '1');

      await jobProvider.addJob(job);

      verify(mockJobService.addJob(job)).called(1);
      expect(jobProvider.jobs, contains(job));
    });
  });
}
