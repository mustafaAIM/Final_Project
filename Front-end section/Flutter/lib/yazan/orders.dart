import 'package:flutter/material.dart';
import 'package:flutter1/Mootaz/bottomNav.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class orderPage extends StatefulWidget {
  const orderPage({
    super.key,
  });

  @override
  State<orderPage> createState() => _orderPageState();
}

class _orderPageState extends State<orderPage> {

  int selectedIndex = 0;
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: bottomNav(),
      body: Text("orderDetails"),
    );
  }
}