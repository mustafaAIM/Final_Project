import 'package:flutter/material.dart';

class ordersPage extends StatefulWidget {
  const ordersPage({super.key});

  @override
  State<ordersPage> createState() => _ordersPageState();
}

class _ordersPageState extends State<ordersPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text("hello Orders"),
    );
  }
}