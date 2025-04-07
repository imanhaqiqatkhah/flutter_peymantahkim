import 'package:flutter/material.dart';

class CategoryScreen extends StatelessWidget {
  static const String id = "\categoryScreen";
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'فعالیت ها',
        style: TextStyle(fontSize: 40),
      ),
    );
  }
}
