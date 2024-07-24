
import 'package:flutter/material.dart';
import 'package:tasktabs/models/job.dart';

class JobDetailScreen extends StatelessWidget {
  final Job job;

  JobDetailScreen({required this.job});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(job.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text("Description: ${job.description}"),
            SizedBox(height: 20),
            Text("Employer ID: ${job.employerId}"),
            SizedBox(height: 20),
            Text("Salary: \$${job.salary}"),
          ],
        ),
      ),
    );
  }
}

