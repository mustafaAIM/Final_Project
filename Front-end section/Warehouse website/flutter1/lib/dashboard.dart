import 'dart:math';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter1/chart.dart';
import 'package:flutter1/chart2.dart';
import 'package:flutter1/main.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class dashboard extends StatefulWidget {
  const dashboard({super.key});

  @override
  State<dashboard> createState() => _dashboardState();
}

List<charts.Series<TimeSeriesSales, DateTime>> _createData(Map data) {
  final List<TimeSeriesSales> chart = [];
  data.forEach((key, value) {
    List<String> dateParts = key.split('-');
    int year = int.parse(dateParts[0]);
    int month = int.parse(dateParts[1]);
    int day = int.parse(dateParts[2]);
    DateTime date = new DateTime(year, month, day);
    chart.add(new TimeSeriesSales(date, value));
  });

  return [
    new charts.Series<TimeSeriesSales, DateTime>(
      id: 'Sales',
      colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
      domainFn: (TimeSeriesSales sales, _) => sales.time,
      measureFn: (TimeSeriesSales sales, _) => sales.sales,
      data: chart,
    )
  ];
}

List<Color> colors = [
  Colors.purple,
  Colors.red,
  Colors.blue,
  Colors.green,
  Colors.yellow,
  Colors.orange
];

List<PieChartSectionData> piechart(Map data) {
  return data.entries.map((entry) {
    int index = data.keys.toList().indexOf(entry.key);
    return PieChartSectionData(
      titleStyle: TextStyle(
          fontSize: 20, fontWeight: FontWeight.w400, color: Colors.white),
      value: entry.value.toDouble(),
      title: entry.key,
      showTitle: true,
      radius: 150,
      color: colors[index % colors.length],
      // You can change the color based on your needs
    );
  }).toList();
}

class _dashboardState extends State<dashboard> {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, dynamic>(
      converter: (store) => store.state.data,
      builder: (context, data) {
        if (data == const {}) {
          return SpinKitWave(
            color: Colors.blue,
            size: 50.0,
          );
        } else {
          return Column(children: [
            Row(children: [
              infoCard(
                  title: "Orders count",
                  value: data["orderCount"].toString(),
                  topColor: Colors.red,
                  isActive: true,
                  onTap: () {}),
              infoCard(
                  title: "Buyers count",
                  value: data["uniqueUserIdsCount"].toString(),
                  topColor: Colors.green,
                  isActive: true,
                  onTap: () {}),
              infoCard(
                  title: "Top buyer",
                  value: data["mostRepeatedUsername"] == ""
                      ? "No buyers"
                      : data["mostRepeatedUsername"],
                  topColor: Colors.blue,
                  isActive: true,
                  onTap: () {}),
              infoCard(
                  title: "Total sales",
                  value: data["totalOfAllTotals"].toString(),
                  topColor: Colors.orange,
                  isActive: true,
                  onTap: () {}),
            ]),
            SizedBox(
              height: 60,
            ),
            Expanded(
                child: Row(children: [
              Expanded(
                  child: Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                          offset: Offset(0, 6),
                          color: Colors.grey,
                          blurRadius: 12)
                    ],
                    borderRadius: BorderRadius.circular(8)),
                child: Column(
                  children: [
                    Text("Sales:",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w600)),
                    Expanded(
                        child: SimpleTimeSeriesChart(
                      _createData(data["dailyOrderTotals"]),
                      animate: true,
                    )),
                  ],
                ),
              )),
              Container(
                width: 400,
                margin: EdgeInsets.symmetric(horizontal: 20),
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                          offset: Offset(0, 6),
                          color: Colors.grey,
                          blurRadius: 12)
                    ],
                    borderRadius: BorderRadius.circular(8)),
                child: Column(
                  children: [
                    Text("Products Sales Percentages:",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w600)),
                    Expanded(
                        child: PieChart(
                      PieChartData(
                        centerSpaceRadius: 0,
                        sections: piechart(data['medicinePercentages']),
                      ),
                    )),
                  ],
                ),
              )
            ])),
          ]);
        }
      },
      onInit: (store) async {
        String? token = await getToken();
        await store.dispatch(FetchDataAction(
            token: token, url: "http://127.0.0.1:8000/api/report"));
      },
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

class SimpleTimeSeriesChart extends StatelessWidget {
  final List<charts.Series<TimeSeriesSales, DateTime>> seriesList;
  final bool animate;

  SimpleTimeSeriesChart(this.seriesList, {required this.animate});

  /// Creates a [TimeSeriesChart] with sample data and no transition.
  factory SimpleTimeSeriesChart.withSampleData() {
    return new SimpleTimeSeriesChart(
      _createSampleData(),
      // Disable animations for image tests.
      animate: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    return charts.TimeSeriesChart(
      seriesList,
      animate: animate,
      // Optionally pass in a [DateTimeFactory] used by the chart. The factory
      // should create the same type of [DateTime] as the data provided. If none
      // specified, the default creates local date time.
      dateTimeFactory: const charts.LocalDateTimeFactory(),
    );
  }

  /// Create one series with sample hard coded data.
  static List<charts.Series<TimeSeriesSales, DateTime>> _createSampleData() {
    final data = [
      new TimeSeriesSales(new DateTime(2017, 9, 19), 5),
      new TimeSeriesSales(new DateTime(2017, 9, 26), 25),
      new TimeSeriesSales(new DateTime(2017, 10, 3), 100),
      new TimeSeriesSales(new DateTime(2017, 10, 10), 75),
    ];

    return [
      new charts.Series<TimeSeriesSales, DateTime>(
        id: 'Sales',
        colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
        domainFn: (TimeSeriesSales sales, _) => sales.time,
        measureFn: (TimeSeriesSales sales, _) => sales.sales,
        data: data,
      )
    ];
  }
}

/// Sample time series data type.
class TimeSeriesSales {
  final DateTime time;
  final int sales;

  TimeSeriesSales(this.time, this.sales);
}
