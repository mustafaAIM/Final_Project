import 'package:flutter/material.dart';

class SPV extends StatefulWidget {
  const SPV({super.key});

  @override
  State<SPV> createState() => _SPVState();
}

class _SPVState extends State<SPV> {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width*85/100,
        color: const Color.fromARGB(255, 227, 222, 222),
        
      ),
    );
  }
}