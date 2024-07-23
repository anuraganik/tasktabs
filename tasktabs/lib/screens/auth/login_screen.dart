
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
