import 'package:flutter/material.dart';
import 'package:flutter1/Mootaz/bottomNav.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class cartPage extends StatefulWidget {
  const cartPage({
    super.key,
  });

  @override
  State<cartPage> createState() => _cartPageState();
}

class _cartPageState extends State<cartPage> {

  int selectedIndex = 0;
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       bottomNavigationBar: bottomNav(),
      body: Text("cart"),
    );
  }
}