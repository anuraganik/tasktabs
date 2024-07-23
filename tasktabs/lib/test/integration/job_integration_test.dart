
import 'package:flutter_test/flutter_test.dart';
import 'package:tasktabs/providers/job_provider.dart';
import 'package:tasktabs/models/job.dart';

void main() {
  group('Job Integration Tests', () {
    test('fetchJobs retrieves job list', () async {
      final jobProvider = JobProvider();

      await jobProvider.fetchJobs();

      expect(jobProvider.jobs, isNotEmpty);
    });

    test('addJob adds a job', () async {
      final jobProvider = JobProvider();
      final job = Job(id: '1', title: 'Integration Test Job', description: 'Job Description', employerId: '1');

      await jobProvider.addJob(job);

      expect(jobProvider.jobs, contains(job));
    });
  });
}
