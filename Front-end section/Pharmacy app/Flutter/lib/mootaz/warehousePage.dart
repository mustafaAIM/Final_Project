import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class warehousePage extends StatefulWidget {
  const warehousePage({
    super.key,
  });

  @override
  State<warehousePage> createState() => _warehousePageState();
}

class _warehousePageState extends State<warehousePage> {

  int currentIndex = 0;
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:ListView(
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
                                   Navigator.pushNamed(
                                       context,
                                        '/favoritePage',
                                              )
                                },
                              ),
                              IconButton(
                                icon: Icon(
                                  Icons.account_circle,
                                  size: 35,
                                ),
                                onPressed: () => {
                                   Navigator.pushNamed(
                      context,
                      '/ProfilePage',
                    )
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
                    itemCount: 20,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                            Navigator.pushNamed(
                        context,
                        '/homePage',
                      );
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
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                           children: [
                            ClipRRect(
                            borderRadius: BorderRadius.only(topRight: Radius.circular(15),bottomLeft: Radius.circular(15)),
                            child: Image.asset(
                              "images/product2.jpg",
                              width: 75,
                              height: 75,
                              ),
                          ),
                        Container(
                          padding: EdgeInsets.all(9),
                          child:  Column(
                            children: [
                              Text("Warehouse Name",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold
                              ),
                              ),
                              SizedBox(height: 3),
                              Chip(
                                label: Text("Status"),
                                backgroundColor: Colors.blue,
                                ),
                              
                            ],
                          ),
                        )
                           ],
                          ),
                          ),
                        )
                        );
                    },
                    ),
                )
        ],
      ),
      
    );
  }
}