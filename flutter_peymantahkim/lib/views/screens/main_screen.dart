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
          unselectedItemColor: Colors.blueGrey,
          currentIndex: _pageIndex,
          onTap: (value) {
            setState(() {
              _pageIndex = value;
            });
          },
          type: BottomNavigationBarType.fixed,
          showUnselectedLabels: false,
          items: [
            BottomNavigationBarItem(
                icon: Image.asset(
                  './assets/icons/home.png',
                  color: Colors.blueAccent,
                  width: 30,
                ),
                label: 'خانه'),
            BottomNavigationBarItem(
                icon: Image.asset(
                  './assets/icons/love.png',
                  width: 30,
                ),
                label: 'علاقه مندی'),
            BottomNavigationBarItem(
                icon: Image.asset(
                  './assets/icons/mart.png',
                  width: 30,
                ),
                label: 'فروشگاه'),
            BottomNavigationBarItem(
                icon: Image.asset(
                  './assets/icons/cart.png',
                  width: 30,
                ),
                label: 'سبد خرید'),
            BottomNavigationBarItem(
                icon: Image.asset(
                  './assets/icons/user.png',
                  width: 30,
                ),
                label: 'پروفایل'),
          ],
        ),
      ),
      body: _pages[_pageIndex],
    );
  }
}
