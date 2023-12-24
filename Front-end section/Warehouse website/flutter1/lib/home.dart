// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'dart:js_util';

import 'package:flutter/material.dart';
import 'package:flutter1/SPV.dart';
import 'package:flutter1/sidebar.dart';

class home extends StatefulWidget {
  final data;
  const home({super.key, this.data});

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Color.fromARGB(255, 16, 22, 58),
        child: Row(
          children: [
            sidebar(),
            SPV(),
          ],
        ),
      ),
    );
  }
}
