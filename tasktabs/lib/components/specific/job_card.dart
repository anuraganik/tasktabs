
import 'package:flutter/material.dart';
import 'package:tasktabs/models/job.dart';

class JobCard extends StatelessWidget {
  final Job job;

  JobCard({required this.job});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(job.title),
        subtitle: Text(job.description),
      ),
    );
  }
}

