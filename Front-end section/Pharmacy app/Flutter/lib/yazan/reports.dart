import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter1/main.dart';
import 'package:flutter_locales/flutter_locales.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:flutter1/Mootaz/bottomNav.dart';
import 'package:http/http.dart';

class reportsPage extends StatefulWidget {
  const reportsPage({
    super.key,
  });

  @override
  State<reportsPage> createState() => _reportsPageState();
}

class _reportsPageState extends State<reportsPage> {
  bool requested = false;
  bool firstpage = true;
  DateTime firstDate = DateTime.now();
  DateTime secondDate = DateTime.now();

  Future<void> _selectFirstDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: firstDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != firstDate) {
      setState(() {
        firstDate = picked;
      });
    }
  }

  List orders = [
    {
      'id': 123,
      'status': "Delivered",
      'Creation date': "Jan 19 2022",
      'delivery date': "Jan 23, 2020"
    },
    {
      'id': 123,
      'status': "Received",
      'Creation date': "Jan 19 2022",
      'delivery date': "Jan 23, 2020"
    },
    {
      'id': 123,
      'status': "Being prepared",
      'Creation date': "Jan 19 2022",
      'delivery date': "Jan 23, 2020"
    },
    {
      'id': 123,
      'status': "Being prepared",
      'Creation date': "Jan 19 2022",
      'delivery date': "Jan 23, 2020"
    },
    {
      'id': 123,
      'status': "Being prepared",
      'Creation date': "Jan 19 2022",
      'delivery date': "Jan 23, 2020"
    },
    {
      'id': 123,
      'status': "Being prepared",
      'Creation date': "Jan 19 2022",
      'delivery date': "Jan 23, 2020"
    },
  ];
  Map<String, Color> colorMap = {
    'Delivered': Colors.purple,
    'Received': Colors.green,
    'Being prepared': Colors.grey,
    // Add more colors as needed
  };
  List productDetails = [
    [
      {'name': 'panadol', 'amount': 20, 'price': 23},
      {'name': 'panadol', 'amount': 20, 'price': 23},
      {'name': 'panadol', 'amount': 20, 'price': 23},
      {'name': 'panadol', 'amount': 20, 'price': 23},
    ],
    2400
  ];

  Future<void> _selectSecondDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: firstDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != firstDate) {
      setState(() {
        secondDate = picked;
      });
    }
  }
   void getData() async {
    String? token = await getToken();
    Response response = await get(
      Uri.parse('http://127.0.0.1:8000/api/report/${firstDate}/${secondDate}'),
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer ${token}"
      },
    );
    print(response.body);
    if (response.statusCode == 200) {
      List data = jsonDecode(response.body);
      setState(() {
        loading = false;
        print(data);
      });
      
    }
  }
bool loading = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: !requested
          ? Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.only(top: 20),
                  padding: EdgeInsets.all(12),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                            offset: Offset(0, 6),
                            color: Colors.grey,
                            blurRadius: 12)
                      ]),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        children: [
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              ElevatedButton(
                                onPressed: () => _selectFirstDate(context),
                                child: const Text('First date'),
                              ),
                              const SizedBox(
                                height: 20.0,
                              ),
                              Text("${firstDate.toLocal()}".split(' ')[0]),
                            ],
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              ElevatedButton(
                                onPressed: () => _selectSecondDate(context),
                                child: const Text('Second date'),
                              ),
                              const SizedBox(
                                height: 20.0,
                              ),
                              Text("${secondDate.toLocal()}".split(' ')[0]),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 30),
                      ElevatedButton(
                          onPressed: () {
                            setState(() {
                              requested = true;
                              getData();
                            });
                          },
                          style: ButtonStyle(),
                          child: Text('Request report'))
                    ],
                  ),
                ),
              ],
            )
          : SingleChildScrollView(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ElevatedButton(
                        onPressed: () {
                          setState(() {
                            firstpage = !firstpage;
                          });
                        },
                        child: firstpage
                            ? Text("Next page")
                            : Text("Previous page")),
                    firstpage
                        ? Container(
                            padding: EdgeInsets.all(15),
                            child: GridView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 1,
                                crossAxisSpacing: 2,
                                childAspectRatio: 1.8,
                              ),
                              padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                              itemCount: orders.length,
                              itemBuilder: (context, index) {
                                return Container(
                                  padding: EdgeInsets.all(20),
                                  margin: EdgeInsets.only(bottom: 20),
                                  height: 150,
                                  width: 150,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(
                                        10), // gives the rounded corner
                                    border: Border.all(
                                      color: Colors.black,
                                      width: 1,
                                    ),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey
                                            .withOpacity(0.5), //color of shadow
                                        spreadRadius: 5, //spread radius
                                        blurRadius: 7, // blur radius
                                        offset: Offset(
                                            0, 3), // changes position of shadow
                                      ),
                                    ],
                                  ),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(children: [
                                            orders[index]["status"] ==
                                                    "Delivered"
                                                ? Icon(
                                                    Icons
                                                        .local_shipping_outlined,
                                                    size: 30,
                                                    color: colorMap[
                                                        orders[index]
                                                            ["status"]],
                                                  )
                                                : orders[index]["status"] ==
                                                        "Received"
                                                    ? Icon(
                                                        Icons
                                                            .local_shipping_outlined,
                                                        size: 30,
                                                        color: colorMap[
                                                            orders[index]
                                                                ["status"]],
                                                      )
                                                    : orders[index]["status"] ==
                                                            "Being prepared"
                                                        ? Icon(
                                                            Icons
                                                                .medical_information_outlined,
                                                            size: 30,
                                                            color: colorMap[
                                                                orders[index]
                                                                    ["status"]],
                                                          )
                                                        : const Icon(
                                                            Icons.report,
                                                            size: 30,
                                                            color: Colors.red,
                                                          ),
                                            SizedBox(
                                              width: 20,
                                            ),
                                            Column(
                                              children: [
                                                Text(
                                                  orders[index]["status"],
                                                  style: TextStyle(
                                                      color: colorMap[
                                                          orders[index]
                                                              ["status"]],
                                                      fontWeight:
                                                          FontWeight.w600),
                                                ),
                                                Text(orders[index]
                                                    ["Creation date"]),
                                              ],
                                            ),
                                          ]),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            children: [
                                              Icon(
                                                Icons.receipt_outlined,
                                              ),
                                              SizedBox(
                                                width: 10,
                                              ),
                                              Column(
                                                children: [
                                                  Text(
                                                    "Order",
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w600),
                                                  ),
                                                  Text(
                                                      "#${orders[index]['id']}")
                                                ],
                                              )
                                            ],
                                          ),
                                          Row(children: [
                                            Icon(Icons.calendar_month),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            Column(
                                              children: [
                                                orders[index]["status"] ==
                                                        "Delivered"
                                                    ? Text("Delivered date",
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight
                                                                    .w600))
                                                    : Text("Expected delivery",
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight
                                                                    .w600)),
                                                Text(
                                                    "${orders[index]["delivery date"]}")
                                              ],
                                            )
                                          ])
                                        ],
                                      )
                                    ],
                                  ),
                                );
                              },
                            ),
                          )
                        : Container(
                            child: Padding(
                              padding: const EdgeInsets.all(20),
                              child: Column(children: [
                                Container(
                                  child: ListView.builder(
                                      shrinkWrap: true,
                                      itemCount: productDetails[0].length,
                                      itemBuilder: (context, index) {
                                        return Container(
                                          padding:
                                              EdgeInsets.fromLTRB(10, 0, 20, 0),
                                          margin: EdgeInsets.only(bottom: 15),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                "${productDetails[0][index]['amount']} x ${productDetails[0][index]['name']}",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 15),
                                              ),
                                              Text(
                                                "${productDetails[0][index]['price']}\$",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 15),
                                              )
                                            ],
                                          ),
                                        );
                                      }),
                                ),
                                Divider(
                                  color: Colors.black,
                                  height: 50,
                                  thickness: 2,
                                  indent: 10,
                                  endIndent: 20,
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      LocaleText(
                                        'total',
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w600),
                                      ),
                                      Text(
                                        '${productDetails[1]}\$',
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w600,
                                            color: Colors.orange),
                                      )
                                    ],
                                  ),
                                )
                              ]),
                            ),
                          )
                  ]),
            ),
    ));
  }
}
