import os

# Define the directory structure
directory_structure = {
    'lib/widgets': {
        'custom_app_bar.dart': """
import 'package:flutter/material.dart';
import 'package:tasktabs/utils/constants.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final List<Widget>? actions;

  CustomAppBar({required this.title, this.actions});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title, style: AppConstants.headingStyle),
      backgroundColor: AppConstants.primaryColor,
      actions: actions,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
""",
        'custom_drawer.dart': """
import 'package:flutter/material.dart';
import 'package:tasktabs/utils/constants.dart';

class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: AppConstants.primaryColor,
            ),
            child: Text(
              AppConstants.appName,
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Home'),
            onTap: () {
              Navigator.pushNamed(context, '/home');
            },
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text('Profile'),
            onTap: () {
              Navigator.pushNamed(context, '/profile');
            },
          ),
          ListTile(
            leading: Icon(Icons.work),
            title: Text('Jobs'),
            onTap: () {
              Navigator.pushNamed(context, '/jobs');
            },
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Settings'),
            onTap: () {
              Navigator.pushNamed(context, '/settings');
            },
          ),
        ],
      ),
    );
  }
}
""",
        'loading_indicator.dart': """
import 'package:flutter/material.dart';

class LoadingIndicator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(),
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

print("Widgets created successfully.")

