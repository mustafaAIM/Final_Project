import 'dart:html';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';



class chart extends StatelessWidget {
  const chart({super.key});

  @override
  Widget build(BuildContext context) {
    return PieChart(
      
      PieChartData(
        
        centerSpaceRadius: 0,
        sections: [
          PieChartSectionData(
            titleStyle: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w400,
              color: Colors.white
            ),
            value: 40,
            title: 'test',
            showTitle: true,
            radius: 150,
            color: Colors.purple,
          ),
          PieChartSectionData(
            titleStyle: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w400,
              color: Colors.white
            ),
            value: 80,
            title: 'test',
            showTitle: true,
            radius: 150,
            color: Colors.red,
          ),
          PieChartSectionData(
            titleStyle: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w400,
              color: Colors.white
            ),
            value: 30,
            title: 'test',
            showTitle: true,
            radius: 150,
            color: Colors.blue,
          ),
          PieChartSectionData(
            titleStyle: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w400,
              color: Colors.white
            ),
            value: 10,
            title: 'test',
            showTitle: true,
            radius: 150,
            color: Colors.green,
          ),
        ]
      ),

      swapAnimationDuration: Duration(milliseconds: 500), // Optional
    swapAnimationCurve: Curves.linear
    );
  }
}