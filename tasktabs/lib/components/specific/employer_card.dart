import 'package:flutter/material.dart';
import 'package:tasktabs/models/employer.dart';

class EmployerCard extends StatelessWidget {
  final Employer employer;
  final VoidCallback onTap;

  EmployerCard({required this.employer, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      child: ListTile(
        title: Text(employer.name),
        subtitle: Text(employer.company),
        trailing: Icon(Icons.arrow_forward),
        onTap: onTap,
      ),
    );
  }
}

