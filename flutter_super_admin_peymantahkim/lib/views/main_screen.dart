import 'package:flutter_super_admin_peymantahkim/views/side_bar_screens/buyers_screen.dart';
import 'package:flutter_super_admin_peymantahkim/views/side_bar_screens/category_screen.dart';
import 'package:flutter_super_admin_peymantahkim/views/side_bar_screens/orders_screen.dart';
import 'package:flutter_super_admin_peymantahkim/views/side_bar_screens/products_screen.dart';
import 'package:flutter_super_admin_peymantahkim/views/side_bar_screens/subcategory_screen.dart';
import 'package:flutter_super_admin_peymantahkim/views/side_bar_screens/upload_banner_screen.dart';
import 'package:flutter_super_admin_peymantahkim/views/side_bar_screens/vendors_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_admin_scaffold/admin_scaffold.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  Widget _selectedScreen = VendorsScreen();
  screenSelector(item) {
    switch (item.route) {
      case BuyersScreen.id:
        setState(() {
          _selectedScreen = BuyersScreen();
        });
        break;
      case VendorsScreen.id:
        setState(() {
          _selectedScreen = VendorsScreen();
        });
        break;
      case CategoryScreen.id:
        setState(() {
          _selectedScreen = CategoryScreen();
        });
        break;
      case SubcategoryScreen.id:
        setState(() {
          _selectedScreen = SubcategoryScreen();
        });
        break;
      case OrdersScreen.id:
        setState(() {
          _selectedScreen = OrdersScreen();
        });
        break;
      case ProductsScreen.id:
        setState(() {
          _selectedScreen = ProductsScreen();
        });
        break;
      case UploadBannerScreen.id:
        setState(() {
          _selectedScreen = UploadBannerScreen();
        });
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: AdminScaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue.shade900,
          title: Text(
            'پنل ادمین پیمان تحکیم خوزستان',
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
          foregroundColor: Colors.blueGrey.shade100,
        ),
        body: _selectedScreen,
        sideBar: SideBar(
          header: Container(
            height: 60,
            width: double.infinity,
            decoration: BoxDecoration(color: Colors.black),
            child: Center(
              child: Row(
                children: [
                  Image.asset('./assets/logo_light.png'),
                  Text(
                    'شرکت پیمان تحکیم خوزستان',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
          items: [
            AdminMenuItem(
              title: 'پرسنل ها',
              route: VendorsScreen.id,
              icon: CupertinoIcons.person_3,
            ),
            AdminMenuItem(
              title: 'خریدار ها',
              route: BuyersScreen.id,
              icon: CupertinoIcons.person,
            ),
            AdminMenuItem(
              title: 'درخواست ها',
              route: OrdersScreen.id,
              icon: CupertinoIcons.shopping_cart,
            ),
            AdminMenuItem(
              title: 'مجموعه ها',
              route: CategoryScreen.id,
              icon: Icons.category,
            ),
            AdminMenuItem(
              title: 'فعالیت ها',
              route: SubcategoryScreen.id,
              icon: Icons.category_outlined,
            ),
            AdminMenuItem(
              title: 'عکس بنر ها',
              route: UploadBannerScreen.id,
              icon: CupertinoIcons.bandage,
            ),
            AdminMenuItem(
              title: 'فروشگاه',
              route: ProductsScreen.id,
              icon: Icons.store,
            ),
          ],
          selectedRoute: VendorsScreen.id,
          onSelected: (item) {
            screenSelector(item);
          },
        ),
      ),
    );
  }
}
