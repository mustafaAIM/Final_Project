import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter1/main.dart';
import 'package:flutter1/mootaz/bottomNav.dart';
import 'package:flutter_locales/flutter_locales.dart';
import 'package:http/http.dart';

class OrdersPage extends StatefulWidget {
  const OrdersPage({super.key});

  @override
  State<OrdersPage> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<OrdersPage> {
  List orders = [
    {
      'id': "123",
      'status': "Delivered",
      'Creation date': "Jan 19 2022",
      'delivery date': "Jan 23, 2020"
    },
    {
      'id': "123",
      'status': "Received",
      'Creation date': "Jan 19 2022",
      'delivery date': "Jan 23, 2020"
    },
    {
      'id': "123",
      'status': "Being prepared",
      'Creation date': "Jan 19 2022",
      'delivery date': "Jan 23, 2020"
    },
    {
      'id': "123",
      'status': "Being prepared",
      'Creation date': "Jan 19 2022",
      'delivery date': "Jan 23, 2020"
    },
    {
      'id': "123",
      'status': "Being prepared",
      'Creation date': "Jan 19 2022",
      'delivery date': "Jan 23, 2020"
    },
    {
      'id': "123",
      'status': "Being prepared",
      'Creation date': "Jan 19 2022",
      'delivery date': "Jan 23, 2020"
    },
    {
      'id': "123",
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

  List productdetails = [
    {
      "id": "123",
      'status': "Received",
      'Creation date': "Jan 19 2022",
      'delivery date': "Jan 23, 2020"
    },
    [
      {'name': 'panadol', 'amount': 20, 'price': 23},
      {'name': 'panadol', 'amount': 20, 'price': 23},
      {'name': 'panadol', 'amount': 20, 'price': 23},
      {'name': 'panadol', 'amount': 20, 'price': 23},
    ],
    2400
  ];
  bool loading = true;
  void getData() async {
    String? token = await getToken();
    print(token);
    Response response = await get(
      Uri.parse('http://127.0.0.1:8000/api/orders-list'),
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer ${token}"
      },
    );
    if (response.statusCode == 200) {
      List res = jsonDecode(response.body);
      List data = res[0].map((order) {
        return {
          'id': order['order_id'],
          'status': order['status'],
          'Creation date': order['created_at'],
          'delivery date': order['estimated_date']
        };
      }).toList();
      print("data ${data}");
      setState(() {
        orders = data;
        loading = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  Future getOrderDetails(index) async {
    String? token = await getToken();
    Response response = await get(
      Uri.parse('http://127.0.0.1:8000/api/order-details/${index }'),
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer ${token}"
      },
    );
    if (response.statusCode == 200) {
      List res = jsonDecode(response.body);
      return res;
    }
    return [];
  }

  @override
  Widget build(BuildContext context) {
    if (loading) {
      return Center(child: CircularProgressIndicator());
    } else {
      return Scaffold(
        body: orders.isNotEmpty
            ? ListView.builder(
                padding: EdgeInsets.fromLTRB(20, 70, 20, 0),
                itemCount: orders.length,
                itemBuilder: (context, index) {
                  return Container(
                    padding: EdgeInsets.all(20),
                    margin: EdgeInsets.only(bottom: 20),
                    height: 150,
                    width: 150,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius:
                          BorderRadius.circular(10), // gives the rounded corner
                      border: Border.all(
                        color: Colors.black,
                        width: 1,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5), //color of shadow
                          spreadRadius: 5, //spread radius
                          blurRadius: 7, // blur radius
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(children: [
                              orders[index]["status"] == "Delivered"
                                  ? Icon(
                                      Icons.local_shipping_outlined,
                                      size: 30,
                                      color: colorMap[orders[index]["status"]],
                                    )
                                  : orders[index]["status"] == "Received"
                                      ? Icon(
                                          Icons.local_shipping_outlined,
                                          size: 30,
                                          color:
                                              colorMap[orders[index]["status"]],
                                        )
                                      : orders[index]["status"] ==
                                              "Being prepared"
                                          ? Icon(
                                              Icons
                                                  .medical_information_outlined,
                                              size: 30,
                                              color: colorMap[orders[index]
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
                                        color:
                                            colorMap[orders[index]["status"]],
                                        fontWeight: FontWeight.w600),
                                  ),
                                  Text(orders[index]["Creation date"]),
                                ],
                              ),
                            ]),
                            IconButton(
                              icon: Icon(Icons.arrow_forward),
                              onPressed: () async {
                                List details = await getOrderDetails(orders[index]['id']);
                                print([
                                  orders[index],
                                  details[0]['medicines'],
                                  details[0]['total_price']
                                ]);
                                  Navigator.pushNamed(context, '/orderDetails',
                                      arguments: [orders[index],details[0]['medicines'],details[0]['total_price']]);
                              },
                            )
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                    LocaleText(
                                      "order",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w600),
                                    ),
                                    Text("#${orders[index]['id']}")
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
                                  orders[index]["status"] == "Delivered"
                                      ? LocaleText("delivered",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w600))
                                      : LocaleText("expected",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w600)),
                                  Text("${orders[index]["delivery date"]}")
                                ],
                              )
                            ])
                          ],
                        )
                      ],
                    ),
                  );
                })
            : const Center(
                child: LocaleText('no'),
              ),
      );
    }
  }
}
