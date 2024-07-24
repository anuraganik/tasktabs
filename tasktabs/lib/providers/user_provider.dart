
import 'package:flutter/material.dart';
import 'package:tasktabs/models/user.dart';
import 'package:tasktabs/services/user_service.dart';

class UserProvider with ChangeNotifier {
  final UserService _userService = UserService();
  List<User> _users = [];

  List<User> get users => _users;

  Future<void> fetchUsers() async {
    _users = await _userService.fetchUsers();
    notifyListeners();
  }

  Future<void> addUser(User user) async {
    await _userService.addUser(user);
    _users.add(user);
    notifyListeners();
  }
}

