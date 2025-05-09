import 'package:flutter/material.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'ثبت درخواست',
          style: TextStyle(fontSize: 50),
        ),
      ),
    );
  }
}
