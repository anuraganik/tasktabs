
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tasktabs/models/job.dart';

class JobProvider extends ChangeNotifier {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  List<Job> _jobs = [];

  List<Job> get jobs => _jobs;

  Future<void> fetchJobs() async {
    try {
      QuerySnapshot snapshot = await _firestore.collection('jobs').get();
      _jobs = snapshot.docs.map((doc) => Job.fromMap(doc.data() as Map<String, dynamic>)).toList();
      notifyListeners();
    } catch (e) {
      print(e);
      throw e;
    }
  }

  Future<void> addJob(Job job) async {
    try {
      await _firestore.collection('jobs').add(job.toMap());
      _jobs.add(job);
      notifyListeners();
    } catch (e) {
      print(e);
      throw e;
    }
  }
}
