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