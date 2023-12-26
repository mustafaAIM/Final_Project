import 'package:flutter/material.dart';
import 'package:flutter_locales/flutter_locales.dart';
import 'package:shared_preferences/shared_preferences.dart';

class test extends StatefulWidget {
  const test({Key? key}) : super(key: key);

  @override
  State<test> createState() => _testState();
}

class _testState extends State<test> {
  List<String> localCodes = [
    "en",
    "ar",
  ];
  int selectIndex = 0;

  Future<void> initializePreferences() async {
    var prefs = await SharedPreferences.getInstance();
    // Do any necessary initialization with SharedPreferences here.
  }

  @override
  void initState() {
    super.initState();
    initializePreferences();
  }

  String name = "mootaz";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: LocaleText("welcome"),
      ),
      body: Column(
        children: [
          MaterialButton(
            onPressed: () {
              if (selectIndex == 0) {
                setState(() {
                  selectIndex = 1;
                });
                Locales.change(context, localCodes[selectIndex]);
              } else {
                setState(() {
                  selectIndex = 0;
                  });
                Locales.change(context, localCodes[selectIndex]);
              }
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
              LocaleText("translate"),
              Text(" : ${name}")
            ],),
            color: Colors.blue,
            textColor: Colors.white,
          ),
          MaterialButton(
            onPressed: () {
              Navigator.pushNamed(
                context,
                '/homePage',
              );
            },
            child: LocaleText("go"),
            color: Colors.blue,
          ),
        ],
      ),
    );
  }
}
