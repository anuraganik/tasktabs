import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/job.dart';

class JobService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<List<Job>> getJobs() async {
    QuerySnapshot snapshot = await _db.collection('jobs').get();
    return snapshot.docs.map((doc) => Job(
      id: doc.id,
      title: doc['title'],
      description: doc['description'],
      employerId: doc['employerId'],
    )).toList();
  }

  Future<void> addJob(Job job) async {
    await _db.collection('jobs').add({
      'title': job.title,
      'description': job.description,
      'employerId': job.employerId,
    });
  }
}

