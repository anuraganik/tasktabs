import 'package:flutter/material.dart';
import '../models/job.dart';
import '../services/job_service.dart';

class JobProvider with ChangeNotifier {
  final JobService _jobService = JobService();
  List<Job> _jobs = [];

  List<Job> get jobs => _jobs;

  Future<void> fetchJobs() async {
    _jobs = await _jobService.getJobs();
    notifyListeners();
  }

  Future<void> addJob(Job job) async {
    await _jobService.addJob(job);
    _jobs.add(job);
    notifyListeners();
  }
}

