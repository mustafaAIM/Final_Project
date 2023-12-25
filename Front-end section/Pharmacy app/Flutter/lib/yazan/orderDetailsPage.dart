import 'package:flutter/material.dart';
import 'package:flutter_locales/flutter_locales.dart';

class orderDetailsPage extends StatefulWidget {
  const orderDetailsPage({
    super.key,
  });

  @override
  State<orderDetailsPage> createState() => _orderDetailsPageState();
}

class _orderDetailsPageState extends State<orderDetailsPage> {
  @override
  Widget build(BuildContext context) {
    Map<String, Color> colorMap = {
      'Delivered': Colors.purple,
      'Received': Colors.green,
      'Being prepared': Colors.grey,
      // Add more colors as needed
    };
    List productDetails = ModalRoute.of(context)!.settings.arguments as List;
    return Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              LocaleText('order'),
              Text(': #${productDetails[0]["id"]}'),
            ],
          ),
          backgroundColor: Colors.blue,
          centerTitle: true,
          titleTextStyle: TextStyle(color: Colors.white, fontSize: 30),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            color: Colors.white, // Change the color to blue
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(children: [
                  productDetails[0]["status"] == "Delivered"
                      ? Icon(
                          Icons.local_shipping_outlined,
                          size: 30,
                          color: colorMap[productDetails[0]["status"]],
                        )
                      : productDetails[0]["status"] == "Received"
                          ? Icon(
                              Icons.local_shipping_outlined,
                              size: 30,
                              color: colorMap[productDetails[0]["status"]],
                            )
                          : productDetails[0]["status"] == "Being prepared"
                              ? Icon(
                                  Icons.medical_information_outlined,
                                  size: 30,
                                  color: colorMap[productDetails[0]["status"]],
                                )
                              : const Icon(
                                  Icons.report,
                                  size: 30,
                                  color: Colors.red,
                                ),
                  SizedBox(
                    width: 20,
                  ),
                  Column(
                    children: [
                      Text(
                        productDetails[0]["status"],
                        style: TextStyle(
                            color: colorMap[productDetails[0]["status"]],
                            fontWeight: FontWeight.w600),
                      ),
                      Text(productDetails[0]["Creation date"]),
                    ],
                  ),
                ]),
                Row(children: [
                  Icon(Icons.calendar_month),
                  SizedBox(
                    width: 10,
                  ),
                  Column(children: [
                    productDetails[0]["status"] == "Delivered"
                        ? LocaleText("delivered",
                            style: TextStyle(fontWeight: FontWeight.w600))
                        : LocaleText("expected",
                            style: TextStyle(fontWeight: FontWeight.w600)),
                    Text("${productDetails[0]["delivery date"]}")
                  ])
                ])
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Flexible(
              child: ListView.builder(
                shrinkWrap: true,
                  itemCount: productDetails[1].length,
                  itemBuilder: (context, index) {
                    return Container(
                      padding: EdgeInsets.fromLTRB(10, 0, 20, 0),
                      margin: EdgeInsets.only(bottom: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [Text("${productDetails[1][index]['amount']} x ${productDetails[1][index]['name']}",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 15
                        ),),
                        Text("${productDetails[1][index]['price']}\$",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 15
                        ),)
                        ],
                      ),
                    );
                  }),
            ),
            Divider(
                    color: Colors.black,
                    height: 50,
                    thickness: 2,
                    indent: 10,
                    endIndent: 20,
                  ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal:10.0),
                child: Row(
                  
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    LocaleText('total',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600
                    ),),
                    Text('${productDetails[2]}\$',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Colors.orange
                    ),)
                  ],
                ),
              )
                
          ]),
        ));
  }
}
