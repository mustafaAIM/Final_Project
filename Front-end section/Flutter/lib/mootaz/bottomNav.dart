import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class bottomNav extends StatefulWidget {
  const bottomNav({
    super.key,
  });

  @override
  State<bottomNav> createState() => _bottomNavState();
}

class _bottomNavState extends State<bottomNav> {

  @override
  Widget build(BuildContext context) {
    return GNav(
      backgroundColor: Colors.blue,
      color: Colors.white,
      activeColor: Colors.black,
      padding: EdgeInsets.all(16),
      onTabChange: (index) {
      
      },
      tabs: [
        GButton(
          icon: Icons.home,
        ),
        GButton(
          icon: Icons.shopping_cart_outlined,
        ),
        GButton(
          icon: Icons.receipt_long_sharp,
        ),
        GButton(
          icon: Icons.space_dashboard_outlined,
        ),
      ],
    );
  }
}
