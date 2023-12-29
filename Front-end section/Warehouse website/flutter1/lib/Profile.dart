
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
                                  suffixIcon: IconButton(
                                    icon: Icon(_isEditing[2]
                                        ? Icons.check
                                        : Icons.edit),
                                    onPressed: () {
                                      setState(() {
                                        _isEditing[2] = !_isEditing[2];
                                      });
                                    },
                                  ),
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
                        padding:
                            EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20)),
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
                                  suffixIcon: IconButton(
                                    icon: Icon(_isEditing[0]
                                        ? Icons.check
                                        : Icons.edit),
                                    onPressed: () {
                                      setState(() {
                                        _isEditing[0] = !_isEditing[0];
                                      });
                                    },
                                  ),
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
                                  suffixIcon: IconButton(
                                    icon: Icon(_isEditing[1]
                                        ? Icons.check
                                        : Icons.edit),
                                    onPressed: () {
                                      setState(() {
                                        _isEditing[1] = !_isEditing[1];
                                      });
                                    },
                                  ),
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
                onPressed: () {},
                child: Text(
                  "LOGOUT",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                )),
          )
          //  Container(
          //       width: 750,
          //       height: 50,
          //       padding: EdgeInsets.symmetric(horizontal: 12,vertical: 0),
          //       decoration:
          //           BoxDecoration(color: Colors.white,

          //             border: Border.all(color: Color.fromARGB(255, 74, 74, 74), width: 2),
          //     borderRadius: BorderRadius.circular(20),),
          //       child: Expanded(
          //         // or SizedBox
          //         child: DropdownButton(
          //           underline: SizedBox(),
          //           isExpanded: true,
          //           borderRadius: BorderRadius.circular(12),
          //           dropdownColor: Colors.white,
          //           icon: Icon(Icons.arrow_drop_down),
          //           iconSize: 30,
          //           style: TextStyle(
          //               color: Colors.black,
          //               fontSize: 15,
          //               fontWeight: FontWeight.bold),
          //           hint: Text("Language"),
          //           onChanged: (value) {
          //             setState(() => selectedLanguage = value as String?);
          //           },
          //           value: selectedLanguage,
          //           items: LangList.map((e) {
          //             return DropdownMenuItem(
          //               value: e,
          //               child: Text("$e"),
          //             );
          //           }).toList(),
          //         ),
          //       )),
        ],
      ),
    )));
  }
}