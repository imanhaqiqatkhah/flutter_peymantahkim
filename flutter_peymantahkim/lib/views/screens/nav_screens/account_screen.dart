import 'package:flutter/material.dart';
import 'package:flutter_peymantahkim/controllers/auth_controller.dart';

class AccountScreen extends StatelessWidget {
  AccountScreen({super.key});
  final AuthController _authController = AuthController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
            onPressed: () async {
              await _authController.signOutUSer(context: context);
            },
            child: Text(
              'خروج',
              style: TextStyle(fontSize: 20),
            )),
      ),
    );
  }
}
