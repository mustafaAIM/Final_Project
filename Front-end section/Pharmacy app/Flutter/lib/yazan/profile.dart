import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter1/main.dart';
import 'package:flutter1/yazan/login.dart';
import 'package:flutter_locales/flutter_locales.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';
// ignore_for_file: prefer_const_constructors

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool isNotificationsEnabled = false;
  int selectIndex = 0;
  List<String> localCodes = [
    "en",
    "ar",
  ];

  Future<void> initializePreferences() async {
    var prefs = await SharedPreferences.getInstance();
    // Do any necessary initialization with SharedPreferences here.
  }

  @override
  void initState() {
    super.initState();
    initializePreferences();
  }

  void logout(context) async {
    String? token = await getToken();
    Response response = await post(
      Uri.parse('http://127.0.0.1:8000/api/logout'),
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer ${token}"
      },
    );
    if (response.statusCode == 200) {
      saveToken("");
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (BuildContext context) => Loginpage()),
        (route) => false,
      );
    }
  }

  String username ='';
  String phone='';
  String city='';
  String gender='';
  String created_at='';
  int userId = 0;
  Future<void> getData() async {
    String? token = await getToken();
      final response = await get(Uri.parse('http://127.0.0.1:8000/api/profile'),
          headers: {
            "Content-Type": "application/json",
            "Authorization": "Bearer ${token}"
          });
      print(response.body);
      if (response.statusCode == 200) {
        List data = jsonDecode(response.body);
        setState(() {
          loading = false;
          username=data[0]['username'];
          print(username);
          phone=data[0]['phone'];
          city=data[0]['city'];
          gender=data[0]['gender'];
          created_at=data[0]['created_at'].substring(0,10);
          userId=data[0]['user_id'];
          });
      }
  }

  bool loading = true;

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
              backgroundColor: Color.fromARGB(255, 242, 242, 242),
              appBar: AppBar(
                title: LocaleText('Profile'),
                centerTitle: true,
                backgroundColor: Colors.blue[800],
                elevation: 0,
                titleTextStyle: TextStyle(color: Colors.white, fontSize: 20),
                leading: IconButton(
                  icon: Icon(Icons.arrow_back),
                  color: Colors.white, // Change the color to blue
                  // onPressed: () => Navigator.of(context).pop(),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
              body: Column(children: [
                // Banner image
                Image.asset(
                  'images/banner.jpg',
                  height: 130,
                  width: double
                      .infinity, // This will make the image take the full width of the screen
                  fit: BoxFit.fill,
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 35,
                      ),
                      // Profile picture
                      Center(
                        child: CircleAvatar(
                          radius: 50,
                          backgroundImage: AssetImage('images/avatar.png'),
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),

                      Center(
                          child: Text(
                        '${username}',
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.w700),
                      )),
                      // Account information
                      SizedBox(
                        height: 30,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              LocaleText(
                                'account',
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w400),
                              ),
                              Text(
                                 ": ${userId}",
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w400),
                              )
                            ],
                          ),
                          Row(
                            children: [
                              LocaleText('phone',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400)),
                              Text(": ${phone}",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400))
                            ],
                          ),
                          Row(
                            children: [
                              LocaleText('date',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400)),
                              Text(': ${created_at}',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400)),
                            ],
                          ),
                          Row(
                            children: [
                              LocaleText('city',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400)),
                              Text(': ${city}',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400)),
                            ],
                          ),
                          // Notifications toggle switch
                        ],
                      ),
                      SwitchListTile(
                        contentPadding: EdgeInsets.only(bottom: 30),
                        activeColor: Colors.blue,
                        title: LocaleText('Notifications'),
                        value: isNotificationsEnabled,
                        onChanged: (value) {
                          setState(() {
                            isNotificationsEnabled = value;
                          });
                        },
                      ),

                      // Edit profile button
                      Container(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            if (selectIndex == 0) {
                              setState(() {
                                selectIndex = 1;
                              });
                              Locales.change(context, localCodes[selectIndex]);
                            } else {
                              setState(() {
                                selectIndex = 0;
                              });
                              Locales.change(context, localCodes[selectIndex]);
                            }

                            // Locales.change(context, localCodes[0]);
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Color.fromARGB(255, 12, 53, 106),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 50, vertical: 20),
                              textStyle:
                                  TextStyle(fontWeight: FontWeight.bold)),
                          child: Text(
                            "Language: English / اللغة: العربية",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),

                      // Logout button
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.only(top: 10),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Color.fromARGB(255, 238, 16, 16),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 50, vertical: 20),
                              textStyle:
                                  TextStyle(fontWeight: FontWeight.bold)),
                          onPressed: () {
                            logout(context);
                          },
                          child: LocaleText('Logout',
                              style: TextStyle(color: Colors.white)),
                        ),
                      ),
                    ],
                  ),
                )
              ]),
            );
          }
        });
  }
}
