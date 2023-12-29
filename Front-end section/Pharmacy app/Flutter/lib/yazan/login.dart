// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter1/main.dart';
import 'package:flutter_locales/flutter_locales.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:redux/redux.dart';

void main() {
  runApp(MaterialApp(
    theme: ThemeData(primaryColor: const Color.fromARGB(255, 93, 108, 133)),
    debugShowCheckedModeBanner: false,
    home: Loginpage(),
  ));
}

class Loginpage extends StatefulWidget {
  const Loginpage({super.key});

  @override
  State<Loginpage> createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  String phone = "";
  String password = "";

  bool _obscureText = true;
  @override
  Widget build(BuildContext context) {
    Map Logindetails = {'phone': "$phone", 'password': '$password'};
    return Scaffold(
        body: SingleChildScrollView(
            child: Container(
      padding: EdgeInsets.only(top: 25),
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
            Color.fromARGB(255, 0, 194, 255),
            Color.fromARGB(255, 173, 0, 255),
          ])),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            'images/logo.png',
            height: 150,
            width: 150,
          ),
          SizedBox(
            height: 30,
          ),
          Container(
            height: 560,
            width: 325,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(10)),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 30,
                  ),
                  LocaleText(
                    "welcome",
                    style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  LocaleText(
                    'your',
                    style: TextStyle(fontSize: 15),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: 250,
                    child: TextField(
                      onChanged: (value) {
                        setState(() {
                          phone = value;
                        });
                      },
                      decoration: InputDecoration(
                        labelText: "Phone number",
                        labelStyle: TextStyle(color: Colors.black),
                        suffixIcon: Icon(
                          FontAwesomeIcons.phone,
                          size: 17,
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromARGB(255, 18, 40, 233)),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.purple),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: 250,
                    child: TextField(
                      onChanged: (value) {
                        setState(() {
                          password = value;
                        });
                      },
                      obscureText: _obscureText,
                      decoration: InputDecoration(
                        labelText: "password",
                        labelStyle: TextStyle(color: Colors.black),
                        suffixIcon: IconButton(
                          icon: Icon(
                            _obscureText
                                ? FontAwesomeIcons.eyeSlash
                                : FontAwesomeIcons.eye,
                            size: 17,
                          ),
                          onPressed: () {
                            setState(() {
                              _obscureText = !_obscureText;
                            });
                          },
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromARGB(255, 18, 40, 233)),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.purple),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(20, 20, 40, 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        LocaleText(
                          "forgot",
                          style: TextStyle(
                              color: Color.fromARGB(255, 18, 40, 233),
                              fontWeight: FontWeight.w600),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  StoreConnector<AppState, void Function()>(
                      converter: (Store<AppState> store) {
                    return () => store.dispatch(LoginAction(
                        url: 'http://127.0.0.1:8000/api/login-pharmacist/',
                        body: Logindetails));
                  }, builder: (BuildContext context, callback) {
                    return GestureDetector(
                      onTap: () => {
                        callback(),
                        Navigator.pushReplacementNamed(context,'/welcome'),
                      },
                      child: Container(
                        alignment: Alignment.center,
                        width: 250,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            gradient: LinearGradient(
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight,
                                colors: [
                                  Color.fromARGB(148, 0, 40, 249),
                                  Color.fromARGB(135, 125, 0, 145),
                                ])),
                        child: Padding(
                            padding: EdgeInsets.all(12.0),
                            child: LocaleText(
                              'login1',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600),
                            )),
                      ),
                    );
                  }),
                  Divider(
                    color: Colors.blue[600],
                    height: 50,
                    thickness: 2,
                    indent: 20,
                    endIndent: 20,
                  ),
                  LocaleText(
                    "na",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushReplacementNamed(
                        context,
                        '/register',
                      );
                    },
                    child: Container(
                      alignment: Alignment.center,
                      width: 250,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          gradient: LinearGradient(
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                              colors: [
                                Color.fromARGB(148, 0, 40, 249),
                                Color.fromARGB(135, 125, 0, 145),
                              ])),
                      child: Padding(
                          padding: EdgeInsets.all(12.0),
                          child: LocaleText(
                            'register',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontWeight: FontWeight.w600),
                          )),
                    ),
                  ),
                ]),
          )
        ],
      ),
    )));
  }
}
