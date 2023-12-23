import 'package:flutter/material.dart';
import 'package:flutter1/Mootaz/bottomNav.dart';

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

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Container(
            height: 300,
            color: Colors.white,
            child: Stack(
              children: [
                Container(
                  // height: 250,
                  padding:
                      EdgeInsets.only(left: 15, right: 15, top: 15, bottom: 10),
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
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        width: 350,
                        height: 55,
                        child: TextField(
                          style: TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                            hintText: 'Search',
                            prefixIcon: Icon(
                              Icons.search,
                              color: Colors.black.withOpacity(0.4),
                            ),
                            hintStyle:
                                TextStyle(color: Colors.black.withOpacity(0.4)),
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(200)),
                                borderSide: BorderSide(color: Colors.white)),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 100,
                      )
                    ],
                  ),
                ),
                Positioned(
                    top: 150,
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
                Text("Category",
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
                  child: Text(
                    "See More",
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
              itemCount: catNameAndImage.length,
              itemBuilder: (context, index) {
                return Container(
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
                              fontWeight: FontWeight.bold, fontSize: 20)),
                    ],
                  ),
                );
              },
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            padding: EdgeInsets.only(left: 25),
            child: Text(
              "Recommend for you",
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