import 'package:flutter/material.dart';
import 'package:flutter1/Mootaz/cartPage.dart';
import 'package:flutter1/main.dart';
import 'package:flutter1/mootaz/warehousePage.dart';
import 'package:flutter1/yazan/orders.dart';
import 'package:flutter1/yazan/reports.dart';
import 'package:flutter1/mootaz/bottomNav.dart';
import 'package:flutter_redux/flutter_redux.dart';

class home extends StatefulWidget {
  const home({super.key});

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  List pages = [warehousePage(), cartPage(), OrdersPage(), reportsPage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: StoreConnector<AppState, AppState>(
            converter: (store) => store.state,
            builder: (_, state) {
              return pages[state.currentIndex];
            }),
        bottomNavigationBar: bottomNav());
  }
}
