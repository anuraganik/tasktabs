import os

# Define the directory structure
directory_structure = {
    'lib/services': {
        'auth_service.dart': """
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<User?> signInWithEmail(String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(email: email, password: password);
      return result.user;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future<User?> signUpWithEmail(String email, String password) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      return result.user;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future<void> signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Stream<User?> get user {
    return _auth.authStateChanges();
  }
}
""",
        'job_service.dart': """
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
""",
        'payment_service.dart': """
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tasktabs/models/transaction.dart';

class PaymentService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<void> processPayment(Transaction transaction) async {
    await _db.collection('transactions').add(transaction.toMap());
  }

  Future<List<Transaction>> fetchTransactions(String userId) async {
    QuerySnapshot snapshot = await _db.collection('transactions').where('userId', isEqualTo: userId).get();
    return snapshot.docs.map((doc) => Transaction.fromFirestore(doc)).toList();
  }
}
""",
        'user_service.dart': """
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tasktabs/models/user.dart';

class UserService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<User> getUser(String userId) async {
    DocumentSnapshot doc = await _db.collection('users').doc(userId).get();
    return User.fromFirestore(doc);
  }

  Future<void> updateUser(User user) async {
    await _db.collection('users').doc(user.id).set(user.toMap());
  }
}
""",
        'employer_service.dart': """
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
"""
    }
}

# Create directories and files
for dir_path, files in directory_structure.items():
    os.makedirs(dir_path, exist_ok=True)
    for file_name, content in files.items():
        with open(os.path.join(dir_path, file_name), 'w') as f:
            f.write(content)

print("Services created successfully.")

