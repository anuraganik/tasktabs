
import 'package:flutter/material.dart';
import 'package:tasktabs/models/job.dart';
import 'package:tasktabs/services/job_service.dart';

class JobProvider with ChangeNotifier {
  final JobService _jobService = JobService();
  List<Job> _jobs = [];

  List<Job> get jobs => _jobs;

  Future<void> fetchJobs() async {
    _jobs = await _jobService.fetchJobs();
    notifyListeners();
  }

  Future<void> addJob(Job job) async {
    await _jobService.addJob(job);
    _jobs.add(job);
    notifyListeners();
  }
}

