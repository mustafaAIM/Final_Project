import 'package:flutter/material.dart';
import 'package:flutter1/Mootaz/cartPage.dart';
import 'package:flutter1/Mootaz/homePage.dart';
import 'package:flutter1/yazan/orders.dart';
import 'package:flutter1/yazan/reports.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class bottomNav extends StatefulWidget {
  const bottomNav({
    super.key,
  });

  @override
  State<bottomNav> createState() => _bottomNavState();
}

class _bottomNavState extends State<bottomNav> {
  List pages = [
    homePage(),
    cartPage(),
    OrdersPage(),
    reportsPage()
  ];
  int currentIndex = 0;
  void onTap(int index){
    setState(() {
      currentIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentIndex],
      bottomNavigationBar: GNav(
        selectedIndex: currentIndex,
        onTabChange: onTap,
            backgroundColor: Colors.blue,
            color: Colors.white,
            activeColor: Colors.black,
            gap: 8,
            padding: EdgeInsets.all(16),
            tabs: const [
              GButton(icon: Icons.home_outlined),
              GButton(icon: Icons.shopping_cart_outlined),
              GButton(icon: Icons.receipt_long_sharp),
              GButton(icon: Icons.space_dashboard_outlined)
            ]),
    );
  }
}
