import os

# Define the directory structure
directory_structure = {
    'lib/screens/auth': {
        'login_screen.dart': """
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tasktabs/providers/auth_provider.dart';
import 'package:tasktabs/components/common/input_field.dart';
import 'package:tasktabs/components/common/button.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            CustomInputField(
              label: 'Email',
              controller: _emailController,
            ),
            SizedBox(height: 10),
            CustomInputField(
              label: 'Password',
              controller: _passwordController,
              obscureText: true,
            ),
            SizedBox(height: 20),
            CustomButton(
              text: 'Login',
              onPressed: () async {
                try {
                  await authProvider.signInWithEmail(
                    _emailController.text,
                    _passwordController.text,
                  );
                  Navigator.pushNamed(context, '/home');
                } catch (e) {
                  // Handle error
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
""",
        'signup_screen.dart': """
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tasktabs/providers/auth_provider.dart';
import 'package:tasktabs/components/common/input_field.dart';
import 'package:tasktabs/components/common/button.dart';

class SignupScreen extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Sign Up'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            CustomInputField(
              label: 'Email',
              controller: _emailController,
            ),
            SizedBox(height: 10),
            CustomInputField(
              label: 'Password',
              controller: _passwordController,
              obscureText: true,
            ),
            SizedBox(height: 20),
            CustomButton(
              text: 'Sign Up',
              onPressed: () async {
                try {
                  await authProvider.signUpWithEmail(
                    _emailController.text,
                    _passwordController.text,
                  );
                  Navigator.pushNamed(context, '/verification');
                } catch (e) {
                  // Handle error
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
""",
        'verification_screen.dart': """
import 'package:flutter/material.dart';

class VerificationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Verification'),
      ),
      body: Center(
        child: Text('Please verify your email.'),
      ),
    );
  }
}
"""
    },
    'lib/screens/home': {
        'home_screen.dart': """
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tasktabs/providers/job_provider.dart';
import 'package:tasktabs/components/specific/job_card.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final jobProvider = Provider.of<JobProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
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
""",
        'dashboard_screen.dart': """
import 'package:flutter/material.dart';

class DashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
      ),
      body: Center(
        child: Text('Welcome to your dashboard!'),
      ),
    );
  }
}
"""
    },
    'lib/screens/job': {
        'job_list_screen.dart': """
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
""",
        'job_detail_screen.dart': """
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
""",
        'post_job_screen.dart': """
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
"""
    },
    'lib/screens/user': {
        'user_profile_screen.dart': """
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tasktabs/providers/user_provider.dart';
import 'package:tasktabs/models/user.dart';

class UserProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
    final User user = ModalRoute.of(context)!.settings.arguments as User;

    return Scaffold(
      appBar: AppBar(
        title: Text(user.name),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(user.name, style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            Text(user.email),
            SizedBox(height: 10),
            Text(user.phoneNumber),
          ],
        ),
      ),
    );
  }
}
""",
        'user_dashboard_screen.dart': """
import 'package:flutter/material.dart';

class UserDashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Dashboard'),
      ),
      body: Center(
        child: Text('Welcome to your dashboard!'),
      ),
    );
  }
}
"""
    },
    'lib/screens/employer': {
        'employer_profile_screen.dart': """
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
""",
        'employer_dashboard_screen.dart': """
import 'package:flutter/material.dart';

class EmployerDashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Employer Dashboard'),
      ),
      body: Center(
        child: Text('Welcome to your dashboard!'),
      ),
    );
  }
}
"""
    }
}

# Create directories and files
for dir_path, files in directory_structure.items():
    os.makedirs(dir_path, exist_ok=True)
    for file_name, content in files.items():
        with open(os.path.join(dir_path, file_name), 'w') as f:
            f.write(content)

print("Screens created successfully.")

