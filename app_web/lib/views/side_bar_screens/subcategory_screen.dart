import 'package:flutter/material.dart';

class SubcategoryScreen extends StatefulWidget {
  static const String id = "subCategoryScreen";

  const SubcategoryScreen({super.key});

  @override
  State<SubcategoryScreen> createState() => _SubcategoryScreenState();
}

class _SubcategoryScreenState extends State<SubcategoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(4.0),
          child: Container(
            alignment: Alignment.topRight,
            child: Center(
              child: Text(
                'فعالیت ها',
                style: TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(4.0),
          child: Divider(
            color: Colors.grey.shade400,
          ),
        ),
      ],
    );
  }
}
