// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter1/main.dart';
import 'package:flutter_locales/flutter_locales.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:redux/redux.dart';

class Registerpage extends StatefulWidget {
  const Registerpage({super.key});

  @override
  State<Registerpage> createState() => _RegisterpageState();
}



class _RegisterpageState extends State<Registerpage> {
  String username = '';
  String password = '';
  String phone = '';

  bool _obscureText = true;
  String dropdownValue = 'Damascus';
  String? gender;
  @override
  Widget build(BuildContext context) {
    Map userDetails = {
      'username': "${username}",
      'phone': "$phone",
      'password': '$password',
      'city': "$dropdownValue",
      "gender": "$gender",
      'type': 'pharmacist',
    };
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
                    "lets",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  LocaleText(
                    'please',
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
                          username = value;
                        });
                      },
                      decoration: InputDecoration(
                        labelText: "User name",
                        labelStyle: TextStyle(color: Colors.black),
                        suffixIcon: Icon(
                          FontAwesomeIcons.user,
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
                      keyboardType: TextInputType.number,
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
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                      width: 250,
                      child: DropdownButton<String>(
                        value: dropdownValue,
                        isExpanded: true,
                        icon: Padding(
                          padding: EdgeInsets.only(right: 10),
                          child: Icon(Icons.arrow_downward),
                        ),
                        iconSize: 24,
                        elevation: 16,
                        style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            color: Color.fromARGB(255, 75, 75, 75)),
                        underline: Container(
                          height: 1,
                          color: Color.fromARGB(255, 18, 40, 233),
                        ),
                        onChanged: (String? newValue) => {
                          setState(() {
                            dropdownValue = newValue!;
                          })
                        },
                        items: <String>[
                          'Damascus',
                          'Aleppo',
                          'Daraa',
                          'Dier el-Zor',
                          'Hama',
                          'Al-Hasakah',
                          'Homs',
                          'Idlib',
                          'Latakia',
                          'Tartus',
                          'Al-Suwayada',
                          'Rif Dimashq',
                          'Raqqa',
                          'Quneitra'
                        ].map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      )),
                  ListTileTheme(
                      horizontalTitleGap: 2,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Expanded(
                            child: RadioListTile<String>(
                              contentPadding: EdgeInsets.only(left: 30),
                              title: LocaleText("male"),
                              value: "male",
                              groupValue: gender,
                              onChanged: (value) {
                                setState(() {
                                  gender = value;
                                });
                              },
                            ),
                          ),
                          Expanded(
                            child: RadioListTile<String>(
                              title: LocaleText("female"),
                              value: "female",
                              groupValue: gender,
                              onChanged: (value) {
                                setState(() {
                                  gender = value;
                                });
                              },
                            ),
                          ),
                        ],
                      )),
                  SizedBox(
                    height: 20,
                  ),
                  StoreConnector<AppState, void Function()>(
                      converter: (Store<AppState> store) {
    return () => store.dispatch(RegisterAction(url: 'http://127.0.0.1:8000/api/register-pharmacist/', body: userDetails));
  },
                      builder: (BuildContext context,callback) {
                        return GestureDetector(
                          onTap: callback,
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
                        );
                      }),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      LocaleText("already"),
                      Padding(
                          padding: EdgeInsets.only(left: 10),
                          child: GestureDetector(
                            child: LocaleText(


"login",
                              style: TextStyle(color: Colors.blue[800]),
                            ),
                            onTap: () => {
                              Navigator.pushReplacementNamed(
                                context,
                                '/login',
                              )
                            },
                          )),
                    ],
                  )
                ]),
          )
        ],
      ),
    )));
  }
}