// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter1/main.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

class sidebar extends StatefulWidget {
  const sidebar({super.key});

  @override
  State<sidebar> createState() => _sidebarState();
}

class _sidebarState extends State<sidebar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width * 15 / 100,
      child: Column(children: [
        Image.asset(
          "images/logo.png",
          height: 150,
          width: 150,
        ),
        StoreConnector<AppState, AppState>(
          converter: (store) => store.state,
          builder: (_, state) {
            return ListView(
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              children: [
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  decoration: BoxDecoration(
                      color: state.currentIndex == 0
                          ? Color.fromARGB(255, 222, 69, 41)
                          : null,
                      borderRadius: BorderRadius.circular(20)),
                  child: InkWell(
                    onTap: () {
                      StoreProvider.of<AppState>(context)
                          .dispatch(NavClickAction(currentIndex: 0));
                    },
                    child: ListTile(
                        tileColor: Colors.orange,
                        leading: Icon(
                          Icons.home,
                          color: Colors.white,
                        ),
                        title: Text(
                          "Dashboard",
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.normal,
                              inherit: false),
                        )),
                  ),
                ),
                Container(
                    margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    decoration: BoxDecoration(
                        color: state.currentIndex == 1 ||
                                state.currentIndex == 4 ||
                                state.currentIndex == 5
                            ? Color.fromARGB(255, 222, 69, 41)
                            : null,
                        borderRadius: BorderRadius.circular(20)),
                    child: InkWell(
                      onTap: () {
                        StoreProvider.of<AppState>(context)
                            .dispatch(NavClickAction(currentIndex: 1));
                        print(StoreProvider.of<AppState>(context)
                            .state
                            .currentIndex);
                      },
                      child: ListTile(
                          tileColor: Colors.orange,
                          leading: Icon(
                            Icons.shop,
                            color: Colors.white,
                          ),
                          title: Text(
                            "Products",
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                                fontWeight: FontWeight.normal,
                                inherit: false),
                          )),
                    )),
                Container(
                    margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    decoration: BoxDecoration(
                        color: state.currentIndex == 2
                            ? Color.fromARGB(255, 222, 69, 41)
                            : null,
                        borderRadius: BorderRadius.circular(20)),
                    child: InkWell(
                      onTap: () {
                        StoreProvider.of<AppState>(context)
                            .dispatch(NavClickAction(currentIndex: 2));
                      },
                      child: ListTile(
                          leading: Icon(
                            Icons.money,
                            color: Colors.white,
                          ),
                          title: Text(
                            "Orders",
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                                fontWeight: FontWeight.normal,
                                inherit: false),
                          )),
                    )),
                Container(
                    margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    decoration: BoxDecoration(
                        color: state.currentIndex == 3
                            ? Color.fromARGB(255, 222, 69, 41)
                            : null,
                        borderRadius: BorderRadius.circular(20)),
                    child: InkWell(
                      onTap: () {
                        StoreProvider.of<AppState>(context)
                            .dispatch(NavClickAction(currentIndex: 3));
                      },
                      child: ListTile(
                          leading: Icon(
                            Icons.person,
                            color: Colors.white,
                          ),
                          title: Text(
                            "Profile",
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                                fontWeight: FontWeight.normal,
                                inherit: false),
                          )),
                    )),
              ],
            );
          },
        ),
        Container(
          height: MediaQuery.of(context).size.height / 2.7,
          child: Column(mainAxisAlignment: MainAxisAlignment.end, children: [
            Text(
              "Copyrights - AIO",
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.orange),
            )
          ]),
        )
      ]),
    );
  }
}
