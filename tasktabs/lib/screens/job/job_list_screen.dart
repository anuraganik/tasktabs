
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tasktabs/providers/job_provider.dart';
import 'package:tasktabs/components/specific/job_card.dart';

class JobListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final jobProvider = Provider.of<JobProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Jobs'),
      ),
      body: FutureBuilder(
        future: jobProvider.fetchJobs(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          return ListView.builder(
            itemCount: jobProvider.jobs.length,
            itemBuilder: (context, index) {
              return JobCard(
                job: jobProvider.jobs[index],
                onTap: () {
                  Navigator.pushNamed(context, '/job_detail', arguments: jobProvider.jobs[index]);
                },
              );
            },
          );
        },
      ),
    );
  }
}
