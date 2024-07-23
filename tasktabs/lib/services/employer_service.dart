
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tasktabs/models/employer.dart';

class EmployerService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<Employer> getEmployer(String employerId) async {
    DocumentSnapshot doc = await _db.collection('employers').doc(employerId).get();
    return Employer.fromFirestore(doc);
  }

  Future<void> updateEmployer(Employer employer) async {
    await _db.collection('employers').doc(employer.id).set(employer.toMap());
  }
}
