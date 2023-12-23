import 'package:flutter/material.dart';
import 'package:flutter1/CreateProducts.dart';
import 'package:flutter1/Dashboard.dart';
import 'package:flutter1/Profile.dart';
import 'package:flutter1/main.dart';
import 'package:flutter1/orders.dart';
import 'package:flutter1/reports.dart';
import 'package:flutter1/searchProduct.dart';
import 'package:flutter1/showProduct.dart';
import 'package:flutter_redux/flutter_redux.dart';

class SPV extends StatefulWidget {
  const SPV({super.key});

  @override
  State<SPV> createState() => _SPVState();
}

class _SPVState extends State<SPV> {
  List pages = [
    dashboardPage(),
    searchProductPage(),
    ordersPage(),
    reportsPage(),
    profilePage(),
    createProductPage(),
    showProductPage()
  ];

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width * 85 / 100,
          color: const Color.fromARGB(255, 227, 222, 222),
          child: StoreConnector<AppState, AppState>(
              converter: (store) => store.state,
              builder: (_, state) {
                return pages[state.currentIndex];
              }),
        ));
  }
}
