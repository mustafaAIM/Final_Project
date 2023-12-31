import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter1/Mootaz/bottomNav.dart';
import 'package:flutter1/main.dart';
import 'package:flutter_locales/flutter_locales.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:http/http.dart';
import 'package:redux/redux.dart';

class homePage extends StatefulWidget {
  const homePage({
    super.key,
  });

  @override
  State<homePage> createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  int selectedIndex = 0;
  List category = [];
  List medicines = [{}];
  String selectedCategory = 'Vitamins';
  List catNameAndImage = [
    {'name': 'Panadol', 'image': 'images/product2.jpg'},
    {'name': 'Panadol', 'image': 'images/product2.jpg'},
    {'name': 'Panadol', 'image': 'images/product2.jpg'},
    {'name': 'Panadol', 'image': 'images/product2.jpg'},
    {'name': 'Panadol', 'image': 'images/product2.jpg'},
  ];
  bool loading = true;

  getData(index, context, store) async {
    String? token = await getToken();
    print(token);
    Response response = await get(
      Uri.parse('http://127.0.0.1:8000/api/warehouses/${index + 1}'),
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer ${token}"
      },
    );
    print("index : ${index}");
    print(response.body);
    if (response.statusCode == 404) {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('No medicine yet'),
              content: Text("This warehouse is empty"),
              actions: <Widget>[
                TextButton(
                  child: Text('Close'),
                  onPressed: () {
                    Navigator.of(context).pop();
                    store.dispatch(NavClickAction(currentIndex: 0));
                  },
                ),
              ],
            );
          });
    }
    if (response.statusCode == 200) {
      print('products : ${response.body}');
      Map data = jsonDecode(response.body);
      setState(() {
        loading = false;
        category = data['categories'];
        medicines = data['medicines'];
        print(category);
        print(medicines);
      });
    }
  }

  GetCategory(index, context, store, category) async {
    String? token = await getToken();
    print(index);
    print(category);
    Response response = await get(
      Uri.parse('http://127.0.0.1:8000/api/get-medicines-by-category/${index + 1}/$category'),
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer ${token}"
      },
    );
    print("index : ${index}");
    print(response.body);
    // if (response.statusCode == 404) {

    // }
    if (response.statusCode == 200) {
      print('products : ${response.body}');
      Map data = jsonDecode(response.body);
      setState(() {
        medicines = data['medicines'];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, dynamic>(
        converter: (store) => store,
        builder: (context, store) {
          if (loading) {
            getData(store.state.index, context, store);
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return Scaffold(
                body: ListView(
              children: [
                Container(
                  height: 250,
                  color: Colors.white,
                  child: Stack(
                    children: [
                      Container(
                        // height: 250,
                        padding: EdgeInsets.only(
                            left: 15, right: 15, top: 15, bottom: 10),
                        decoration: const BoxDecoration(
                            color: Color.fromARGB(255, 56, 161, 241),
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(25),
                                bottomRight: Radius.circular(25))),
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
                                      icon: Icon(Icons.search,
                                          color: Colors.black, size: 35),
                                      onPressed: () => {
                                        showSearch(
                                            context: context,
                                            delegate: CustomSearch(medicines))
                                      },
                                    ),
                                    IconButton(
                                      icon: Icon(Icons.star,
                                          color: Colors.yellow, size: 35),
                                      onPressed: () => {
                                        Navigator.pushNamed(
                                            context, '/favoritePage')
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
                            SizedBox(
                              height: 10,
                            ),
                            SizedBox(
                              height: 100,
                            )
                          ],
                        ),
                      ),
                      Positioned(
                        top: 100,
                        left: 50,
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(25),
                            child: Image.asset(
                              "images/background.jpg",
                              width: 300,
                              height: 250,
                            )),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  padding: EdgeInsets.only(left: 25, right: 25),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      LocaleText("category",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          )),
                      InkWell(
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            '/categoryPage',
                          );
                        },
                        child: LocaleText(
                          "see",
                          style: TextStyle(
                              color: Colors.blue[400],
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                    padding: EdgeInsets.only(left: 15),
                    height: 60,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: category.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            return GetCategory(store.state.index, context,
                                store, category[index]);
                          },
                          child: Container(
                            margin: EdgeInsets.only(right: 10),
                            padding: EdgeInsets.all(10),
                            width: 200,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(50),
                              border: Border.all(
                                color: Colors.black,
                                width: 1.2,
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                ClipRRect(
                                  child: Image.asset(
                                    "${catNameAndImage[index]['image']}",
                                    width: 50,
                                    height: 50,
                                  ),
                                  borderRadius: BorderRadius.circular(50),
                                ),
                                Text("${category[index]}",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 17)),
                              ],
                            ),
                          ),
                        );
                      },
                    )),
                SizedBox(
                  height: 20,
                ),
                Container(
                  padding: EdgeInsets.only(left: 25),
                  child: LocaleText(
                    "recommend",
                    style: TextStyle(
                        fontSize: 19,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                ),
                Container(
                  width: 100,
                  padding: EdgeInsets.all(15),
                  child: GridView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3, mainAxisExtent: 170),
                      itemCount: medicines.length,
                      itemBuilder: (context, index) {
                        //  if (medicines[index]["category"] == selectedCategory) {
                        return InkWell(
                          onTap: () {
                            StoreProvider.of<AppState>(context)
                                .dispatch(NavClickAction(indexPhoto: index));

                            Navigator.pushNamed(
                              context,
                              '/item',
                              arguments: medicines[index]['id']
                            );
                          },
                          child: Card(
                            child: Column(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Colors.grey[300],
                                  ),
                                  width: 120,
                                  height: 100,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(20),
                                    child: Image.asset(
                                      "images/product2.jpg",
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 6,
                                ),
                                Text(
                                  "${medicines[index]["scientific_name"]}",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  "${medicines[index]['price']}\$",
                                  style: TextStyle(
                                      color: Colors.redAccent,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                          ),
                        );
                      }
                      // ;
                      // },
                      ),
                )
              ],
            ));
          }
        });
  }
}

class CustomSearch extends SearchDelegate {
  List? firstChar;
  final List medicines;
  // Initialize the field in the constructor
  CustomSearch(this.medicines);
  // The rest of the code
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.arrow_forward_outlined),
        onPressed: () {
          Navigator.of(context).pop();
          StoreProvider.of<AppState>(context)
              .dispatch(NavClickAction(currentIndex: 4));
        },
      )
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.close),
      onPressed: () {
        query = "";
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Text("result : $query");
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if (query == "") {
      return ListView.builder(
        itemCount: medicines.length,
        itemBuilder: (context, index) {
          return InkWell(
              onTap: () {
                StoreProvider.of<AppState>(context)
                    .dispatch(NavClickAction(indexPhoto: index));

                Navigator.pushNamed(
                  context,
                  '/item',
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
                        borderRadius: BorderRadius.circular(100),
                        child: Image.asset(
                          "images/product2.jpg",
                          width: 75,
                          height: 75,
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(9),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "${medicines[index]["scientific_name"]}",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ));
        },
      );
    } else {
      firstChar = medicines
          .where((element) => element["scientific_name"].contains(query))
          .map((element) => element["scientific_name"])
          .toList();
      return ListView.builder(
        itemCount: firstChar!.length,
        itemBuilder: (context, index) {
          return InkWell(
              onTap: () {
                Navigator.pushNamed(context, "/item");
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
                        borderRadius: BorderRadius.circular(100),
                        child: Image.asset(
                          "images/product2.jpg",
                          width: 75,
                          height: 75,
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(9),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "${firstChar?[index]}",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ));
        },
      );
    }
  }
}
