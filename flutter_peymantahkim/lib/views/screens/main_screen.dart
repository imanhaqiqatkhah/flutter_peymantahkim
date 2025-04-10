import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_peymantahkim/views/screens/nav_screens/account_screen.dart';
import 'package:flutter_peymantahkim/views/screens/nav_screens/cart_screen.dart';
import 'package:flutter_peymantahkim/views/screens/nav_screens/favorite_screen.dart';
import 'package:flutter_peymantahkim/views/screens/nav_screens/home_screen.dart';
import 'package:flutter_peymantahkim/views/screens/nav_screens/stores_screen.dart';

class MainScreen extends StatefulWidget {
  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _pageIndex = 0;
  final List<Widget> _pages = [
    HomeScreen(),
    FavoriteScreen(),
    StoresScreen(),
    CartScreen(),
    AccountScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Directionality(
        textDirection: TextDirection.rtl,
        child: BottomNavigationBar(
          selectedItemColor: Colors.blue[800],
          selectedIconTheme: IconThemeData(color: Colors.blue[800]),
          unselectedItemColor: Colors.blueGrey,
          currentIndex: _pageIndex,
          onTap: (value) {
            setState(() {
              _pageIndex = value;
            });
          },
          type: BottomNavigationBarType.fixed,
          showUnselectedLabels: false,
          iconSize: 27,
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.home_outlined), label: 'خانه'),
            BottomNavigationBarItem(
                icon: Icon(Icons.category_outlined), label: 'حوزه فعالیت'),
            BottomNavigationBarItem(
                icon: Icon(Icons.shopping_bag_outlined), label: 'فروشگاه'),
            BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.plus_bubble), label: 'ثبت درخواست'),
            BottomNavigationBarItem(
                icon: Icon(Icons.account_circle_outlined), label: 'پروفایل'),
          ],
        ),
      ),
      body: _pages[_pageIndex],
    );
  }
}
