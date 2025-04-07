import 'package:app_web/views/side_bar_screens/vendors_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_admin_scaffold/admin_scaffold.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: AdminScaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: Text('مدیریت اپلیکیشن پیمان تحکیم'),
          centerTitle: true,
        ),
        body: Column(
          children: [
            Row(
              children: [
                Text(
                  'داشبورد',
                ),
              ],
            ),
          ],
        ),
        sideBar: SideBar(items: [
          AdminMenuItem(
              title: 'فروشنده ها', route: "", icon: CupertinoIcons.person_3),
          AdminMenuItem(
              title: 'خربدار ها', route: "", icon: CupertinoIcons.person),
          AdminMenuItem(
              title: 'سفارش ها', route: "", icon: CupertinoIcons.shopping_cart),
          AdminMenuItem(title: 'دسته بندی ها', route: "", icon: Icons.category),
          AdminMenuItem(
              title: 'عکس بنر ها', route: "", icon: CupertinoIcons.bandage),
          AdminMenuItem(title: 'محصول ها', route: "", icon: Icons.store),
          AdminMenuItem(
              title: 'درخواست ها', route: "", icon: CupertinoIcons.calendar),
        ], selectedRoute: ''),
      ),
    );
  }
}
