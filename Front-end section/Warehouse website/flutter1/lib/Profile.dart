import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter1/login.dart';
import 'package:flutter1/main.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

class profilePage extends StatefulWidget {
  const profilePage({
    super.key,
  });

  @override
  State<profilePage> createState() => _profilePageState();
}

void logout(context) async {
  String? token = await getToken();
  Response response = await post(
    Uri.parse('http://127.0.0.1:8000/api/logout-warehouse'),
    headers: {
      "Content-Type": "application/json",
      "Authorization": "Bearer ${token}"
    },
  );
  if (response.statusCode == 200) {
    saveToken("");
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (BuildContext context) => Loginpage()),
      (route) => false,
    );
  }
}

class _profilePageState extends State<profilePage> {
  String dropdownValue = "sfasf";
  List details = [
    "Warehouse name",
    "Phone Number",
    "Username",
  ];
  List apidetails = [
    "albarka",
    "035452424524",
    'yazan',
  ];
  String? selectedLanguage;
  List LangList = [
    'English',
    'Arabic',
  ];
  late List<TextEditingController> _controllers = List.generate(
      3, (index) => TextEditingController(text: "${apidetails[index]}"));
  List<bool> _isEditing = List.generate(3, (index) => false);

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
              Column(children: [
                    Container(
                      width: 300,
                        padding:
                            EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20)),
                        child: Row(
                          children: [
                            Text(
                              "${details[0]}: ",
                              style: TextStyle(fontSize: 16),
                            ),
                            Expanded(
                              child: TextField(
                                controller: _controllers[2],
                                readOnly: !_isEditing[2],
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  focusedBorder: InputBorder.none,
                                  enabledBorder: InputBorder.none,
                                  errorBorder: InputBorder.none,
                                  disabledBorder: InputBorder.none,
                                  suffixIcon:  Icon(Icons.edit),
                                  ),
                                ),
                              ),
                          ],
                        )),
                    SizedBox(
                      height: 15,
                    )
                  ]),
            ],
          ),
          SizedBox(
            height: 30,
          ),
          Container(
              padding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(20)),
              width: 1000,
              child: DropdownButton<String>(
                underline: SizedBox(),
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
                    fontWeight: FontWeight.w500,
                    color: Colors.black),
                onChanged: (String? newValue) => {
                  setState(() {
                    dropdownValue = newValue!;
                  })
                },
                items: <String>[
                  "sfasf",
                  "sfs",
                  "sfadf",
                  "sfasdf",
                ].map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              )),
          SizedBox(
            height: 10,
          ),
          Column(children: [
                    Container(
                        padding:
                            EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20)),
                        child: Row(
                          children: [
                            Text(
                              "${details[0]}: ",
                              style: TextStyle(fontSize: 16),
                            ),
                            Expanded(
                              child: TextField(
                                controller: _controllers[0],
                                readOnly: !_isEditing[0],
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  focusedBorder: InputBorder.none,
                                  enabledBorder: InputBorder.none,
                                  errorBorder: InputBorder.none,
                                  disabledBorder: InputBorder.none,
                                  suffixIcon:  Icon(Icons.edit),
                                ),
                              ),
                            ),
                          ],
                        )),
                    SizedBox(
                      height: 15,
                    )
                  ]),
          Column(children: [
                    Container(
                        padding:
                            EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20)),
                        child: Row(
                          children: [
                            Text(
                              "${details[1]}: ",
                              style: TextStyle(fontSize: 16),
                            ),
                            Expanded(
                              child: TextField(
                                controller: _controllers[1],
                                readOnly: !_isEditing[1],
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  focusedBorder: InputBorder.none,
                                  enabledBorder: InputBorder.none,
                                  errorBorder: InputBorder.none,
                                  disabledBorder: InputBorder.none,
                                  suffixIcon:  Icon(Icons.edit),
                                ),
                              ),
                            ),
                          ],
                        )),
                    SizedBox(
                      height: 50,
                    )
                  ]),
        
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Color.fromARGB(255, 222, 69, 41)),
            child: MaterialButton(
                padding: EdgeInsets.symmetric(horizontal: 300, vertical: 20),
                onPressed: () {
                  logout(context);
                },
                child: Text(
                  "LOGOUT",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                )),
          )
        ],
      ),
    )));
  }
}
