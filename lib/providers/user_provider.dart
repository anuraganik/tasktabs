import 'package:flutter/material.dart';
import '../models/user.dart';
import '../services/user_service.dart';

class UserProvider with ChangeNotifier {
  final UserService _userService = UserService();
  User? _user;

  User? get user => _user;

  Future<void> fetchUser(String userId) async {
    _user = await _userService.getUser(userId);
    notifyListeners();
  }

  Future<void> updateUser(User user) async {
    await _userService.updateUser(user);
    _user = user;
    notifyListeners();
  }
}

