import 'package:flutter/material.dart';
import 'package:flutter1/Mootaz/bottomNav.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class cartPage extends StatefulWidget {
  const cartPage({
    super.key,
  });

  @override
  State<cartPage> createState() => _cartPageState();
}

class _cartPageState extends State<cartPage> {

 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
           Container(
                  padding:
                      EdgeInsets.only(left: 15, right: 15, top: 12, bottom: 7),
                  decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 56, 161, 241),
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Image.asset(
                            "images/logo.png",
                            width: 75,
                            height: 75,
                          ),
                          Container(
                            child: Row(children: [
                              IconButton(
                                icon: Icon(Icons.star,
                                    color: Colors.yellow, size: 35),
                                onPressed: () => {},
                              ),
                              IconButton(
                                icon: Icon(
                                  Icons.account_circle,
                                  size: 35,
                                ),
                                onPressed: () => {},
                              )
                            ]),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
              width: 100,
              padding: EdgeInsets.fromLTRB(15,15,15,0),
              child: GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                     mainAxisExtent: 210,
                     crossAxisSpacing: 8,
                     mainAxisSpacing: 8,
                     childAspectRatio: 2
                     ),
                itemCount: 20,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
          
                      Container(
                        width: 150,
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20)
                          ),
                        color: const Color.fromARGB(255, 218, 218, 218),
                        border: Border.all(
                          color: Colors.black,
                          width: 2
                          )
                      ),
                      child: Container(
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [Icon(Icons.close,color: Colors.redAccent,)],
                            ),
                            SizedBox(height: 4,),
                            Text("Product Name",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold
                            ),
                            ),
                            SizedBox(height: 6,),
                            Text("200\$",style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),),
                            SizedBox(height: 8,),
                            Container(
                              width: 100,
                              height: 30,
                              padding: EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(12)
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  
                                  Text("200",style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black.withOpacity(0.4)
                                  ),)
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 0.2,),
                    Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20)
                          ),
                        color: const Color.fromARGB(255, 218, 218, 218),
                        border: Border.all(
                          color: Colors.black,
                          width: 2
                          )
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("48624\$",style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),)
                        ],
                      ),
                    )
                    ],
                  );
                },
              ),
            ),
            SizedBox(height: 20,),
           Container(
            padding: EdgeInsets.all(15),
            child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
               Divider(color: Colors.black,thickness: 5),
               Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text("Total: 1023467 SP",style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold
                  ),),
                   ClipRRect(
                borderRadius: BorderRadius.circular(60),
                child: MaterialButton(onPressed: () {
                
              },
              child: Text("Checkout",style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold),),
              color: const Color.fromARGB(255, 3, 58, 103),
              textColor: Colors.white,
              height: 50,
              minWidth: 120,
              elevation: 8,
              ),
              )
                ],
               )
            ],
           ),
           )
                    
                  
                
        ],
      ),
    );
  }
}