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
          title: Text('مدیریت اپلیکیشن شرکت پیمان تحکیم خوزستان'),
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
              title: 'درخواست ها', route: "", icon: CupertinoIcons.calendar),
          AdminMenuItem(
              title: 'عکس بنر ها', route: "", icon: CupertinoIcons.bandage),
        ], selectedRoute: ''),
      ),
    );
  }
}
