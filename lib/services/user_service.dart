import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/user.dart';

class UserService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<User> getUser(String userId) async {
    DocumentSnapshot doc = await _db.collection('users').doc(userId).get();
    return User(
      id: doc.id,
      name: doc['name'],
      email: doc['email'],
    );
  }

  Future<void> updateUser(User user) async {
    await _db.collection('users').doc(user.id).update({
      'name': user.name,
      'email': user.email,
    });
  }
}

