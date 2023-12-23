import 'package:flutter/material.dart';
import 'package:flutter1/main.dart';
import 'package:flutter_redux/flutter_redux.dart';
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
    return StoreConnector<AppState, AppState>(
        converter: (store) => store.state,
        builder: (_, state) {
          return GNav(
              selectedIndex: state.currentIndex,
              backgroundColor: Colors.blue,
              color: Colors.white,
              activeColor: Colors.black,
              gap: 8,
              padding: EdgeInsets.all(16),
              onTabChange: (value) => {
                StoreProvider.of<AppState>(context).dispatch(NavClickAction(value)),
              },
              tabs: const [
                GButton(icon: Icons.home_outlined),
                GButton(icon: Icons.shopping_cart_outlined),
                GButton(icon: Icons.receipt_long_sharp),
                GButton(icon: Icons.space_dashboard_outlined)
              ]);
        });
  }
}
