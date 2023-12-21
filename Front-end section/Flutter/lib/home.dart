import 'package:flutter/material.dart';
import 'package:flutter1/yazan/profile.dart';
import 'package:flutter1/yazan/orders.dart';
import 'package:flutter1/Mootaz/HomePage.dart';
import 'package:flutter1/Mootaz/cartPage.dart';
import 'package:flutter1/Mootaz/categoryPage.dart';
import 'package:flutter1/Mootaz/itemInfoPage.dart';
import 'package:flutter1/Mootaz/warehousePage.dart';
import 'package:flutter1/yazan/orders.dart';
import 'package:flutter1/yazan/reports.dart';
import 'package:flutter1/mootaz/bottomNav.dart';


class home extends StatefulWidget {
  const home({super.key});

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
    static const List<Widget> _widgetOptions = <Widget>[
    HomePage(),
    CartPage(),
    OrderPage(),
    ReportsPage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ,
      bottomNavigationBar: bottomNav(),
    );
  }
}