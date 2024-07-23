import os

# Define the directory structure
directory_structure = {
    'lib': {
        'providers': {
            'auth_provider.dart': """
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthProvider extends ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  User? _user;

  User? get user => _user;

  Future<void> signInWithEmail(String email, String password) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(email: email, password: password);
      _user = userCredential.user;
      notifyListeners();
    } catch (e) {
      print(e);
      throw e;
    }
  }

  Future<void> signUpWithEmail(String email, String password) async {
    try {
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      _user = userCredential.user;
      notifyListeners();
    } catch (e) {
      print(e);
      throw e;
    }
  }

  Future<void> signOut() async {
    await _auth.signOut();
    _user = null;
    notifyListeners();
  }
}
""",
            'job_provider.dart': """
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
""",
            'user_provider.dart': """
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tasktabs/models/user.dart';

class UserProvider extends ChangeNotifier {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  List<User> _users = [];

  List<User> get users => _users;

  Future<void> fetchUsers() async {
    try {
      QuerySnapshot snapshot = await _firestore.collection('users').get();
      _users = snapshot.docs.map((doc) => User.fromMap(doc.data() as Map<String, dynamic>)).toList();
      notifyListeners();
    } catch (e) {
      print(e);
      throw e;
    }
  }

  Future<void> addUser(User user) async {
    try {
      await _firestore.collection('users').add(user.toMap());
      _users.add(user);
      notifyListeners();
    } catch (e) {
      print(e);
      throw e;
    }
  }
}
""",
            'employer_provider.dart': """
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
"""
        }
    }
}

# Create directories and files
for root, dirs in directory_structure.items():
    for dir, files in dirs.items():
        os.makedirs(os.path.join(root, dir), exist_ok=True)
        for file, content in files.items():
            with open(os.path.join(root, dir, file), 'w') as f:
                f.write(content)

print("Providers created successfully.")

