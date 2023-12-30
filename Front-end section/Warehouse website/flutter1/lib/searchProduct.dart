// ignore_for_file: prefer_const_constructors

import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter1/main.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:http/http.dart';

class searchProductPage extends StatefulWidget {
  const searchProductPage({super.key});

  @override
  State<searchProductPage> createState() => _searchProductPageState();
}

class _searchProductPageState extends State<searchProductPage> {
  List products = [];
  List findProducts = [];
  @override
  void initState() {
    getMeds();
    findProducts = products;
    super.initState();
  }

  void getMeds() async {
    String? token = await getToken();
    Response response = await get(
      Uri.parse('http://127.0.0.1:8000/api/display-medicines'),
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer ${token}"
      },
    );
    if (response.statusCode == 200) {
      setState(() {
        findProducts = jsonDecode(response.body);
      });
      print('products : $findProducts');
    }
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
    if (products == []) {
      return CircularProgressIndicator();
    } else {
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
                                    borderSide:
                                        BorderSide(color: Colors.black)),
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
                                onPressed: () {
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return Dialog(
                                        child: Container(
                                          padding: EdgeInsets.all(0),
                                          width: 600,
                                          child: AlertDialog(
                                            content: Container(
                                              width: double.maxFinite,
                                              child: GridView.count(
                                                crossAxisCount: 3,
                                                children:
                                                    List.generate(22, (index) {
                                                  return Center(
                                                    child: InkWell(
                                                      hoverColor:
                                                          Color.fromARGB(255,
                                                              238, 232, 244),
                                                      onHover: null,
                                                      onTap: () {
                                                        print("esafsaf");
                                                      },
                                                      child: Container(
                                                        margin:
                                                            EdgeInsets.fromLTRB(
                                                                20, 0, 0, 20),
                                                        padding:
                                                            EdgeInsets.all(20),
                                                        decoration: BoxDecoration(
                                                            color: Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        20),
                                                            boxShadow: [
                                                              BoxShadow(
                                                                  offset:
                                                                      Offset(
                                                                          0, 6),
                                                                  color: Colors
                                                                      .grey,
                                                                  blurRadius:
                                                                      12)
                                                            ],
                                                            border: Border.all(
                                                                color: Colors
                                                                    .black,
                                                                width: 2)),
                                                        child: Text(
                                                          'Category ${index + 1}',
                                                          style:
                                                              Theme.of(context)
                                                                  .textTheme
                                                                  .headline5,
                                                        ),
                                                      ),
                                                    ),
                                                  );
                                                }),
                                              ),
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  );
                                },
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
            Expanded(
              child: DataTable2(
                  border: TableBorder(
                      verticalInside:
                          BorderSide(color: Colors.black, width: 2)),
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
                      label: Text('Manifacturing company'),
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
                              Text('${findProducts[index]["trading_name"]}'),
                            ),
                            DataCell(Text(
                                '${findProducts[index]["scientific_name"]}')),
                            DataCell(
                                Text('${findProducts[index]["total_quantity"]}')),
                            DataCell(Text('${findProducts[index]["manufacturer_company"]}')),
                          ]);
                    } else {
                      return DataRow(
                          onLongPress: () {
                            StoreProvider.of<AppState>(context)
                                .dispatch(NavClickAction(5));
                          },
                          cells: [
                            DataCell(
                              Text('${findProducts[index]["trading_name"]}'),
                            ),
                            DataCell(Text(
                                '${findProducts[index]["scientific_name"]}')),
                            DataCell(
                                Text('${findProducts[index]["total_quantity"]}')),
                            DataCell(Text('${findProducts[index]["manufacturer_company"]}')),
                          ]);
                    }
                  })),
            )
          ],
        ),
      ));
    }
  }
}
