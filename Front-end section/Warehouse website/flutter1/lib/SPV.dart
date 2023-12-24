import 'package:flutter/material.dart';
import 'package:flutter1/CreateProducts.dart';
import 'package:flutter1/Profile.dart';
import 'package:flutter1/dashboard.dart';
import 'package:flutter1/main.dart';
import 'package:flutter1/orders.dart';
import 'package:flutter1/searchProduct.dart';
import 'package:flutter1/showProduct.dart';
import 'package:flutter_redux/flutter_redux.dart';

class SPV extends StatefulWidget {
  const SPV({super.key});

  @override
  State<SPV> createState() => _SPVState();
}

class _SPVState extends State<SPV> {
  List pages = [
    dashboard(),
    searchProductPage(),
    ordersPage(),
    profilePage(),
    createProductPage(),
    showProductPage()
  ];

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
        borderRadius: BorderRadius.horizontal(left: Radius.circular(20)),
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width * 85 / 100,
          color:  Colors.white,
          padding: EdgeInsets.only(bottom: 20),
          child: StoreConnector<AppState, AppState>(
              converter: (store) => store.state,
              builder: (_, state) {
                return Expanded(
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.fromLTRB(0,20,20,0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            IconButton(onPressed: (){}, icon: Icon(Icons.notifications)),
                            SizedBox(width: 20,),
                            CircleAvatar(backgroundImage: AssetImage('images/avatar.png'),),
                            SizedBox(width: 10,),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Name"),
                                Text("Warehouse Name"),
                              ],
                            )
                          ],
                        ),
                      ),
                      Divider(
                    color: Colors.black,
                    height: 50,
                    thickness: 1,
                  ),
                      Expanded(child: pages[state.currentIndex]),
                    ],
                  ),
                );
              }),
        ));
  }
}
