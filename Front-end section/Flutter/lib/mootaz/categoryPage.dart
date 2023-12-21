import 'package:flutter/material.dart';

class categoryPage extends StatefulWidget {
  const categoryPage({
    super.key,
  });

  @override
  State<categoryPage> createState() => _categoryPageState();
}

class _categoryPageState extends State<categoryPage> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(children: [
      Stack(
        children: [
          Container(
            padding: EdgeInsets.only(left: 15, right: 15, top: 15, bottom: 10),
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
                          icon:
                              Icon(Icons.star, color: Colors.yellow, size: 35),
                          onPressed: () => {},
                        ),
                        IconButton(
                          icon: Icon(
                            Icons.account_circle,
                            size: 35,
                          ),
                          onPressed: () => {},
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
                          borderRadius: BorderRadius.all(Radius.circular(200)),
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
              child: Image.asset(
                "images/background.jpg",
                width: 300,
                height: 250,
              ))
        ],
      ),
      SizedBox(
        height: 10,
      ),
      Container(
        padding: EdgeInsets.all(15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
          Text(
          "All Category",
          style: TextStyle(
            fontSize: 23,
            fontWeight: FontWeight.bold,
          ),
        ),
        IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        )
        ],)
      ),
       Container(
              width: 100,
              padding: EdgeInsets.all(15),
              child: GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                     mainAxisExtent: 130,
                     crossAxisSpacing: 8,
                     mainAxisSpacing: 8
                     ),
                itemCount: 20,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {},
                    child:  Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: const Color.fromARGB(255, 218, 218, 218),
                        border: Border.all(
                          color: Colors.black,
                          width: 2
                          )
                      ),
                      child: Column(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(50),
                            child: Image.asset("images/product2.jpg",
                            width: 75,
                            height: 75,
                            ),
                          ),
                          SizedBox(height: 4,),
                          Text("hearty",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold
                          ),
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
            )
    ]),
     bottomNavigationBar: Theme(
          data: Theme.of(context).copyWith(
            canvasColor: Colors.blue, // Change this line
          ),
          child: BottomNavigationBar(
            // onTap: _onItemTapped,
            onTap: (value) {
              setState(() {
                currentIndex = value;
              });
            },
            currentIndex: currentIndex,
            selectedItemColor: Colors.white,
            // selectedFontSize: 20,
            unselectedItemColor: Colors.black,
            selectedLabelStyle: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold),
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.shopping_cart), label: 'Category'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.receipt_long), label: 'notifications'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.bookmark), label: 'BookMark'),
            ],
          
          ),
        ),
    );
  }
}