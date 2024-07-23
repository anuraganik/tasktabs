
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
