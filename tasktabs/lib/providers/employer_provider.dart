
import 'package:flutter/material.dart';
import 'package:tasktabs/models/employer.dart';
import 'package:tasktabs/services/employer_service.dart';

class EmployerProvider with ChangeNotifier {
  final EmployerService _employerService = EmployerService();
  List<Employer> _employers = [];

  List<Employer> get employers => _employers;

  Future<void> fetchEmployers() async {
    _employers = await _employerService.fetchEmployers();
    notifyListeners();
  }

  Future<void> addEmployer(Employer employer) async {
    await _employerService.addEmployer(employer);
    _employers.add(employer);
    notifyListeners();
  }
}

