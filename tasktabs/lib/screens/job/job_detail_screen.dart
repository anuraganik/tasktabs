
import 'package:flutter/material.dart';
import 'package:tasktabs/models/job.dart';

class JobDetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Job job = ModalRoute.of(context)!.settings.arguments as Job;

    return Scaffold(
      appBar: AppBar(
        title: Text(job.title),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(job.title, style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            Text(job.description),
          ],
        ),
      ),
    );
  }
}
