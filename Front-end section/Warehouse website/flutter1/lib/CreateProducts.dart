import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter1/main.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:http/http.dart';

class createProductPage extends StatefulWidget {
  const createProductPage({
    super.key,
  });

  @override
  State<createProductPage> createState() => _createProductPageState();
}

String Sname = '';
String Tname = '';
String Mname = '';
String Quan = '';
String Price = '';

class _createProductPageState extends State<createProductPage> {
  String? selectedCategory;
  List CategoryList = [
    "Antibiotics",
    "Analgesics",
    "Antidepressants",
    "Antihypertensives",
    "Antivirals",
    "Antifungals",
    "Anti-Inflammatories",
    "Antacids",
    "Antianxiety Drugs",
    "Antiemetics",
    "Antipyretics",
    "Bronchodilators",
    "Corticosteroids",
    "Diuretics",
    "Expectorants",
    "Hormones",
    "Immunosuppressives",
    "Laxatives",
    "Muscle Relaxants",
    "Tranquilizers",
    "Vitamins",
    "Other"
  ];
  DateTime selectDate = DateTime.now();
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectDate) {
      setState(() {
        selectDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Map data = {
      "scientific_name": "$Sname",
      "trading_name": "$Tname",
      "manufacturer_company": "$Mname",
      "category": "$selectedCategory",
      "quantity": "$Quan",
      "price": "$Price",
      "expirydate": "${selectDate.toLocal()}".split(' ')[0],
    };
    print("dataa ${data}");
    return Scaffold(
      body: Center(
        child: Container(
            padding: EdgeInsets.all(16),
            height: MediaQuery.of(context).size.height * .75,
            width: MediaQuery.of(context).size.width * .60,
            decoration: BoxDecoration(
                color: Color.fromARGB(255, 16, 22, 58),
                borderRadius: BorderRadius.circular(12)),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                        onPressed: () {
                          StoreProvider.of<AppState>(context)
                              .dispatch(NavClickAction(currentIndex: 1));
                        },
                        color: Colors.white,
                        icon: Icon(Icons.close))
                  ],
                ),
                Container(
                  // padding: EdgeInsets.all(20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Create new Product",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  width: 800,
                  height: 60,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          width: 300,
                          height: 70,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.black, width: 2),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Expanded(
                            // or SizedBox
                            child: TextField(
                              onChanged: (value) {
                                setState(() {
                                  Sname = value;
                                });
                              },
                              style: TextStyle(color: Colors.black),
                              decoration: InputDecoration(
                                hintText: 'Scientific name',
                                contentPadding: EdgeInsets.all(6),
                                hintStyle: TextStyle(
                                    color: Colors.black.withOpacity(0.4)),
                                filled: true,
                                fillColor: Colors.white,
                                border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(12)),
                                    borderSide:
                                        BorderSide(color: Colors.black)),
                              ),
                            ),
                          ),
                        ),
                        Container(
                            width: 300,
                            height: 50,
                            padding: EdgeInsets.only(left: 12),
                            decoration: BoxDecoration(
                                border:
                                    Border.all(color: Colors.black, width: 2),
                                borderRadius: BorderRadius.circular(12),
                                color: Colors.white),
                            child: Expanded(
                              // or SizedBox
                              child: DropdownButton(
                                underline: SizedBox(),
                                isExpanded: true,
                                borderRadius: BorderRadius.circular(12),
                                icon: Icon(Icons.arrow_drop_down),
                                iconSize: 30,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 19,
                                    fontWeight: FontWeight.bold),
                                hint: Text("Category"),
                                onChanged: (value) {
                                  setState(() =>
                                      selectedCategory = value as String?);
                                },
                                value: selectedCategory,
                                items: CategoryList.map((e) {
                                  return DropdownMenuItem(
                                    value: e,
                                    child: Text("$e"),
                                  );
                                }).toList(),
                              ),
                            ))
                      ]),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                    padding: EdgeInsets.all(10),
                    width: 800,
                    height: 60,
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                            width: 300,
                            height: 70,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.black, width: 2),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Expanded(
                              // or SizedBox
                              child: TextField(
                                onChanged: (value) {
                                  setState(() {
                                    Tname = value;
                                  });
                                },
                                style: TextStyle(color: Colors.black),
                                decoration: InputDecoration(
                                  hintText: 'Commercial name',
                                  contentPadding: EdgeInsets.all(6),
                                  hintStyle: TextStyle(
                                      color: Colors.black.withOpacity(0.4)),
                                  filled: true,
                                  fillColor: Colors.white,
                                  border: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(12)),
                                      borderSide:
                                          BorderSide(color: Colors.black)),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            width: 300,
                            height: 70,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.black, width: 2),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Expanded(
                              // or SizedBox
                              child: TextField(
                                onChanged: (value) {
                                  setState(() {
                                    Mname = value;
                                  });
                                },
                                style: TextStyle(color: Colors.black),
                                decoration: InputDecoration(
                                  hintText: 'Manufacturing Company',
                                  contentPadding: EdgeInsets.all(6),
                                  hintStyle: TextStyle(
                                      color: Colors.black.withOpacity(0.4)),
                                  filled: true,
                                  fillColor: Colors.white,
                                  border: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(12)),
                                      borderSide:
                                          BorderSide(color: Colors.black)),
                                ),
                              ),
                            ),
                          ),
                        ])),
                SizedBox(
                  height: 10,
                ),
                Container(
                    padding: EdgeInsets.all(10),
                    width: 800,
                    height: 60,
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                            width: 300,
                            height: 70,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.black, width: 2),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Expanded(
                              // or SizedBox
                              child: TextField(
                                onChanged: (value) {
                                  setState(() {
                                    Quan = value;
                                  });
                                },
                                style: TextStyle(color: Colors.black),
                                decoration: InputDecoration(
                                  hintText: 'Available quantity',
                                  contentPadding: EdgeInsets.all(6),
                                  hintStyle: TextStyle(
                                      color: Colors.black.withOpacity(0.4)),
                                  filled: true,
                                  fillColor: Colors.white,
                                  border: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(12)),
                                      borderSide:
                                          BorderSide(color: Colors.black)),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            width: 300,
                            height: 70,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.black, width: 2),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Expanded(
                              // or SizedBox
                              child: TextField(
                                onChanged: (value) {
                                  setState(() {
                                    Price = value;
                                  });
                                },
                                style: TextStyle(color: Colors.black),
                                decoration: InputDecoration(
                                  hintText: 'Price',
                                  contentPadding: EdgeInsets.all(6),
                                  hintStyle: TextStyle(
                                      color: Colors.black.withOpacity(0.4)),
                                  filled: true,
                                  fillColor: Colors.white,
                                  border: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(12)),
                                      borderSide:
                                          BorderSide(color: Colors.black)),
                                ),
                              ),
                            ),
                          ),
                        ])),
                SizedBox(
                  height: 10,
                ),
                Container(
                    padding: EdgeInsets.all(10),
                    width: 800,
                    height: 60,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          width: 300,
                          child:
                              Column(mainAxisSize: MainAxisSize.min, children: [
                            Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Container(
                                        width: 300,
                                        child: ElevatedButton(
                                          onPressed: () => _selectDate(context),
                                          child: const Text(
                                            'select date',
                                            style:
                                                TextStyle(color: Colors.grey),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ])
                          ]),
                        ),
                        Container(
                          width: 300,
                          child: Text(
                            "${selectDate.toLocal()}".split(' ')[0],
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ],
                    )),
                SizedBox(
                  height: 50,
                ),
                Container(
                    width: 800,
                    height: 60,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        MaterialButton(
                          onPressed: () async {
                            String? token = await getToken();
                            Response response = await post(
                                Uri.parse(
                                    'http://127.0.0.1:8000/api/create-medicine'),
                                headers: {
                                  "Content-Type": "application/json",
                                  "Authorization": "Bearer ${token}"
                                },
                                body: jsonEncode(data));
                            
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
              
                                  content: Text('${jsonDecode(response.body)['message']}.'),
                                  actions: <Widget>[
                                    TextButton(
                                      child: Text('Close'),
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                    ),
                                  ],
                                );
                              },
                            );
                          },
                          color: Color.fromARGB(255, 222, 69, 41),
                          height: 100,
                          minWidth: 200,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Text(
                            "ADD PRODUCT",
                            style: TextStyle(
                                fontSize: 19,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        )
                      ],
                    ))
              ],
            )),
      ),
    );
  }
}
