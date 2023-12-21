import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
// ignore_for_file: prefer_const_constructors

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool isNotificationsEnabled = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 242, 242, 242),
        appBar: AppBar(
          title: Text('Profile'),
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
                  'Yazan Alhalil',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.w700),
                )),
                // Account information
                SizedBox(
                  height: 30,
                ),
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Account number: #1234567890',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                    ),
                    Text('Phone number: 123-456-7890',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w400)),
                    Text('Date created: 2023-12-20',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w400)),
                    // Notifications toggle switch
                  ],
                ),
                SwitchListTile(
                  contentPadding: EdgeInsets.only(bottom: 30),
                  activeColor: Colors.blue,
                  title: Text('Notifications'),
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
                      // TODO: Navigate to edit profile screen
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromARGB(255, 12, 53, 106),
                        padding:
                            EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                        textStyle: TextStyle(fontWeight: FontWeight.bold)),
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
                        padding:
                            EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                        textStyle: TextStyle(fontWeight: FontWeight.bold)),
                    onPressed: () {
                      // TODO: Logout the user
                    },
                    child:
                        Text('Logout', style: TextStyle(color: Colors.white)),
                  ),
                ),
              ],
            ),
          )
        ]),
      );
  }
}
