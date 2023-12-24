import 'package:flutter/material.dart';
import 'package:flutter1/chart.dart';

class dashboard extends StatefulWidget {
  const dashboard({super.key});

  @override
  State<dashboard> createState() => _dashboardState();
}

class _dashboardState extends State<dashboard> {
  @override
  Widget build(BuildContext context) {
    return Column(
      
      mainAxisAlignment: MainAxisAlignment.end,
      children:[           
           Row(
            
            children: [
        infoCard(
            title: "test",
            value: "20",
            topColor: Colors.red,
            isActive: true,
            onTap: () {}),
        infoCard(
            title: "test",
            value: "20",
            topColor: Colors.green,
            isActive: true,
            onTap: () {}),
        infoCard(
            title: "test",
            value: "20",
            topColor: Colors.blue,
            isActive: true,
            onTap: () {}),
        infoCard(
            title: "test",
            value: "3",
            topColor: Colors.orange,
            isActive: true,
            onTap: () {}),
      ]
      ),
      SizedBox(height: 100,),
      Expanded(child: SimpleTimeSeriesChart.withSampleData()),
      ],
    );
  }
}

class infoCard extends StatelessWidget {
  final String title;
  final String value;
  final Color topColor;
  final bool isActive;
  final Function onTap;
  const infoCard(
      {super.key,
      required this.title,
      required this.value,
      required this.topColor,
      required this.isActive,
      required this.onTap});
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: InkWell(
      onTap: onTap(),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 20),
        height: 136,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                  offset: Offset(0, 6), color: Colors.grey, blurRadius: 12)
            ],
            borderRadius: BorderRadius.circular(8)),
        child: Column(children: [
          Row(
            children: [
              Expanded(
                  child: Container(
                color: topColor,
                height: 5,
              ))
            ],
          ),
          Expanded(child: Container()),
          RichText(
              textAlign: TextAlign.center,
              text: TextSpan(children: [
                TextSpan(
                    text: "$title\n",
                    style: TextStyle(fontSize: 16, color: topColor)),
                TextSpan(
                    text: "$value",
                    style: TextStyle(fontSize: 40, color: Colors.black)),
              ])),
          Expanded(child: Container()),
        ]),
      ),
    ));
  }
}
