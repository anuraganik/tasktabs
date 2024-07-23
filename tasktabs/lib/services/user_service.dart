
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
