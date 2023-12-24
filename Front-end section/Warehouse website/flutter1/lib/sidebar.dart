// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter1/main.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

class sidebar extends StatefulWidget {
  const sidebar({super.key});

  @override
  State<sidebar> createState() => _sidebarState();
}

class _sidebarState extends State<sidebar> {

  @override
  Widget build(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width * 15 / 100,
        child: Column(children: [
          Image.asset(
            "images/logo.png",
            height: 150,
            width: 150,
          ),
          ListView(shrinkWrap: true, 
          scrollDirection: Axis.vertical,
          children: [
            InkWell(
              onTap: () {
                StoreProvider.of<AppState>(context).dispatch(NavClickAction(0));
              },
              child: ListTile(
                  leading: Icon(Icons.home,color: Colors.white,),
                  title: Text(
                    "Dashboard",
                    style: TextStyle(fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.normal,
                    inherit: false),
                  )),
            ),
            InkWell(
              onTap: () {
               StoreProvider.of<AppState>(context).dispatch(NavClickAction(1));
              
              },
              child: ListTile(
                  leading: Icon(Icons.shop,color: Colors.white,),
                  title: Text(
                    "Products",
                    style: TextStyle(fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.normal,
                    inherit: false),
                  )),
            ),
            InkWell(
              onTap: () {
                StoreProvider.of<AppState>(context).dispatch(NavClickAction(2));
              
              },
              child: ListTile(
                  leading: Icon(Icons.money,color: Colors.white,),
                  title: Text(
                    "Orders",
                    style: TextStyle(fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.normal,
                    inherit: false),
                  )),
            ),
            InkWell(
              onTap: () {
               StoreProvider.of<AppState>(context).dispatch(NavClickAction(3));
              
              },
              child: ListTile(
                  leading: Icon(Icons.report,color: Colors.white,),
                  title: Text(
                    "Reports",
                    style: TextStyle(fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.normal,
                    inherit: false),
                  )),
            ),
            InkWell(
              onTap: () {
               StoreProvider.of<AppState>(context).dispatch(NavClickAction(4));
              
              },
              child: ListTile(
                  leading: Icon(Icons.person,color: Colors.white,),
                  title: Text(
                    "Profile",
                    style: TextStyle(fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.normal,
                    inherit: false),
                  )),
            ),
              ],
            ),
           Container(
            height: MediaQuery.of(context).size.height/2.7,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text("Copyrights - AIO",style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.orange
                ),)
            ]),
           ) 
          ]
          ),
        );
  }
}
