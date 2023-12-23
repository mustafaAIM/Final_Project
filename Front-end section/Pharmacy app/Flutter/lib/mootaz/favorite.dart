import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:flutter1/Mootaz/bottomNav.dart';
class favoritePage extends StatefulWidget {
  const favoritePage({
    super.key,
  });

  @override
  State<favoritePage> createState() => _favoritePageState();
}

class _favoritePageState extends State<favoritePage> {

  int selectedIndex = 0;
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favorites',style: TextStyle(
          fontSize: 35,
          fontWeight: FontWeight.bold
        ),),
        centerTitle: true,
        backgroundColor: Colors.blue[800],
        elevation: 0,
        titleTextStyle: TextStyle(color: Colors.white, fontSize: 20),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: Colors.white, // Change the color to blue
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      // bottomNavigationBar: bottomNav(),
      body: ListView(
        children: [
                Container(
            width: 100,
            padding: EdgeInsets.all(15),
            child: GridView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3, mainAxisExtent: 170,
                  mainAxisSpacing: 8),
              itemCount: 10,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
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