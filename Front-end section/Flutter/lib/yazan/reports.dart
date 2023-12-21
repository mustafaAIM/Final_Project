import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:flutter1/Mootaz/bottomNav.dart';
class reportsPage extends StatefulWidget {
  const reportsPage({
    super.key,
  });

  @override
  State<reportsPage> createState() => _reportsPageState();
}

class _reportsPageState extends State<reportsPage> {

  int selectedIndex = 0;
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text("reports"),
    );
  }
}