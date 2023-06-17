// ignore_for_file: prefer_const_literals_to_create_immutables, must_be_immutable, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:food_delivery_app/Constants/app_colors.dart';
import 'package:food_delivery_app/Models/items.dart';
import 'package:food_delivery_app/Screens/checkout_screen.dart';
import 'package:food_delivery_app/Services/cart.dart';
import 'package:provider/provider.dart';

class DetialScreen extends StatefulWidget {
  DetialScreen({super.key,this.items});

  Items? items; 
  bool isChecked = false;
  List<Items> currentSelectedItem = [];

  @override
  State<DetialScreen> createState() => _DetialScreenState();
}

class _DetialScreenState extends State<DetialScreen> {
  int itemsData = 0;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
       home: Scaffold(  
          body: SafeArea(  
            child: Container(
               height: double.infinity, 
               color: Color(0xFFF7F7F7),
               child: Stack(
                  children: [
                    Container(
                      height: 270, 
                      decoration: BoxDecoration(
                         image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage("${widget.items!.ProductImage}")
                         )
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(right: 20, left: 20, bottom: 160),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              alignment: Alignment.center,
                              height: 40, 
                              width: 40,
                              padding: EdgeInsets.only(left: 7),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0), 
                                color: Colors.grey.shade300
                              ),
                              child: Icon(Icons.arrow_back_ios),
                            ),
                            Container(
                              height: 40, 
                              width: 40, 
                              // padding: EdgeInsets.only(left: 7),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0), 
                                color: Color(0xFFE78886),
                              ),
                              child: Icon(Icons.favorite_border_outlined, color: Colors.white,),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      top: 230, 
                      left: 0, 
                      right: 0,
                      child: Container(
                        
                        height: 600,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(40),
                            topRight: Radius.circular(40)
                          )
                        ),
                        child: SingleChildScrollView(
                          child: Column(  
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                  top: 25, 
                                  bottom: 20, 
                                  left: 25, 
                                  right: 5
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                      Text("${widget.items!.ProducteName}", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, letterSpacing: 1.0),),
                                      Container(
                                   
                                        child: Text("${widget.items!.ProductDescription}", style: TextStyle(
                                            fontSize: 18, letterSpacing: 0.9, 
                                            fontWeight: FontWeight.w400, 
                                            color: Colors.grey.shade700, 
                                            height: 1.5, 
                                          ),
                                          softWrap: true,
                                          textAlign: TextAlign.left,
                                        ),
                                      ), 
                                  ],
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.only(left: 25),
                                alignment: Alignment.centerLeft,
                                height: 50, 
                                color: Color(0xFFF7F7F7),
                                child: Text("Add Some Extras", style: TextStyle(
                                    fontSize: 18, 
                                    color: Colors.grey.shade600
                                ),),
                              ), 
                              Column(
                                children: [
                                  Row(
                                    children: [
                                      Expanded(
                                        child: CheckboxListTile(
                                          controlAffinity: ListTileControlAffinity.leading,
                                          value: widget.isChecked, 
                                          onChanged: (data){
                                            setState(() {
                                                setState(() {
                                                  widget.isChecked = widget.isChecked = data!;
                                                  print(widget.isChecked,);
                                                });
                                            });
                                          },
                                          title: Text("Extrac Path"),
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(right: 30),
                                        child: Text("+\RM 2.0", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.grey),
                                        ), 
                                      ), 
                                    ],
                                  ), 
                                  SizedBox(height: 60,), 
                                  Consumer<Cart>(
                                    builder: (context, cart, model) {
                                        return GestureDetector(
                                          onTap: (){
                                            if(!cart.selectedItems.contains(widget.items)){
                                              cart.addItems(widget.items!);
                                              Navigator.push(context,MaterialPageRoute(builder: (context) {
                                                  return CheckOutScreen();
                                              }));
                                            } 
                                              Navigator.push(context,MaterialPageRoute(builder: (context) {
                                                  return CheckOutScreen();
                                              }));
                                          },
                                          child: Container(
                                             padding: EdgeInsets.symmetric(horizontal: 20),
                                             margin: EdgeInsets.symmetric(horizontal: 30),
                                             height: 60, 
                                             width: double.infinity, 
                                             decoration: BoxDecoration(
                                             color: KPrimaryColor, 
                                             borderRadius: BorderRadius.circular(20.0),
                                          ),
                                             child: Row(
                                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                           children: [
                                             Text("ADD TO CART", style: TextStyle(
                                               fontSize: 18, color: Colors.grey.shade300, 
                                               fontWeight: FontWeight.bold
                                               ),
                                             ), 
                                             Text("\RM${widget.items!.ProductPrice}", style: TextStyle(
                                               fontSize: 18, color: Colors.grey.shade300, 
                                               fontWeight: FontWeight.bold
                                                 ),
                                             ),
                                              
                                            ],
                                            ),
                                          ),
                                        );
                                    }
                                   ),
                                ],
                              ), 
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
               ),
            )
          ),
       ),
    );
  }
}