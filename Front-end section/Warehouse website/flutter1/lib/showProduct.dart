import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter1/main.dart';
import 'package:flutter_redux/flutter_redux.dart';

class showProductPage extends StatefulWidget {
  const showProductPage({
    super.key,
  });

  @override
  State<showProductPage> createState() => _showProductPageState();
}

class _showProductPageState extends State<showProductPage> {
  String dropdownValue = "sfasf";
  String expirationDate = "2020-2-2. Q:2";

  @override
  List details = [
    "Scientific name",
    "Commercial name",
    "Manufacturing company",
    "Available quantity",
    "Price"
  ];
  List apidetails = [
    "panadol",
    "Panadol",
    'phizer',
    '200',
    
    '20\$'
  ];
  List categories = [
    "sfasf",
    "sfs",
    "sfadf",
    "sfasdf",
  ];
  late List<TextEditingController> _controllers = List.generate(
      5, (index) => TextEditingController(text: "${apidetails[index]}"));
  List<bool> _isEditing = List.generate(5, (index) => false);
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.fromLTRB(16, 16, 16, 20),
        height: MediaQuery.of(context).size.height * .75,
        width: MediaQuery.of(context).size.width * .60,
        decoration: BoxDecoration(
            color: Color.fromARGB(255, 185, 186, 193),
            borderRadius: BorderRadius.circular(12)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                    onPressed: () {
                      StoreProvider.of<AppState>(context)
                          .dispatch(NavClickAction(1));
                    },
                    icon: Icon(
                      Icons.close,
                      color: Colors.black,
                    ))
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Expanded(
              child: Column(
                children: [
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
                      height: 15,
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
                              "${details[2]}: ",
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
                  Container(
                        padding:
                            EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20)),
                        width: 1000,
                        child: Theme(
                          data: Theme.of(context).copyWith(
    canvasColor: Colors.white,  
  ),
                          child: DropdownButton<String>(
                            
                            enableFeedback: false,
                             underline: SizedBox(),
                            value: expirationDate,
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
                                
                              })
                            },
                            items: <String>[
                              "2020-2-2. Q:2",
                              "2022-2-4. Q:3",
                              "2003-2-4. Q:5",
                              "2320-34-5. Q:4",
                            ].map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                enabled: false,
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                          ),
                        )),
                        
                    SizedBox(
                      height: 15,
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
                              "${details[3]}: ",
                              style: TextStyle(fontSize: 16),
                            ),
                            Expanded(
                              child: TextField(
                                controller: _controllers[3],
                                readOnly: !_isEditing[3],
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  focusedBorder: InputBorder.none,
                                  enabledBorder: InputBorder.none,
                                  errorBorder: InputBorder.none,
                                  disabledBorder: InputBorder.none,
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
                              "${details[4]}: ",
                              style: TextStyle(fontSize: 16),
                            ),
                            Expanded(
                              child: TextField(
                                controller: _controllers[4],
                                readOnly: !_isEditing[4],
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  focusedBorder: InputBorder.none,
                                  enabledBorder: InputBorder.none,
                                  errorBorder: InputBorder.none,
                                  disabledBorder: InputBorder.none,
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
            ),
            Container(
                width: 540,
                height: 60,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    MaterialButton(
                      onPressed: () {},
                      color: Color.fromARGB(255, 16, 22, 58),
                      height: 100,
                      minWidth: 200,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        "Save",
                        style: TextStyle(
                            fontSize: 19,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    )
                  ],
                ))
          ],
        ));
  }
}
