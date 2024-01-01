import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter1/main.dart';
import 'package:flutter_locales/flutter_locales.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:flutter1/Mootaz/bottomNav.dart';
import 'package:http/http.dart';

class favoritePage extends StatefulWidget {
  const favoritePage({
    super.key,
  });

  @override
  State<favoritePage> createState() => _favoritePageState();
}

List favourites = [{}];
int userId = 0;
class _favoritePageState extends State<favoritePage> {
  void getData() async {
    String? token = await getToken();
    Response response = await get(
      Uri.parse('http://127.0.0.1:8000/api/favorites'),
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer ${token}"
      },
    );
    print(response.body);
    if (response.statusCode == 200) {
      List data = jsonDecode(response.body);
      setState(() {
        loading = false;
        favourites = data;
        print(userId);
        print(favourites);
      });
      
    }
  }
   Future<void> deleteMedicine(int id) async {
    String? token = await getToken();
    print(id);
    try {
      final response = await delete(
        Uri.parse('http://127.0.0.1:8000/api/delete-favorite'),
       headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer ${token}"
      },
        body: jsonEncode({"medicine_id": id}),
      );
      print(response.body);
      if (response.statusCode == 200) {
        // The request was successful
        print('Remove the medicine');
      } else {
        // The request failed
        print('Failed to Remove to favorites');
      }
    } catch (e) {
      // There was an error
      print(e);
    }
  }
  
  int selectedIndex = 0;
  bool loading = true;
  Color iconColor = Colors.yellow;
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, dynamic>(
        converter: (store) => store.state,
        builder: (context, state) {
          if (loading) {
            getData();
            return Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          } else {
            return Scaffold(
              appBar: AppBar(
                title: LocaleText(
                  'Favorites',
                  style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
                ),
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
                          crossAxisCount: 2,
                          mainAxisExtent: 250,
                          mainAxisSpacing: 20,
                          crossAxisSpacing: 20),
                      itemCount: favourites.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {},
                          child: Card(
                            child: Column(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Colors.grey[300],
                                  ),
                                  width: 120,
                                  height: 150,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(20),
                                    child: Image.asset(
                                      "images/medicine.png",
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                    Text(
                                      "${favourites[index]["trading_name"]}",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 17,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    InkWell(
                          onTap: () async {
                           setState(() {
                             deleteMedicine(favourites[index]['id']);
                             getData();
                           });
                           
                          },
                          child: Container(
                            child: Icon(
                              Icons.star,
                              size: 28,
                              color: iconColor,
                            ),
                          ),
                        )
                                  ],
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  "${favourites[index]["price"]}\$",
                                  style: TextStyle(
                                      color: Colors.redAccent,
                                      fontSize: 20,
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
        });
  }
}
