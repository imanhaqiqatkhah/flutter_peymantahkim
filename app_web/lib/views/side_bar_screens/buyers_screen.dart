import 'package:flutter/material.dart';

class BuyersScreen extends StatelessWidget {
  static const String id = '\buyerscreen';
  const BuyersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'خریدار ها',
        style: TextStyle(fontSize: 40),
      ),
    );
  }
}
