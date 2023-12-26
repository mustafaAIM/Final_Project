// ignore_for_file: prefer_const_constructors

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter1/main.dart';
import 'package:flutter_redux/flutter_redux.dart';

class searchProductPage extends StatefulWidget {
  const searchProductPage({super.key});

  @override
  State<searchProductPage> createState() => _searchProductPageState();
}

class _searchProductPageState extends State<searchProductPage> {
  List products = [
    {
      "Commercial Name": "Panadol",
      "scientific Name": "Panadol",
      "Quantity": 220,
      "Price": 120,
      "Expiration date": "2020-2-2"
    },
    {
      "Commercial Name": "profin",
      "scientific Name": "profin",
      "Quantity": 250,
      "Price": 300,
      "Expiration date": "2020-3-5"
    },
    {
      "Commercial Name": "Panadol",
      "scientific Name": "Panadol",
      "Quantity": 220,
      "Price": 120,
      "Expiration date": "2020-2-2"
    },
    {
      "Commercial Name": "profin",
      "scientific Name": "profin",
      "Quantity": 250,
      "Price": 300,
      "Expiration date": "2020-3-5"
    },
    {
      "Commercial Name": "Panadol",
      "scientific Name": "Panadol",
      "Quantity": 220,
      "Price": 120,
      "Expiration date": "2020-2-2"
    },
    {
      "Commercial Name": "profin",
      "scientific Name": "profin",
      "Quantity": 250,
      "Price": 300,
      "Expiration date": "2020-3-5"
    },
    {
      "Commercial Name": "Panadol",
      "scientific Name": "Panadol",
      "Quantity": 220,
      "Price": 120,
      "Expiration date": "2020-2-2"
    },
    {
      "Commercial Name": "profin",
      "scientific Name": "profin",
      "Quantity": 250,
      "Price": 300,
      "Expiration date": "2020-3-5"
    },
    {
      "Commercial Name": "Panadol",
      "scientific Name": "Panadol",
      "Quantity": 220,
      "Price": 120,
      "Expiration date": "2020-2-2"
    },
    {
      "Commercial Name": "profin",
      "scientific Name": "profin",
      "Quantity": 250,
      "Price": 300,
      "Expiration date": "2020-3-5"
    },
    {
      "Commercial Name": "Panadol",
      "scientific Name": "Panadol",
      "Quantity": 220,
      "Price": 120,
      "Expiration date": "2020-2-2"
    },
    {
      "Commercial Name": "profin",
      "scientific Name": "profin",
      "Quantity": 250,
      "Price": 300,
      "Expiration date": "2020-3-5"
    },
  ];
  List findProducts = [];
  @override
  void initState() {
    findProducts = products;
    super.initState();
  }

  void runSearchProduct(String enterdeKey) {
    List results = [];
    if (enterdeKey.isEmpty) {
      results = products;
    } else {
      results = products
          .where((element) => element["Commercial Name"]
              .toLowerCase()
              .contains(enterdeKey..toLowerCase()))
          .toList();
    }

    setState(() {
      findProducts = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      padding: EdgeInsets.all(30),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: MediaQuery.of(context).size.width / 5,
                child: Text(
                  "Products :",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
              ),
              Expanded(
                child: Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width / 4,
                        height: 35,
                        child: Expanded(
                          child: TextField(
                            onChanged: (value) => runSearchProduct(value),
                            style: TextStyle(color: Colors.black),
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(6),
                              suffixIcon: Icon(Icons.search),
                              hintStyle: TextStyle(color: Colors.black),
                              filled: true,
                              fillColor: Colors.white,
                              border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20)),
                                  borderSide: BorderSide(color: Colors.black)),
                            ),
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          MaterialButton(
                            onPressed: () {
                              StoreProvider.of<AppState>(context)
                                  .dispatch(NavClickAction(4));
                            },
                            color: Colors.white,
                            padding: EdgeInsets.all(20),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12)),
                            child: Text(
                              "Import Products",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Container(
                            padding: EdgeInsets.all(3),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                    offset: Offset(0, 1),
                                    color: Colors.grey,
                                    blurRadius: 1)
                              ],
                            ),
                            child: IconButton(
                              onPressed: () {},
                              color: Colors.black,
                              icon: Icon(Icons.filter_alt),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            height: 50,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 5,
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.only(right: 20),
                  padding: EdgeInsets.only(left: 10),
                  decoration: BoxDecoration(
                      color: Color.fromARGB(137, 227, 222, 222),
                      borderRadius: BorderRadius.circular(20)),
                  child: Row(
                    children: [
                      Text("Category"),
                      IconButton(onPressed: () {}, icon: Icon(Icons.close))
                    ],
                  ),
                );
              },
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Expanded(
            child: DataTable2(
                border: TableBorder(
                    verticalInside: BorderSide(color: Colors.black, width: 2)),
                headingRowColor: MaterialStatePropertyAll(Colors.black26),
                dataTextStyle: TextStyle(fontSize: 16),
                columnSpacing: 12,
                horizontalMargin: 12,
                minWidth: 600,
                columns: [
                  DataColumn2(
                    label: Text('Commercial Name'),
                    size: ColumnSize.L,
                  ),
                  DataColumn(
                    label: Text('scientific Name'),
                  ),
                  DataColumn(
                    label: Text('Quantity'),
                  ),
                  DataColumn(
                    label: Text('Price'),
                  ),
                  DataColumn(
                    label: Text('Expiration date'),
                  ),
                ],
                headingRowDecoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(12),
                        topRight: Radius.circular(12))),
                headingTextStyle:
                    TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                rows: List<DataRow>.generate(findProducts.length, (index) {
                  if (index.isEven) {
                    return DataRow(
                        onLongPress: () {
                          StoreProvider.of<AppState>(context)
                              .dispatch(NavClickAction(5));
                        },
                        color: MaterialStatePropertyAll(
                            Color.fromARGB(255, 217, 217, 217)),
                        cells: [
                          DataCell(
                            Text('${findProducts[index]["Commercial Name"]}'),
                          ),
                          DataCell(Text(
                              '${findProducts[index]["scientific Name"]}')),
                          DataCell(Text('${findProducts[index]["Quantity"]}')),
                          DataCell(Text('${findProducts[index]["Price"]}\$')),
                          DataCell(
                              Text("${findProducts[index]["Expiration date"]}"))
                        ]);
                  } else {
                    return DataRow(
                        onLongPress: () {
                          StoreProvider.of<AppState>(context)
                              .dispatch(NavClickAction(5));
                        },
                        cells: [
                          DataCell(
                            Text('${findProducts[index]["Commercial Name"]}'),
                          ),
                          DataCell(Text(
                              '${findProducts[index]["scientific Name"]}')),
                          DataCell(Text('${findProducts[index]["Quantity"]}')),
                          DataCell(Text('${findProducts[index]["Price"]}\$')),
                          DataCell(
                              Text("${findProducts[index]["Expiration date"]}"))
                        ]);
                  }
                })),
          )
        ],
      ),
    ));
  }
}
