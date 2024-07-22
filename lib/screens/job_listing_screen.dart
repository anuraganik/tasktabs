import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/job_provider.dart';
import '../widgets/job_card.dart';

class JobListingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final jobProvider = Provider.of<JobProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Job Listings'),
      ),
      body: FutureBuilder(
        future: jobProvider.fetchJobs(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('An error occurred!'));
          } else {
            return ListView.builder(
              itemCount: jobProvider.jobs.length,
              itemBuilder: (context, index) {
                return JobCard(job: jobProvider.jobs[index]);
              },
            );
          }
        },
      ),
    );
  }
}

