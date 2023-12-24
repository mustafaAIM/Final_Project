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
  @override
    List details = [
      "Scientific name",
      "Commercial name",
      "Category",
      "Manufacturing company",
      "Available quantity",
      "Expiration date",
      "Price"
    ];
    List apidetails = [
      "panadol",
      "Panadol",
      "painkiller",
      'phizer',
      '200',
      '2020/3/4',
      '20\$'
    ];
  late List<TextEditingController> _controllers = List.generate(7, (index) => TextEditingController(text: "${apidetails[index]}"));
  List<bool> _isEditing = List.generate(7, (index) => false);
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
                  child: ListView.builder(
                      itemCount: details.length,
                      itemBuilder: (context, index) {
                        return Column(children: [
                          Container(
                            padding: EdgeInsets.symmetric(vertical: 0,horizontal: 10),

                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20)
                            ),
                            child:Row(
                            children: [
                              Text("${details[index]}: ",
                              style: TextStyle(
                                fontSize: 16
                              ),),
                              Expanded(
                                child: TextField(

          controller: _controllers[index],
          readOnly: !_isEditing[index],
          decoration: InputDecoration(
            
            border: InputBorder.none,
            focusedBorder: InputBorder.none,
            enabledBorder: InputBorder.none,
            errorBorder: InputBorder.none,
            disabledBorder: InputBorder.none,

            suffixIcon: IconButton(
              icon: Icon(_isEditing[index] ? Icons.check : Icons.edit),
              onPressed: () {
                setState(() {
                  _isEditing[index] = !_isEditing[index];
                  print('Editing state for index $index: ${_isEditing[index]}');
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
                        ]);
                      }),
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
        )
        );
  }
}
