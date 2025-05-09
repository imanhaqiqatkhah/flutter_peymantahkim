import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_client_peymantahkim/controllers/subcategory_controller.dart';
import 'package:flutter_client_peymantahkim/models/category_model.dart';
import 'package:flutter_client_peymantahkim/models/subcategory_model.dart';
import 'package:flutter_client_peymantahkim/views/screens/detail/screens/widgets/inner_banner_widget.dart';
import 'package:flutter_client_peymantahkim/views/screens/detail/screens/widgets/inner_category_content_widget.dart';
import 'package:flutter_client_peymantahkim/views/screens/detail/screens/widgets/inner_header_widget.dart';
import 'package:flutter_client_peymantahkim/views/screens/detail/screens/widgets/subcategory_tile_widget.dart';
import 'package:flutter_client_peymantahkim/views/screens/nav_screens/account_screen.dart';
import 'package:flutter_client_peymantahkim/views/screens/nav_screens/cart_screen.dart';
import 'package:flutter_client_peymantahkim/views/screens/nav_screens/category_screen.dart';
import 'package:flutter_client_peymantahkim/views/screens/nav_screens/stores_screen.dart';

class InnerCategoryScreen extends StatefulWidget {
  final Category category;

  const InnerCategoryScreen({super.key, required this.category});
  @override
  State<InnerCategoryScreen> createState() => _InnerCategoryScreenState();
}

class _InnerCategoryScreenState extends State<InnerCategoryScreen> {
  int pageIndex = 0;
  @override
  Widget build(BuildContext context) {
    final List<Widget> pages = [
      InnerCategoryContentWidget(
        category: widget.category,
      ),
      CategoryScreen(),
      StoresScreen(),
      CartScreen(),
      AccountScreen(),
    ];

    return Scaffold(
      bottomNavigationBar: Directionality(
        textDirection: TextDirection.rtl,
        child: BottomNavigationBar(
          selectedItemColor: Colors.blue[800],
          selectedIconTheme: IconThemeData(color: Colors.blue[800]),
          unselectedItemColor: Colors.blueGrey,
          currentIndex: pageIndex,
          onTap: (value) {
            setState(() {
              pageIndex = value;
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
      body: pages[pageIndex],
    );
  }
}
