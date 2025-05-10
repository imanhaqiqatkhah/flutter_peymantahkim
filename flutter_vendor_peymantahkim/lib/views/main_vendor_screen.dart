import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vendor_peymantahkim/views/screens/nav_screens/earnings_screen.dart';
import 'package:flutter_vendor_peymantahkim/views/screens/nav_screens/edit_screen.dart';
import 'package:flutter_vendor_peymantahkim/views/screens/nav_screens/orders_screen.dart';
import 'package:flutter_vendor_peymantahkim/views/screens/nav_screens/upload_screen.dart';
import 'package:flutter_vendor_peymantahkim/views/screens/nav_screens/vendor_profile_screen.dart';

class MainVendorScreen extends StatefulWidget {
  const MainVendorScreen({super.key});

  @override
  State<MainVendorScreen> createState() => _MainVendorScreenState();
}

class _MainVendorScreenState extends State<MainVendorScreen> {
  int _pageIndex = 0;

  List<Widget> _pages = [
    EarningsScreen(),
    UploadScreen(),
    EditScreen(),
    OrdersScreen(),
    VendorProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Directionality(
        textDirection: TextDirection.rtl,
        child: BottomNavigationBar(
          onTap: (value) {
            setState(() {
              _pageIndex = value;
            });
          },
          currentIndex: _pageIndex,
          type: BottomNavigationBarType.fixed,
          unselectedItemColor: Colors.grey,
          selectedItemColor: const Color.fromARGB(255, 34, 26, 195),
          showUnselectedLabels: true,
          showSelectedLabels: true,
          items: [
            BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.money_dollar), label: 'داشبورد'),
            BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.upload_circle), label: 'آپلود'),
            BottomNavigationBarItem(icon: Icon(Icons.edit), label: 'ویرایش'),
            BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.shopping_cart), label: 'درخواست ها'),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'پروفایل'),
          ],
        ),
      ),
      body: _pages[_pageIndex],
    );
  }
}
