
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tasktabs/providers/job_provider.dart';
import 'package:tasktabs/models/job.dart';
import 'package:tasktabs/components/common/input_field.dart';
import 'package:tasktabs/components/common/button.dart';

class PostJobScreen extends StatelessWidget {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final jobProvider = Provider.of<JobProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Post Job'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            CustomInputField(
              label: 'Job Title',
              controller: _titleController,
            ),
            SizedBox(height: 10),
            CustomInputField(
              label: 'Job Description',
              controller: _descriptionController,
            ),
            SizedBox(height: 20),
            CustomButton(
              text: 'Post Job',
              onPressed: () async {
                Job job = Job(
                  id: DateTime.now().toString(),
                  title: _titleController.text,
                  description: _descriptionController.text,
                  employerId: 'employer_id',
                  date: DateTime.now(),
                );
                await jobProvider.addJob(job);
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
