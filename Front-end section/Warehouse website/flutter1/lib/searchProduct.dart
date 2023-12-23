import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter1/main.dart';
import 'package:flutter_redux/flutter_redux.dart';

class searchProductPage extends StatefulWidget {
  const searchProductPage({super.key});

  @override
  State<searchProductPage> createState() => _searchProductPageState();
}

class _searchProductPageState extends State<searchProductPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      padding: EdgeInsets.all(30),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                width: MediaQuery.of(context).size.width / 5,
                child: Text(
                  "Products :",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
              ),
              Expanded(
                child: Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width / 4,
                        height: 35,
                        child: Expanded(
                          child: TextField(
                            style: TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(6),
                              suffixIcon: Icon(Icons.search),
                              hintStyle: TextStyle(color: Colors.black),
                              filled: true,
                              fillColor: Colors.white,
                              border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20)),
                                  borderSide: BorderSide(color: Colors.black)),
                            ),
                          ),
                        ),
                      ),
                      MaterialButton(
                        onPressed: () {
                         StoreProvider.of<AppState>(context).dispatch(NavClickAction(5));
              
                        },
                        color: Colors.white24,
                        padding: EdgeInsets.all(20),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12)),
                        child: Text(
                          "Add Products",
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(3),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Color.fromARGB(136, 210, 206, 206),
                        ),
                        child: IconButton(
                          onPressed: () {},
                          color: Colors.black,
                          icon: Icon(Icons.filter_alt),
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
          SizedBox(height: 20,),
          Container(
            height: 50,
            margin: const EdgeInsets.only(right: 90), 
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 5,
              itemBuilder: (context, index) {
                return Container(
                  padding: EdgeInsets.only(left: 10),
                  decoration: BoxDecoration(
                    color: Color.fromARGB(137, 227, 222, 222),
                    borderRadius: BorderRadius.circular(20)
                  ),
                  child: Row(
                    children: [
                      Text("Category"),
                      IconButton(onPressed: (){

                      }, icon: Icon(Icons.close))
                    ],
                  ),
                );
              },
              ),
          ),
          SizedBox(height: 10,),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: DataTable2(
                border: TableBorder(
                  verticalInside: BorderSide(color: Colors.black,width: 2)
                ),
                headingRowColor: MaterialStatePropertyAll(Colors.black26),
                dataTextStyle: TextStyle(fontSize: 16),
                  
                  columnSpacing: 12,
                  horizontalMargin: 12,
                  minWidth: 600,
                  columns: [
                    DataColumn2(
                      label: Text('Commercial Name'),
                      size: ColumnSize.L,
                    ),
                    DataColumn(
                      label: Text('scientific Name'),
                    ),
                    DataColumn(
                      label: Text('Quantity'),
                    ),
                    DataColumn(
                      label: Text('Price'),
                    ),
                    DataColumn(
                      label: Text('Expiration date'),
                    ),
                  ],
                  headingRowDecoration: BoxDecoration(
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(12),topRight: Radius.circular(12))
                  ),
                  headingTextStyle: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
                  rows: List<DataRow>.generate(
                      20,
                      (index)  {
                        if (index.isEven) {
                          return DataRow(
                            onLongPress: () {
                              StoreProvider.of<AppState>(context).dispatch(NavClickAction(6));
              
                            },
                            color: MaterialStatePropertyAll(Colors.black54),
                        cells: [
                            DataCell(Text('Panadol'),),
                            DataCell(Text('Panadol')),
                            DataCell(Text('50')),
                            DataCell(Text('200\$')),
                            DataCell(Text(("2022\\20\\20")))
                          ]);
                        }else{
                          return DataRow(
                            onLongPress: () {
                              StoreProvider.of<AppState>(context).dispatch(NavClickAction(6));
              
                            },
                        cells: [
                            DataCell(Text('Brofin'),),
                            DataCell(Text('Brofin extra')),
                            DataCell(Text('30')),
                            DataCell(Text('300\$')),
                            DataCell(Text(("2020\\19\\4")))
                          ]);
                        }
                      })),
            ),
          )
        ],
      ),
    ));
  }
}
