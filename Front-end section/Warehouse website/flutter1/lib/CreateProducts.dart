import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter1/main.dart';
import 'package:flutter_redux/flutter_redux.dart';

class createProductPage extends StatefulWidget {
  const createProductPage({
    super.key,
  });

  @override
  State<createProductPage> createState() => _createProductPageState();
}

class _createProductPageState extends State<createProductPage> {
  String? selectedCategory;
  List CategoryList = [
    'item 1',
    'item 2',
    'item 3',
    'item 4',
    'item 5',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
         children: [
          Container(
              padding: EdgeInsets.all(16),
              height: MediaQuery.of(context).size.height * .75,
              width: MediaQuery.of(context).size.width * .60,
              decoration: BoxDecoration(
                  color: Color.fromARGB(255, 16, 22, 58),
                  borderRadius: BorderRadius.circular(12)),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(
                          onPressed: () {
                            StoreProvider.of<AppState>(context).dispatch(NavClickAction(1));
              
                          },
                          color: Colors.black.withOpacity(0.5),
                          icon: Icon(Icons.close))
                    ],
                  ),
                  Container(
                    // padding: EdgeInsets.all(20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Create new Product",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    padding: EdgeInsets.all(10),
                    width: 540,
                    height: 60,
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                            width: 230,
                            height: 54,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.black, width: 2),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Expanded(
                              // or SizedBox
                              child: TextField(
                                style: TextStyle(color: Colors.white),
                                decoration: InputDecoration(
                                  hintText: 'Scientific name',
                                  
                                  contentPadding: EdgeInsets.all(6),
                                  hintStyle: TextStyle(
                                      color: Colors.black.withOpacity(0.4)),
                                  filled: true,
                                  fillColor: Colors.white,
                                  border: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(12)),
                                      borderSide:
                                          BorderSide(color: Colors.black)),
                                ),
                              ),
                            ),
                          ),
                          Container(
                              width: 230,
                              height: 50,
                              padding: EdgeInsets.only(left: 12),
                              decoration: BoxDecoration(
                                  border:
                                      Border.all(color: Colors.black, width: 2),
                                  borderRadius: BorderRadius.circular(12),
                                  color: Colors.white),
                              child: Expanded(
                                // or SizedBox
                                child: DropdownButton(
                                  underline: SizedBox(),
                                  isExpanded: true,
                                  borderRadius: BorderRadius.circular(12),
                                  dropdownColor:
                                      Color.fromARGB(255, 16, 22, 58),
                                  icon: Icon(Icons.arrow_drop_down),
                                  iconSize: 30,
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 19,
                                      fontWeight: FontWeight.bold),
                                  hint: Text("Category"),
                                  onChanged: (value) {
                                    setState(() =>
                                        selectedCategory = value as String?);
                                  },
                                  value: selectedCategory,
                                  items: CategoryList.map((e) {
                                    return DropdownMenuItem(
                                      value: e,
                                      child: Text("$e"),
                                    );
                                  }).toList(),
                                ),
                              ))
                        ]),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                      padding: EdgeInsets.all(10),
                      width: 540,
                      height: 60,
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                              width: 230,
                              height: 54,
                              decoration: BoxDecoration(
                                border:
                                    Border.all(color: Colors.black, width: 2),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Expanded(
                                // or SizedBox
                                child: TextField(
                                  style: TextStyle(color: Colors.white),
                                  decoration: InputDecoration(
                                    hintText: 'Comercial name',
                                    contentPadding: EdgeInsets.all(6),
                                    hintStyle: TextStyle(
                                        color: Colors.black.withOpacity(0.4)),
                                    filled: true,
                                    fillColor: Colors.white,
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(12)),
                                        borderSide:
                                            BorderSide(color: Colors.black)),
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              width: 230,
                              height: 54,
                              decoration: BoxDecoration(
                                border:
                                    Border.all(color: Colors.black, width: 2),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Expanded(
                                // or SizedBox
                                child: TextField(
                                  style: TextStyle(color: Colors.white),
                                  decoration: InputDecoration(
                                    hintText: 'Manufacturing Company',
                                    contentPadding: EdgeInsets.all(6),
                                    hintStyle: TextStyle(
                                        color: Colors.black.withOpacity(0.4)),
                                    filled: true,
                                    fillColor: Colors.white,
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(12)),
                                        borderSide:
                                            BorderSide(color: Colors.black)),
                                  ),
                                ),
                              ),
                            ),
                          ])),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                      padding: EdgeInsets.all(10),
                      width: 540,
                      height: 60,
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                              width: 230,
                              height: 54,
                              decoration: BoxDecoration(
                                border:
                                    Border.all(color: Colors.black, width: 2),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Expanded(
                                // or SizedBox
                                child: TextField(
                                  style: TextStyle(color: Colors.white),
                                  decoration: InputDecoration(
                                    hintText: 'Available quantity',
                                    contentPadding: EdgeInsets.all(6),
                                    hintStyle: TextStyle(
                                        color: Colors.black.withOpacity(0.4)),
                                    filled: true,
                                    fillColor: Colors.white,
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(12)),
                                        borderSide:
                                            BorderSide(color: Colors.black)),
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              width: 230,
                              height: 54,
                              decoration: BoxDecoration(
                                border:
                                    Border.all(color: Colors.black, width: 2),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Expanded(
                                // or SizedBox
                                child: TextField(
                                  style: TextStyle(color: Colors.white),
                                  decoration: InputDecoration(
                                    hintText: 'Price',
                                    contentPadding: EdgeInsets.all(6),
                                    hintStyle: TextStyle(
                                        color: Colors.black.withOpacity(0.4)),
                                    filled: true,
                                    fillColor: Colors.white,
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(12)),
                                        borderSide:
                                            BorderSide(color: Colors.black)),
                                  ),
                                ),
                              ),
                            ),
                          ])),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                      padding: EdgeInsets.all(10),
                      width: 540,
                      height: 60,
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                              width: 230,
                              height: 54,
                              decoration: BoxDecoration(
                                border:
                                    Border.all(color: Colors.black, width: 2),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Expanded(
                                // or SizedBox
                                child: TextField(
                                  style: TextStyle(color: Colors.white),
                                  decoration: InputDecoration(
                                    hintText: 'Expiration date',
                                    contentPadding: EdgeInsets.all(6),
                                    hintStyle: TextStyle(
                                        color: Colors.black.withOpacity(0.4)),
                                    filled: true,
                                    fillColor: Colors.white,
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(12)),
                                        borderSide:
                                            BorderSide(color: Colors.black)),
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              width: 230,
                              height: 54,
                              decoration: BoxDecoration(
                                border:
                                    Border.all(color: Colors.black, width: 2),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Expanded(
                                // or SizedBox
                                child: TextField(
                                  style: TextStyle(color: Colors.white),
                                  decoration: InputDecoration(
                                    hintText: 'Photo',
                                    contentPadding: EdgeInsets.all(6),
                                    hintStyle: TextStyle(
                                        color: Colors.black.withOpacity(0.4)),
                                    filled: true,
                                    fillColor: Colors.white,
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(12)),
                                        borderSide:
                                            BorderSide(color: Colors.black)),
                                  ),
                                ),
                              ),
                            ),
                          ])),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                      width: 540,
                      height: 60,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          MaterialButton(
                            onPressed: () {},
                            color: Color.fromARGB(255, 222, 69, 41),
                            height: 100,
                            minWidth: 200,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Text(
                              "ADD PRODUCT",
                              style: TextStyle(
                                  fontSize: 19,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          )
                        ],
                      ))
                ],
              )),
        ])
      ],
    ));
  }
}
