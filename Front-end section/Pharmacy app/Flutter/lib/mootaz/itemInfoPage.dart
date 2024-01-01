// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter1/Mootaz/bottomNav.dart';
import 'package:flutter1/Mootaz/boxApp.dart';
import 'package:flutter1/Mootaz/postBottomBar.dart';
import 'package:flutter1/main.dart';
import 'package:flutter_locales/flutter_locales.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:http/http.dart';

class itemInfoPage extends StatefulWidget {
  const itemInfoPage({
    super.key,
  });

  @override
  State<itemInfoPage> createState() => _itemInfoPageState();
}

class _itemInfoPageState extends State<itemInfoPage> {
  int selectedIndex = 0;
  String medid = '';
  String dropdownValue = '2020-1-2. Q: 20';
  bool loading = true;
  String scientific_name = '';
  String trading_name = '';
  String category = '';
  String manufacturer_company = '';
  int price = 0;
  int total_quantity = 0;
  String expirationDate = "";
  List<dynamic> info = [];
  String value = '';
  bool iconColor = true;
  getData(index, indexPhoto) async {
    String? token = await getToken();
    print(token);
    Response response = await get(
      Uri.parse(
          'http://127.0.0.1:8000/api/warehouses/${index + 1}/${indexPhoto}'),
          'http://127.0.0.1:8000/api/warehouses/${index + 1}/${indexPhoto}'),
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer ${token}"
      },
    );
    print("index : ${index}");
    print(response.body);
    if (response.statusCode == 200) {
      print('products : ${response.body}');
      Map data = jsonDecode(response.body);
      setState(() {
        loading = false;
        medid = data['medicine']['id'];
        scientific_name = data['medicine']['scientific_name'];
        trading_name = data['medicine']['trading_name'];
        category = data['medicine']['category'];
        manufacturer_company = data['medicine']['manufacturer_company'];
        price = data['medicine']['price'];
        iconColor = data['medicine']['favorites'];
        info = data["medicine"]["info"].map((item) {
          return '${item['expiration']}. Q:${item['quantity'].toString()}';
        }).toList();
        print("this is infooooooooooooooo${info}");
        value = info[selectedIndex];
        total_quantity = data['medicine']['total_quantity'];
      });
    }
  }

  Future<void> addToFavorites(int id) async {
    String? token = await getToken();
    print(id);
    try {
      final response = await post(
        Uri.parse('http://127.0.0.1:8000/api/add-to-favorites'),
       headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer ${token}"
      },
        body: jsonEncode({"medicine_id":id}),
      );
      print(response.body);
      if (response.statusCode == 200) {
        // The request was successful
        print('Added to favorites');
      } else {
        // The request failed
        print('Failed to add to favorites');
      }
    } catch (e) {
      // There was an error
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    int id = ModalRoute.of(context)!.settings.arguments as int;
    return StoreConnector<AppState, dynamic>(
        converter: (store) => store.state,
        builder: (context, state) {
        print("in iteminfo state index: ${state.index}");
          if (loading) {
            getData(state.index, id);
            return Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          } else {
            return Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("images/itemInfo.jpg"),
                      fit: BoxFit.fill,
                      opacity: 0.8)),
              child: Scaffold(
                backgroundColor: Colors.transparent,
                appBar: PreferredSize(
                  preferredSize: Size.fromHeight(60),
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Container(
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(15),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black,
                                    blurRadius: 6,
                                  )
                                ]),
                            child: Icon(
                              Icons.arrow_back,
                              size: 28,
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () async {
                            setState(() {
                              iconColor = !iconColor;
                            });
                            // Send the POST request
                            await addToFavorites(id);
                          },
                          child: Container(
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(15),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black,
                                    blurRadius: 6,
                                  )
                                ]),
                            child: Icon(
                              Icons.star,
                              size: 28,
                              color: iconColor ? Colors.yellow : Colors.white,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                bottomNavigationBar: Container(
                  height: MediaQuery.of(context).size.height / 2,
                  padding: EdgeInsets.only(top: 20, left: 20, right: 20),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(40),
                          topRight: Radius.circular(40))),
                  child: ListView(
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  LocaleText(
                                    "scientific",
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    ": ${scientific_name}",
                                    style: TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              LocaleText(
                                "comercial",
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                ": ${trading_name}",
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              LocaleText(
                                "category",
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                ": ${category}",
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              LocaleText(
                                "manufacturing",
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                ": ${manufacturer_company}",
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  LocaleText(
                                    "available",
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    ": ${total_quantity} ",
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                              Text(
                              Text(
                                "${price}\$",
                                style: TextStyle(
                                    fontSize: 21,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.amberAccent),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              LocaleText(
                                "earliest",
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                              Text(": "),
                              Container(
                                width: 210,
                                child: DropdownButton<String>(
                                  enableFeedback: false,
                                  underline: SizedBox(),
                                  // value: expirationDate,
                                  isExpanded: true,
                                  icon: Padding(
                                    padding: EdgeInsets.only(right: 10),
                                    child: Icon(Icons.arrow_downward),
                                  ),
                                  iconSize: 24,
                                  elevation: 16,
                                  style: const TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black),
                                  value: value,
                                  onChanged: (String? newValue) {
                                    setState(() {
                                      selectedIndex = info.indexOf(newValue!);
                                      value = newValue;
                                    });
                                  },
                                  items: info.map<DropdownMenuItem<String>>(
                                      (dynamic value) {
                                    return DropdownMenuItem<String>(
                                      enabled: false,
                                      value: value,
                                      child: Text(value),
                                    );
                                  }).toList(),
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          SizedBox(
                            height: 25,
                          ),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(60),
                            child: MaterialButton(
                              onPressed: () {},
                              child: LocaleText(
                                "add",
                                style: TextStyle(
                                    fontSize: 22, fontWeight: FontWeight.bold),
                              ),
                              color: const Color.fromARGB(255, 3, 58, 103),
                              textColor: Colors.white,
                              height: 60,
                              minWidth: 300,
                              elevation: 8,
                            ),
                          StoreConnector<AppState, VoidCallback>(
                            converter: (store) {
                              // Returns a callback that dispatches an action
                              return () {
                                print('dispatch');
                                store.dispatch(addToCartAction(
                                  name: trading_name,
                                  price: price.toString(),
                                  id: medid,
                                  quantity: total_quantity
                                ));
                              };
                            },
                            builder: (context, callback) {
                              return ClipRRect(
                                borderRadius: BorderRadius.circular(60),
                                child: MaterialButton(
                                  onPressed: () {
                                    print('call');
                                    callback();
                                  },
                                  child: LocaleText(
                                    "add",
                                    style: TextStyle(
                                        fontSize: 22,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  color: const Color.fromARGB(255, 3, 58, 103),
                                  textColor: Colors.white,
                                  height: 60,
                                  minWidth: 300,
                                  elevation: 8,
                                ),
                              );
                            },
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            );
          }
        });
  }
}
