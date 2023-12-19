import 'package:flutter/material.dart';

class homePage extends StatefulWidget {
  const homePage({super.key,});

  @override
 State<homePage>  createState() => _homePageState();
}

class _homePageState extends State<homePage> {
 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
         body: ListView(
          children: [
           Container(
              padding: EdgeInsets.only(left: 15,right: 15,top: 15,bottom: 10),
              decoration:const BoxDecoration(
                color:  Colors.black,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(25),
                  bottomRight: Radius.circular(25))
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset("images/Logo.jpg",
                      width: 50,
                      height: 50,)
                    ],
                  )
                ],
              ),
            ),
            
          ],
        ),
        );
  }
}
