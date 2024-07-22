import 'package:flutter/material.dart';

class EmployerCard extends StatelessWidget {
  final String employerName;

  EmployerCard({required this.employerName});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(employerName),
      ),
    );
  }
}

