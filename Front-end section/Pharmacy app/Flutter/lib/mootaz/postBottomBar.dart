import 'package:flutter/material.dart';
import 'package:flutter1/Mootaz/bottomNav.dart';
import 'package:flutter_locales/flutter_locales.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class postBottomBar extends StatefulWidget {
  const postBottomBar({
    super.key,
  });

  @override
  State<postBottomBar> createState() => _postBottomBarState();
}

class _postBottomBarState extends State<postBottomBar> {

  int selectedIndex = 0;
  String dropdownValue = '2020-1-2. Q: 20';
 
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height/2,
      padding: EdgeInsets.only(top: 20,left: 20,right: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(topLeft: Radius.circular(40),topRight: Radius.circular(40))
      ),
      child: ListView(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      LocaleText("scientific",
                      style: TextStyle(fontSize: 21,fontWeight: FontWeight.bold),)
                      ,Text(" : Panadol",
                      style: TextStyle(fontSize: 21,fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Text("200\$",
                  style: TextStyle(fontSize: 21,fontWeight: FontWeight.bold,color: Colors.amberAccent),)
                ],
              ),
              SizedBox(height: 10,),
             Row(children: [
               LocaleText("comercial",style: TextStyle(fontSize: 21,fontWeight: FontWeight.bold),)
               ,Text(":",style: TextStyle(fontSize: 21,fontWeight: FontWeight.bold),)
              
             ],)
             ,SizedBox(height: 10,),
             Row(children: [
               LocaleText("category",style: TextStyle(fontSize: 21,fontWeight: FontWeight.bold),)
               ,Text(": ",style: TextStyle(fontSize: 21,fontWeight: FontWeight.bold),)
              
             ],)
             ,SizedBox(height: 10,),
              Row(children: [
                LocaleText("manufacturing",style: TextStyle(fontSize: 21,fontWeight: FontWeight.bold),)
                ,Text(": ",style: TextStyle(fontSize: 21,fontWeight: FontWeight.bold),)
              
              ],)
              ,SizedBox(height: 10,),
              Row(children: [
                LocaleText("available",style: TextStyle(fontSize: 21,fontWeight: FontWeight.bold),)
                ,Text(": ",style: TextStyle(fontSize: 21,fontWeight: FontWeight.bold),)
              
              ],)
              ,SizedBox(height: 10,),
              Row(children: [
                LocaleText("earliest",style: TextStyle(fontSize: 21,fontWeight: FontWeight.bold),)
                ,Text(": ",style: TextStyle(fontSize: 21,fontWeight: FontWeight.bold),)
                , Container(
                  width: 210,
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
                              fontSize: 19,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                          underline: SizedBox(),
                          onChanged: (String? newValue) => {
                            // setState(() {
                            //   dropdownValue = newValue!;
                            // })
                          },
                          items: <String>[
                            "2020-1-2. Q: 20",
                            "2010-3-30. Q: 20",
                            "2010-4-3. Q: 20",
                            "2010-6-1. Q: 20",
                          ].map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              enabled: false,
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                )
              ],)
              ,SizedBox(height: 10,),
              Row(children: [
                LocaleText("warehouse",style: TextStyle(fontSize: 21,fontWeight: FontWeight.bold),)
                ,Text(": ",style: TextStyle(fontSize: 21,fontWeight: FontWeight.bold),)

              ],),
              SizedBox(height: 25,),
              ClipRRect(
                borderRadius: BorderRadius.circular(60),
                child: MaterialButton(onPressed: () {
                
              },
              child: LocaleText("add",style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),),
              color: const Color.fromARGB(255, 3, 58, 103),
              textColor: Colors.white,
              height: 60,
              minWidth: 300,
              elevation: 8,
              ),
              )
            ],
          )
        ],
      ),
    );
  }
}