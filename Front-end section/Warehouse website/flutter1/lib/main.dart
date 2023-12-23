import 'package:flutter/material.dart';
import 'package:flutter1/home.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'hello',
        style: TextStyle(color: Colors.black, fontSize: 30),
      ),
    );
  }
}
