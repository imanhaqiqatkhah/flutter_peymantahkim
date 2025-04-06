import 'package:flutter/material.dart';

class StoresScreen extends StatelessWidget {
  const StoresScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'فروشگاه',
          style: TextStyle(fontSize: 50),
        ),
      ),
    );
  }
}
