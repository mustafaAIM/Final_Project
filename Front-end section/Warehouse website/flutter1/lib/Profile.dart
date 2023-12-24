import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class profilePage extends StatefulWidget {
  const profilePage({
    super.key,
  });

  @override
  State<profilePage> createState() => _profilePageState();
}

class _profilePageState extends State<profilePage> {
  String? selectedLanguage;
  List LangList = [
    'English',
    'Arabic',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Container(
      padding: EdgeInsets.symmetric(horizontal: 50, vertical: 10),
      height: MediaQuery.of(context).size.height * .75,
      width: MediaQuery.of(context).size.width * .60,
      decoration: BoxDecoration(
          color: Color.fromARGB(255, 186, 187, 188),
          borderRadius: BorderRadius.circular(12)),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.only(right: 30),
                padding: EdgeInsets.only(top: 10),
                width: 200,
                height: 200,
                child: CircleAvatar(
                  radius: 150,
                  backgroundImage: AssetImage(
                    "images/photo_2023-11-26_07-18-25.jpg",
                  ),
                ),
              ),
              Column(
                children: [
                  Container(
                    width: 450,
                    height: 50,
                    decoration: BoxDecoration(
                      // border: Border.all(color: Colors.black, width: 2),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Expanded(
                      child: TextField(
                        style: TextStyle(color: Colors.black),
                        decoration: InputDecoration(
                          hintText: 'John Doe',
                          suffixIcon: Icon(Icons.edit),
                          hintStyle: TextStyle(color: Colors.black),
                          filled: true,
                          fillColor:  Colors.white,
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(12)),
                              ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 20),
                    child: Text("Ryan@Aministrator.com  -  Administrator"),
                  )
                ],
              )
            ],
          ),
          SizedBox(
            height: 30,
          ),
          Container(
            width: 750,
            height: 40,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black, width: 1),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Expanded(
              child: TextField(
                style: TextStyle(color: Colors.black),
                decoration: InputDecoration(
                  hintText: 'Email: Ryan@administrator.com',
                  contentPadding: EdgeInsets.all(10),
                  suffixIcon: Icon(Icons.edit),
                  hintStyle: TextStyle(color: Colors.black),
                  filled: true,
                  fillColor:  Colors.white,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            width: 750,
            height: 40,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black, width: 1),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Expanded(
              child: TextField(
                style: TextStyle(color: Colors.black),
                decoration: InputDecoration(
                  hintText: 'City: Damascus',
                  contentPadding: EdgeInsets.all(10),
                  suffixIcon: Icon(Icons.edit),
                  hintStyle: TextStyle(color: Colors.black),
                  filled: true,
                  fillColor:  Colors.white,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            width: 750,
            height: 40,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black, width: 1),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Expanded(
              child: TextField(
                style: TextStyle(color: Colors.black),
                decoration: InputDecoration(
                  hintText: 'Passowrd: ***********',
                  contentPadding: EdgeInsets.all(10),
                  suffixIcon: Icon(Icons.edit),
                  hintStyle: TextStyle(color: Colors.black),
                  filled: true,
                  fillColor:  Colors.white,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            width: 750,
            height: 40,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black, width: 1),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Expanded(
              child: TextField(
                style: TextStyle(color: Colors.black),
                decoration: InputDecoration(
                  hintText: 'Warehouse name: elbarka',
                  contentPadding: EdgeInsets.all(10),
                  suffixIcon: Icon(Icons.edit),
                  hintStyle: TextStyle(color: Colors.black),
                  filled: true,
                  fillColor:  Colors.white,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            width: 750,
            height: 40,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black, width: 1),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Expanded(
              child: TextField(
                style: TextStyle(color: Colors.black),
                decoration: InputDecoration(
                  hintText: 'Phone Number: 0922334455',
                  contentPadding: EdgeInsets.all(10),
                  suffixIcon: Icon(Icons.edit),
                  hintStyle: TextStyle(color: Colors.black),
                  filled: true,
                  fillColor:  Colors.white,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
           Container(
                width: 750,
                height: 50,
                padding: EdgeInsets.symmetric(horizontal: 12,vertical: 0),
                decoration:
                    BoxDecoration(color: Colors.white,
                    
                      border: Border.all(color: Color.fromARGB(255, 74, 74, 74), width: 2),
              borderRadius: BorderRadius.circular(20),),
                child: Expanded(
                  // or SizedBox
                  child: DropdownButton(  
                    underline: SizedBox(),
                    isExpanded: true,
                    borderRadius: BorderRadius.circular(12),
                    dropdownColor: Colors.white,
                    icon: Icon(Icons.arrow_drop_down),
                    iconSize: 30,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                    hint: Text("Language"),
                    onChanged: (value) {
                      setState(() => selectedLanguage = value as String?);
                    },
                    value: selectedLanguage,
                    items: LangList.map((e) {
                      return DropdownMenuItem(
                        value: e,
                        child: Text("$e"),
                      );
                    }).toList(),
                  ),
                )),
          
        ],
      ),
    )));
  }
}
