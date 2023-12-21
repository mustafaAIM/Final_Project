import 'package:flutter/material.dart';
import 'package:flutter1/Mootaz/cartPage.dart';
import 'package:flutter1/Mootaz/homePage.dart';
import 'package:flutter1/yazan/orderDetailsPage.dart';
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
    reportsPage(),
    cartPage(),
    orderDetailsPage()
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
            color: Colors.black,
            activeColor: Colors.white,
            tabBackgroundColor: Colors.grey.shade500,
            gap: 8,
            padding: EdgeInsets.all(16),
            tabs: const [
              GButton(icon: Icons.home_outlined,text: 'Home',),
              GButton(icon: Icons.shopping_cart_outlined,text: 'Cart',),
              GButton(icon: Icons.receipt_long_sharp,text: 'Orders',),
              GButton(icon: Icons.space_dashboard_outlined,text: 'Reports',)
            ]),
    );
  }
}