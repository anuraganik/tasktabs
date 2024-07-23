
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tasktabs/models/employer.dart';

class EmployerProvider extends ChangeNotifier {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  List<Employer> _employers = [];

  List<Employer> get employers => _employers;

  Future<void> fetchEmployers() async {
    try {
      QuerySnapshot snapshot = await _firestore.collection('employers').get();
      _employers = snapshot.docs.map((doc) => Employer.fromMap(doc.data() as Map<String, dynamic>)).toList();
      notifyListeners();
    } catch (e) {
      print(e);
      throw e;
    }
  }

  Future<void> addEmployer(Employer employer) async {
    try {
      await _firestore.collection('employers').add(employer.toMap());
      _employers.add(employer);
      notifyListeners();
    } catch (e) {
      print(e);
      throw e;
    }
  }
}
