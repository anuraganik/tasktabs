
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tasktabs/providers/employer_provider.dart';
import 'package:tasktabs/models/employer.dart';

class EmployerProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final employerProvider = Provider.of<EmployerProvider>(context);
    final Employer employer = ModalRoute.of(context)!.settings.arguments as Employer;

    return Scaffold(
      appBar: AppBar(
        title: Text(employer.name),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(employer.name, style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            Text(employer.company),
            SizedBox(height: 10),
            Text(employer.email),
            SizedBox(height: 10),
            Text(employer.phoneNumber),
          ],
        ),
      ),
    );
  }
}
