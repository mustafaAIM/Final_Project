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
        body: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Container(
            padding: EdgeInsets.all(16),
            height: MediaQuery.of(context).size.height * .75,
            width: MediaQuery.of(context).size.width * .60,
            decoration: BoxDecoration(
                color: Color.fromARGB(255, 186, 187, 188),
                borderRadius: BorderRadius.circular(12)),
            child: Column(children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    padding: EdgeInsets.only(top: 10),
                    width: 125,
                    height: 125,
                    child: CircleAvatar(
                      radius: 150,
                      backgroundImage: AssetImage(
                        "images/photo_2023-11-26_07-18-25.jpg",
                      ),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 230,
                            height: 50,
                            decoration: BoxDecoration(
                              // border: Border.all(color: Colors.black, width: 2),
                              borderRadius: BorderRadius.circular(12),
                            ),
                        child: Expanded(
                          child: TextField(
                            style: TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                              hintText: 'John Doe',
                              suffixIcon: Icon(Icons.edit),
                              hintStyle:
                                  TextStyle(color: Colors.black),
                              filled: true,
                              fillColor: const Color.fromARGB(255, 171, 171, 171),
                              border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(12)),
                                  borderSide: BorderSide(color: Colors.black)),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                     Container(
                      padding: EdgeInsets.only(left: 20),
                      child:  Text("Ryan@Aministrator.com  -  Administrator"),
                     )
                    ],
                  )
                ],
              ),
              SizedBox(height: 30,),
               Container(
                        width: 450,
                            height: 35,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.black, width: 2),
                              borderRadius: BorderRadius.circular(20),
                            ),
                        child: Expanded(
                          child: TextField(
                            style: TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                              hintText: 'Email: Ryan@administrator.com',
                              contentPadding: EdgeInsets.all(10),
                              suffixIcon: Icon(Icons.edit),
                              hintStyle:
                                  TextStyle(color: Colors.black),
                              filled: true,
                              fillColor: const Color.fromARGB(255, 171, 171, 171),
                              border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20)),
                                  borderSide: BorderSide(color: Colors.black)),
                            ),
                          ),
                        ),
                      ),
              SizedBox(height: 10,),
               Container(
                        width: 450,
                            height: 35,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.black, width: 2),
                              borderRadius: BorderRadius.circular(20),
                            ),
                        child: Expanded(
                          child: TextField(
                            style: TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                              hintText: 'City: Damascus',
                              contentPadding: EdgeInsets.all(10),
                              suffixIcon: Icon(Icons.edit),
                              hintStyle:
                                  TextStyle(color: Colors.black),
                              filled: true,
                              fillColor: const Color.fromARGB(255, 171, 171, 171),
                              border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20)),
                                  borderSide: BorderSide(color: Colors.black)),
                            ),
                          ),
                        ),
                      ),
              SizedBox(height: 10,),
               Container(
                        width: 450,
                            height: 35,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.black, width: 2),
                              borderRadius: BorderRadius.circular(20),
                            ),
                        child: Expanded(
                          child: TextField(
                            style: TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                              hintText: 'Passowrd: ***********',
                              contentPadding: EdgeInsets.all(10),
                              suffixIcon: Icon(Icons.edit),
                              hintStyle:
                                  TextStyle(color: Colors.black),
                              filled: true,
                              fillColor: const Color.fromARGB(255, 171, 171, 171),
                              border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20)),
                                  borderSide: BorderSide(color: Colors.black)),
                            ),
                          ),
                        ),
                      ),
              SizedBox(height: 10,),
               Container(
                        width: 450,
                            height: 35,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.black, width: 2),
                              borderRadius: BorderRadius.circular(20),
                            ),
                        child: Expanded(
                          child: TextField(
                            style: TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                              hintText: 'Title: Administrator',
                              contentPadding: EdgeInsets.all(10),
                              suffixIcon: Icon(Icons.edit),
                              hintStyle:
                                  TextStyle(color: Colors.black),
                              filled: true,
                              fillColor: const Color.fromARGB(255, 171, 171, 171),
                              border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20)),
                                  borderSide: BorderSide(color: Colors.black)),
                            ),
                          ),
                        ),
                      ),
              SizedBox(height: 10,),
               Container(
                        width: 450,
                            height: 35,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.black, width: 2),
                              borderRadius: BorderRadius.circular(20),
                            ),
                        child: Expanded(
                          child: TextField(
                            style: TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                              hintText: 'Phone Number: 0922334455',
                              contentPadding: EdgeInsets.all(10),
                              suffixIcon: Icon(Icons.edit),
                              hintStyle:
                                  TextStyle(color: Colors.black),
                              filled: true,
                              fillColor: const Color.fromARGB(255, 171, 171, 171),
                              border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20)),
                                  borderSide: BorderSide(color: Colors.black)),
                            ),
                          ),
                        ),
                      ),
              SizedBox(height: 10,),
               Container(
                padding: EdgeInsets.only(left: 10,right: 10,),
                 width: 450,
                            height: 35,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.black, width: 2),
                              borderRadius: BorderRadius.circular(20),
                              color:const Color.fromARGB(255, 171, 171, 171) 
                            ),
                 child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children: [
                    Text("Language :",style: TextStyle(fontSize: 17,color: Colors.black),),
                     Container(
                                    width: 230,
                                    height: 50,
                                    padding: EdgeInsets.only(left: 12),
                                    decoration: BoxDecoration(
                                        border:
                                            Border.all(color: Colors.black, width: 2),
                                        borderRadius: BorderRadius.circular(20),
                                        color: Color.fromARGB(255, 217, 217, 217)),
                                    child: Expanded(
                                      // or SizedBox
                                      child: DropdownButton(
                                        underline: SizedBox(),
                                        isExpanded: true,
                                        borderRadius: BorderRadius.circular(12),
                                        dropdownColor:
                                            Color.fromARGB(255, 217, 217, 217),
                                        icon: Icon(Icons.arrow_drop_down),
                                        iconSize: 30,
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold),
                                        hint: Text("Language"),
                                        onChanged: (value) {
                                          setState(() =>
                                              selectedLanguage = value as String?);
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
               )


            ]))
      ])
    ]));
  }
}
