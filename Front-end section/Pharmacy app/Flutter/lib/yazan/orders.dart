import 'package:flutter/material.dart';
import 'package:flutter1/mootaz/bottomNav.dart';

class OrdersPage extends StatefulWidget {
  const OrdersPage({super.key});

  @override
  State<OrdersPage> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<OrdersPage> {
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
  ];
  Map<String, Color> colorMap = {
    'Delivered': Colors.purple,
    'Received': Colors.green,
    'Being prepared': Colors.grey,
    // Add more colors as needed
  };

  List productdetails = [
    {
      "id": 123,
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
  @override
  Widget build(BuildContext context) {
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
                                            Icons.medical_information_outlined,
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
                                      color: colorMap[orders[index]["status"]],
                                      fontWeight: FontWeight.w600),
                                ),
                                Text(orders[index]["Creation date"]),
                              ],
                            ),
                          ]),
                          IconButton(
                            icon: Icon(Icons.arrow_forward),
                            onPressed: () => {
                              Navigator.pushNamed(context, '/orderDetails',
                                  arguments: productdetails)
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
                                  Text(
                                    "Order",
                                    style:
                                        TextStyle(fontWeight: FontWeight.w600),
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
                                    ? Text("Delivered date",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w600))
                                    : Text("Expected delivery",
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
              child: Text('No orders to display'),
            ),
    );
  }
}
