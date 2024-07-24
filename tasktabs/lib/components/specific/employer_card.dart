
import 'package:flutter/material.dart';
import 'package:tasktabs/models/employer.dart';

class EmployerCard extends StatelessWidget {
  final Employer employer;

  EmployerCard({required this.employer});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(employer.name),
        subtitle: Text(employer.companyName),
      ),
    );
  }
}

