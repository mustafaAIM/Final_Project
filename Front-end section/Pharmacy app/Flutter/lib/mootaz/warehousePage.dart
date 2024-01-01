import 'package:flutter/material.dart';
import 'package:flutter1/main.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:redux/redux.dart';

class warehousePage extends StatefulWidget {
  const warehousePage({
    super.key,
  });

  @override
  State<warehousePage> createState() => _warehousePageState();
}

class _warehousePageState extends State<warehousePage> {
  @override
  void initState() {
    super.initState();
    // WidgetsBinding.instance.addPostFrameCallback((_) {
    //   StoreProvider.of<AppState>(context).dispatch(
    //       getWarehousesAction(url: 'http://127.0.0.1:8000/api/warehouses'));
    // });
  }

  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {

    return StoreConnector<AppState, dynamic>(
      converter: (store) => store.state,
      builder: (context, data) {
        print("in before warehouse state index: ${data.index}");
        if (data.warehouse == const {}) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else {
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
                  padding: EdgeInsets.all(10),
                  height: 2000,
                  child: ListView.builder(
                    itemCount: data.warehouse['warehouses'].length!,
                    itemBuilder: (context, index) {
                      return StoreConnector<AppState, AppState>(
                          converter: (store) => store.state,
                          builder: (context, state) {
                            return InkWell(
                                onTap: () {
                                  if (state.cart.length != 0 &&
                                      state.index != index) {
                                    showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return AlertDialog(
                                            content: Text(
                                                "you can't buy from multiple warehouses at the same time if you wish to continue we will discard everythin you have in the cart"),
                                            actions: <Widget>[
                                              TextButton(
                                                child: Text('back'),
                                                onPressed: () {
                                                  Navigator.of(context).pop();
                                                },
                                              ),
                                              TextButton(
                                                child: Text('Discard'),
                                                onPressed: () {
                                                  Navigator.of(context).pop();
                                                  StoreProvider.of<AppState>(
                                                          context)
                                                      .dispatch(DiscardAction(
                                                          index: 0));
                                                },
                                              ),
                                            ],
                                          );
                                        });
                                  } else
                                    StoreProvider.of<AppState>(context)
                                        .dispatch(choosewarehouseAction(
                                             index: index));
                                            
                                  print("in after warehouse state index: ${state.index}");
                                },
                                child: Container(
                                  margin: EdgeInsets.only(bottom: 10),
                                  height: 100,
                                  child: Card(
                                    elevation: 6,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        ClipRRect(
                                          borderRadius: BorderRadius.only(
                                              topRight: Radius.circular(15),
                                              bottomLeft: Radius.circular(15)),
                                          child: Image.asset(
                                            "images/product2.jpg",
                                            width: 75,
                                            height: 75,
                                          ),
                                        ),
                                        Container(
                                          padding: EdgeInsets.all(9),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                "${data.warehouse["warehouses"][index]["name"]}",
                                                style: TextStyle(
                                                    fontSize: 20,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ));
                          });
                    },
                  ),
                )
              ],
            ),
          );
        }
      },
      onInit: (store) async {
        String? token = await getToken();
        store.dispatch(GetWarehouseAction(
            token: token, url: "http://127.0.0.1:8000/api/warehouses"));
      },
    );
  }
}
