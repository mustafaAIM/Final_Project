import 'package:flutter/material.dart';

class showProductPage extends StatefulWidget {
  const showProductPage({super.key});

  @override
  State<showProductPage> createState() => _showProductPageState();
}

class _showProductPageState extends State<showProductPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text("hello Show"),
    );
  }
}