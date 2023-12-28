import 'package:flutter/material.dart';
import 'package:flutter1/Mootaz/bottomNav.dart';
import 'package:flutter1/Mootaz/boxApp.dart';
import 'package:flutter1/Mootaz/postBottomBar.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class itemInfoPage extends StatefulWidget {
  const itemInfoPage({
    super.key,
  });

  @override
  State<itemInfoPage> createState() => _itemInfoPageState();
}

class _itemInfoPageState extends State<itemInfoPage> {

  int selectedIndex = 0;
 
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/product2.jpg"),
            fit: BoxFit.fill,
            opacity: 0.8
          )
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(60),
            child: boxApp(),
          ),
          bottomNavigationBar: postBottomBar(),
        ),
      );
  }
}