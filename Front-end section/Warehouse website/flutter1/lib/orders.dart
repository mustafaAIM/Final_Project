import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter1/main.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart';

class ordersPage extends StatefulWidget {
  const ordersPage({super.key});

  @override
  State<ordersPage> createState() => _ordersPageState();
}

class _ordersPageState extends State<ordersPage> {
  bool loading = true;
  List orders = [];
  void initState() {
    super.initState();
    getdata();
  }

  Future<void> getdata() async {
    String? token = await getToken();
    Response response = await get(
      Uri.parse('http://127.0.0.1:8000/api/orders'),
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer ${token}"
      },
    );
    print(response.body);
    List data = jsonDecode(response.body);
    if (response.statusCode == 200) {
      List Fliterddata = [];
      for (var item in data[0]) {
        Fliterddata.add({
          'number': item['id'],
          'pharmacist': item['username'],
          'date': item['created_day'],
          'payed': item['paid'] == 1,
          'state': item['status'],
        });
      }
      setState(() {
        orders = Fliterddata;
        loading = false;
      });
    }
  }

  sendChanges(index) async {
    Map json = {
      "order_id": "${orders[index]["number"]}",
      "status": "${orders[index]["state"]}",
      "paid": orders[index]["payed"]
    };
    print(json);
    String? token = await getToken();
    Response response = await post(
        Uri.parse('http://127.0.0.1:8000/api/change-status'),
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer ${token}"
        },
        body: jsonEncode(json));
    
      
  }

  @override
  Widget build(BuildContext context) {
    if (loading) {
      return SpinKitWave(
            color: Colors.blue,
            size: 50.0,
          );
    } else {
      return Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Order requests:",
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: 35,
            ),
            Expanded(
                child: ListView.builder(
              itemCount: orders.length,
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.symmetric(vertical: 10),
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
                  child: Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            "Number: ${orders[index]['number']}",
                            style: TextStyle(
                                fontSize: 17, fontWeight: FontWeight.w500),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Ordered by: ${orders[index]['pharmacist']}",
                            style: TextStyle(
                                fontSize: 17, fontWeight: FontWeight.w500),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Date: ${orders[index]['date']}",
                            style: TextStyle(
                                fontSize: 17, fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                      Spacer(),
                      Expanded(
                        child: CheckboxListTile(
                          contentPadding: EdgeInsets.symmetric(horizontal: 100),
                          shape: const CircleBorder(),
                          fillColor:
                              MaterialStateProperty.resolveWith((states) {
                            if (orders[index]['payed']) {
                              return Colors.blue;
                            }
                          }),
                          checkboxShape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0)),
                          value: orders[index]['payed'],
                          onChanged: (bool? value) {
                            setState(() {
                              orders[index]['payed'] = value;
                              sendChanges(index);
                            });
                          },
                          title: Text(
                            "Payed",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                      Expanded(
                          child: Theme(
                        data: Theme.of(context).copyWith(
                          canvasColor: Color.fromARGB(255, 16, 22, 58),
                        ),
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          decoration: BoxDecoration(
                              color: Color.fromARGB(255, 16, 22, 58),
                              borderRadius: BorderRadius.circular(10)),
                          child: DropdownButton<String>(
                            iconEnabledColor: Colors.white,
                            value: orders[index]['state'],
                            isExpanded: true,
                            icon: Padding(
                              padding: EdgeInsets.only(right: 10),
                              child: Icon(Icons.arrow_downward),
                            ),
                            iconSize: 24,
                            elevation: 16,
                            style: const TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                                color: Colors.white),
                            underline: Container(),
                            onChanged: (String? newValue) => {
                              setState(() {
                                orders[index]['state'] = newValue!;
                                sendChanges(index);
                              })
                            },
                            items: <String>[
                              'Delivered',
                              'Received',
                              'Being prepared'
                            ].map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                          ),
                        ),
                      )),
                    ],
                  ),
                );
              },
            )),
          ],
        ),
      );
    }
  }
}
