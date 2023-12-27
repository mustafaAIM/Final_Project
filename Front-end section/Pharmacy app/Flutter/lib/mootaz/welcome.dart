import 'package:flutter/material.dart';
import 'package:flutter_locales/flutter_locales.dart';

class welcomePage extends StatefulWidget {
  const welcomePage({super.key});

  @override
  State<welcomePage> createState() => _welcomePageState();
}

class _welcomePageState extends State<welcomePage> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: [
            Stack(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height / 1.6,
                  decoration: BoxDecoration(color: Colors.white),
                ),
                Container(
                  width: MediaQuery.of(context).size.height,
                  height: MediaQuery.of(context).size.height / 1.6,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.only(bottomRight: Radius.circular(100))
                    ),
                    child: Center(child: Image.asset("images/photowe.png"),),
                )
              ],
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height/2.666,
                  decoration: BoxDecoration(
                    color: Colors.blue
                  ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height/2.666,
                  padding: EdgeInsets.only(top: 30,bottom: 40),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(100))
                  ),
                  child: Column(
                    children: [
                      LocaleText("welcom",style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold
                      ),),
                      SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.only(right: 40,left: 40),
                        child: LocaleText(
                          "thank",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 17,
                            color: Colors.black.withOpacity(0.6)
                          ),
                          ),
                      ),
                      SizedBox(height: 30,),
                      MaterialButton(onPressed: (){
                        Navigator.pushNamed(context, "/home");
                      },
                      child: LocaleText("get",style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        color: Colors.white
                      ),),
                      color: Colors.blue,
                      minWidth: 200,
                      height: 60,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)
                      ),
                      )
                    ],
                  ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
