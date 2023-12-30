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
  List catNameAndImage = [
    {'name': 'Panadol', 'image': 'images/product2.jpg'},
    {'name': 'Panadol', 'image': 'images/product2.jpg'},
    {'name': 'Panadol', 'image': 'images/product2.jpg'},
    {'name': 'Panadol', 'image': 'images/product2.jpg'},
    {'name': 'Panadol', 'image': 'images/product2.jpg'},
  ];
  int selectedIndex = 0;
 
getData(index) async{
  print("the index is ${index}");
     String? token = await getToken();
     Response response = await get(
     Uri.parse('http://127.0.0.1:8000/api/warehouses/$index'),
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer ${token}"
      },
    );
    print("index : ${index}");
    if (response.statusCode == 200) {
      print('products : ${response.body}');
      setState(() {});
    }
  }
  @override
  Widget build(BuildContext context) {
    StoreConnector<AppState, dynamic>(
      converter: (store) => store.state.index,
      builder: (context, index) {
        return getData(index);});
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
                                            delegate: CustomSearch())
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
                    itemCount:20,
                    // itemCount: data['categories'].length!,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {},
                        child: Container(
                          margin: EdgeInsets.only(right: 10),
                          padding: EdgeInsets.all(10),
                          width: 175,
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
                              Text("${catNameAndImage[index]['name']}",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20)),
                            ],
                          ),
                        ),
                      );
                    },
                    )
        ),
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
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            '/item',
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
                                "Product Name",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                "120\$",
                                style: TextStyle(
                                    color: Colors.redAccent,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                )
              ],
            ),
          );
        }
      
    
  }


class CustomSearch extends SearchDelegate {
  List username = [
    "mohh",
    "shady",
    "mohannd",
    "mootaz",
    "kenan",
    "kamal",
    "laith",
    "omar",
    "moafaq",
    "hamza"
  ];
  List? firstChar;

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.arrow_forward_outlined),
        onPressed: () {
          close(context, ());
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
        itemCount: username.length,
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
                              "${username[index]}",
                              style: TextStyle(
                                  fontSize: 25, fontWeight: FontWeight.bold),
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
      firstChar = username.where((element) => element.contains(query)).toList();
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
                                  fontSize: 25, fontWeight: FontWeight.bold),
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
