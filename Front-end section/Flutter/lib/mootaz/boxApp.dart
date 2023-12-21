import 'package:flutter/material.dart';
import 'package:flutter1/Mootaz/bottomNav.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class boxApp extends StatefulWidget {
  const boxApp({
    super.key,
  });

  @override
  State<boxApp> createState() => _boxAppState();
}

class _boxAppState extends State<boxApp> {

 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //  bottomNavigationBar: bottomNav(),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              onTap: () {
                Navigator.pushNamed(
                        context,
                        '/homePage',
                      );
              },
              child: Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black,
                      blurRadius: 6,
                    )
                  ]
                ),
                child: Icon(Icons.arrow_back,size: 28,),
              ),
            ),
            InkWell(
              onTap: () {
               
              },
              child: Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black,
                      blurRadius: 6,
                    )
                  ]
                ),
                child: Icon(Icons.star,size: 28,color: Colors.yellow,),
              ),
            )
          ],
        ),
        ),
    );
  }
}