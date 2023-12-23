// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

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
            ListTile(
                leading: Icon(Icons.home,color: Colors.white,),
                title: Text(
                  "Dashboard",
                  style: TextStyle(fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.normal,
                  inherit: false),
                )),
            ListTile(
                leading: Icon(Icons.home,color: Colors.white,),
                title: Text(
                  "Dashboard",
                  style: TextStyle(fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.normal,
                  inherit: false),
                )),
            ListTile(
                leading: Icon(Icons.home,color: Colors.white,),
                title: Text(
                  "Dashboard",
                  style: TextStyle(fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.normal,
                  inherit: false),
                )),
            ListTile(
                leading: Icon(Icons.home,color: Colors.white,),
                title: Text(
                  "Dashboard",
                  style: TextStyle(fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.normal,
                  inherit: false),
                )),
              ],
            ),
            
          ]),
        );
  }
}
