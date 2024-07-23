
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tasktabs/models/job.dart';

class JobService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<List<Job>> fetchJobs() async {
    QuerySnapshot snapshot = await _db.collection('jobs').get();
    return snapshot.docs.map((doc) => Job.fromFirestore(doc)).toList();
  }

  Future<void> addJob(Job job) async {
    await _db.collection('jobs').add(job.toMap());
  }
}
