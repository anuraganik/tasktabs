
import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Text("Menu"),
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
          ),
          ListTile(
            title: Text("Dashboard"),
            onTap: () {
              Navigator.pushNamed(context, "/dashboard");
            },
          ),
          ListTile(
            title: Text("Job List"),
            onTap: () {
              Navigator.pushNamed(context, "/job-list");
            },
          ),
        ],
      ),
    );
  }
}

