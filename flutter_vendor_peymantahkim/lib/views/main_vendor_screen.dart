import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MainVendorScreen extends StatefulWidget {
  const MainVendorScreen({super.key});

  @override
  State<MainVendorScreen> createState() => _MainVendorScreenState();
}

class _MainVendorScreenState extends State<MainVendorScreen> {
  int _pageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
          onTap: (value) {
            setState(() {
              _pageIndex = value;
            });
          },
          currentIndex: _pageIndex,
          type: BottomNavigationBarType.fixed,
          unselectedItemColor: Colors.grey,
          selectedItemColor: const Color.fromARGB(255, 34, 26, 195),
          showUnselectedLabels: false,
          showSelectedLabels: true,
          items: [
            BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.money_dollar), label: 'دلار'),
            BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.upload_circle), label: 'آپلود'),
            BottomNavigationBarItem(icon: Icon(Icons.edit), label: 'ویرایش'),
            BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.shopping_cart), label: 'سفارش ها'),
            BottomNavigationBarItem(icon: Icon(Icons.logout), label: 'خروج'),
          ]),
    );
  }
}
