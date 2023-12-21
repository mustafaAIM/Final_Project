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
    return Scaffold(
      bottomNavigationBar: GNav(
        selectedIndex: 3,
            backgroundColor: Colors.blue,
            color: Colors.black,
            activeColor: Colors.white,
            tabBackgroundColor: Colors.grey.shade500,
            gap: 8,
            padding: EdgeInsets.all(16),
            onTabChange: (index) {
              
              if (index == 0) Navigator.pushReplacementNamed(context, "/homePage");
              if (index == 1) Navigator.pushReplacementNamed(context, "/cartPage");
              if (index == 2) Navigator.pushReplacementNamed(context, "/orderPage");
              if (index == 3) Navigator.pushReplacementNamed(context, "/reportsPage");
            },
            tabs: const [
              GButton(icon: Icons.home_outlined,text: 'Home',),
              GButton(icon: Icons.shopping_cart_outlined,text: 'Cart',),
              GButton(icon: Icons.receipt_long_sharp,text: 'Orders',),
              GButton(icon: Icons.space_dashboard_outlined,text: 'Reports',)
            ]),
    );
  }
}