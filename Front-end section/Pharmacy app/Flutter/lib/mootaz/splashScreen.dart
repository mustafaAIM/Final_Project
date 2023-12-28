import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_locales/flutter_locales.dart';

class splashPage extends StatefulWidget {
  const splashPage({super.key});

  @override
  State<splashPage> createState() => _splashPageState();
}

class _splashPageState extends State<splashPage> 
    with SingleTickerProviderStateMixin{
 
  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    Future.delayed(Duration(seconds: 2),() {
      Navigator.pushNamed(context, "/login");
    },);
  }
  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
    overlays: SystemUiOverlay.values);
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
             Color.fromARGB(148, 0, 40, 249),
             Color.fromARGB(135, 125, 0, 145),
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter
          )
        ),
        child:Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
             Image.asset("images/logo.png",width: 300,height: 300,),
             Row(
              mainAxisAlignment: MainAxisAlignment.center,
               children: [
                 Text("AIO ",style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.white
                 ),),
                 LocaleText("team",style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.white
                 ),),
               ],
             )
          ]),
        ),
    );
  }
}