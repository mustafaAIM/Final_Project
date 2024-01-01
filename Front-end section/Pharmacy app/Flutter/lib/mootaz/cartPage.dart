import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter1/Mootaz/bottomNav.dart';
import 'package:flutter1/main.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:http/http.dart';

class cartPage extends StatefulWidget {
  const cartPage({
    super.key,
  });

  @override
  State<cartPage> createState() => _cartPageState();
}

class _cartPageState extends State<cartPage> {
  void sendrequest(data) async {
    String? token = await getToken();
    Response response = await post(
        Uri.parse('http://127.0.0.1:8000/api/make-order'),
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer ${token}"
        },
        body: jsonEncode(data));
    print(response.body);
  }

  num price = 0;
  List<TextEditingController> controllers = [];
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, AppState>(
        converter: (store) => store.state,
        builder: (context, state) {
          if (controllers.isEmpty) {
            controllers = List.generate(
                state.cart.length,
                (index) => TextEditingController(
                    text: state.cart[index]['amount'].toString()));
          }
          price = 0;
          for (int i = 0; i < state.cart.length; i++) {
            price +=
                state.cart[i]['amount'] * int.parse(state.cart[i]["price"]);
          }
          return Scaffold(
            body: ListView(
              children: [
                Container(
                  padding:
                      EdgeInsets.only(left: 15, right: 15, top: 12, bottom: 7),
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 56, 161, 241),
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Image.asset(
                            "images/logo.png",
                            width: 75,
                            height: 75,
                          ),
                          Container(
                            child: Row(children: [
                              IconButton(
                                icon: Icon(Icons.star,
                                    color: Colors.yellow, size: 35),
                                onPressed: () => {
                                  Navigator.pushNamed(context, '/favoritePage')
                                },
                              ),
                              IconButton(
                                icon: Icon(
                                  Icons.account_circle,
                                  size: 35,
                                ),
                                onPressed: () => {
                                  Navigator.pushNamed(context, "/ProfilePage")
                                },
                              )
                            ]),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  width: 100,
                  padding: EdgeInsets.fromLTRB(15, 15, 15, 0),
                  child: GridView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        mainAxisExtent: 250,
                        crossAxisSpacing: 8,
                        mainAxisSpacing: 8,
                        childAspectRatio: 2),
                    itemCount: state.cart.length,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          Container(
                            width: 150,
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(20),
                                    topRight: Radius.circular(20)),
                                color: const Color.fromARGB(255, 218, 218, 218),
                                border:
                                    Border.all(color: Colors.black, width: 2)),
                            child: Container(
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      StoreConnector<AppState, VoidCallback>(
                                          converter: (store) {
                                        // Returns a callback that dispatches an action
                                        return () {
                                          store.dispatch(removefromcartAction(
                                              index: index));
                                        };
                                      }, builder: (context, callback) {
                                        return IconButton(
                                          onPressed: () {
                                            callback();
                                          },
                                          icon: Icon(Icons.close),
                                          color: Colors.redAccent,
                                        );
                                      })
                                    ],
                                  ),
                                  SizedBox(
                                    height: 4,
                                  ),
                                  Text(
                                    "${state.cart[index]["name"]}",
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    height: 6,
                                  ),
                                  Text(
                                    "${state.cart[index]["price"]}",
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  Container(
                                    width: 100,
                                    height: 30,
                                    padding: EdgeInsets.all(5),
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(12)),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        StoreConnector<AppState,
                                                ValueChanged<String>>(
                                            converter: (store) {
                                          return (String number) {
                                            number.isEmpty
                                                ? store.dispatch(
                                                    (UpdateAmountAction(
                                                        index: index,
                                                        amount: 0)))
                                                : store.dispatch(
                                                    (UpdateAmountAction(
                                                        index: index,
                                                        amount: int.parse(
                                                            number))));
                                          };
                                          // Returns a callback that dispatches an action
                                        }, builder: (context, callback) {
                                          int maxvalue =
                                              state.cart[index]['quantity'];

                                          // Listen for changes to the TextEditingController
                                          controllers[index].addListener(() {
                                            int? number = int.tryParse(
                                                controllers[index].text);
                                            if (number == null) {
                                              controllers[index].text = '0';
                                            } else if (number > maxvalue) {
                                              // If the input is invalid, revert the change
                                              controllers[index].text =
                                                  maxvalue.toString();
                                            } else {
                                              // If the input is valid, update the state
                                              callback(controllers[index].text);
                                            }
                                          });
                                          return Expanded(
                                            child: TextFormField(
                                              controller: controllers[index],
                                              keyboardType:
                                                  TextInputType.number,
                                              decoration: InputDecoration(
                                                  hintText: "Amount",
                                                  border: InputBorder.none,
                                                  focusedBorder:
                                                      InputBorder.none,
                                                  enabledBorder:
                                                      InputBorder.none,
                                                  errorBorder: InputBorder.none,
                                                  disabledBorder:
                                                      InputBorder.none,
                                                  contentPadding:
                                                      EdgeInsets.fromLTRB(
                                                          6, 6, 10, 10)),
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.black
                                                      .withOpacity(0.4)),
                                            ),
                                          );
                                        })
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 0.2,
                          ),
                          Container(
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(20),
                                    bottomRight: Radius.circular(20)),
                                color: const Color.fromARGB(255, 218, 218, 218),
                                border:
                                    Border.all(color: Colors.black, width: 2)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "${state.cart[index]['amount'] * int.parse(state.cart[index]["price"])}",
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      );
                    },
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  padding: EdgeInsets.all(15),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Divider(color: Colors.black, thickness: 5),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            "$price",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(60),
                            child: MaterialButton(
                              onPressed: () {
                                List medicines;
                                medicines = state.cart.map((item) {
                                  return {
                                    'medicine_id': item['id'],
                                    'quantity': item['quantity'],
                                  };
                                }).toList();
                                sendrequest({
                                  "warehouse_id":state.index+1,
                                  "medicines": medicines
                                });
                                print({
                                  "warehouse_id": state.index+1,
                                  "medicines": medicines
                                });
                              },
                              
                              child: Text(
                                "Checkout",
                                style: TextStyle(
                                    fontSize: 17, fontWeight: FontWeight.bold),
                              ),
                              color: const Color.fromARGB(255, 3, 58, 103),
                              textColor: Colors.white,
                              height: 50,
                              minWidth: 120,
                              elevation: 8,
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          );
        });
  }
}
