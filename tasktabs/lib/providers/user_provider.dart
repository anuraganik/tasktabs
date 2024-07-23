
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
