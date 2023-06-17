// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace, must_be_immutable, unused_local_variable

import 'package:flutter/material.dart';
import 'package:food_delivery_app/Constants/app_colors.dart';
import 'package:food_delivery_app/Models/items.dart';
import 'package:food_delivery_app/Services/cart.dart';
import 'package:food_delivery_app/Widgets/add_items_ico.dart';
import 'package:provider/provider.dart';

class CheckOutScreen extends StatefulWidget {
  CheckOutScreen({super.key});
  static String id = "checkout screen";
  int counter = 1; 
  @override
  State<CheckOutScreen> createState() => _CheckOutScreenState();
}

class _CheckOutScreenState extends State<CheckOutScreen> {

  List<Items> showItems = [];
  
  @override
  Widget build(BuildContext context) {
    final cartItems = Provider.of<Cart>(context);
    int index = 0;
    return Scaffold(
      
      backgroundColor: KAccaryColor,
      appBar: AppBar( 
        toolbarHeight: 80,
        elevation: 0.0,
        backgroundColor: KAccaryColor, 
         leading: Icon(Icons.arrow_back_ios, size: 28, color: Colors.black,),
        title: Text("Cart", style: TextStyle(fontSize: 22,color: Colors.black,fontWeight: FontWeight.bold, letterSpacing: 1.0),),
        actions: [
          Container(
            height: 60, 
            width: 70, 
            margin: EdgeInsets.symmetric(horizontal: 20),
            // color: Colors.red,
            child: Stack(  
              children: [
                Container(
                  alignment: Alignment.center,
                  child: Icon(Icons.shopping_cart, size: 35, color: KPrimaryColor,),
                ),
                cartItems.totalItems < 100? Positioned( 
                  left: 8,
                  top: 6,
                  child: Container(
                    alignment: Alignment.center,
                    height: 23, 
                    width: 23, 
                    decoration: BoxDecoration( 
                      color: Colors.red,
                      shape: BoxShape.circle, 
                      border: Border.all(color: Colors.black, width: 1)
                    ),
                    child: Text("${cartItems.totalItems}", style: TextStyle(fontWeight: FontWeight.bold),),
                  ),
                ): Positioned( 
                  left: 0,
                  top: 5,
                  child: Container(
                    alignment: Alignment.center,
                    height: 23,    
                    width: 35, 
                    decoration: BoxDecoration( 
                      color: Colors.red, 
                      borderRadius: BorderRadius.circular(10.0),
                      border: Border.all(color: Colors.black, width: 1)
                    ),
                    child: Text("${cartItems.totalItems}", style: TextStyle(fontWeight: FontWeight.bold),),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 10, top: 10, bottom: 10),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Container(
                height: 40, 
                width: 70, 
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
       body: SafeArea(
         child:  SingleChildScrollView(
           child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
             children: [
              Container(
                margin: EdgeInsets.only(left: 10, bottom: 15, top: 10),
                child: Text("My Ordered List", style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),)), 
              ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(50.0), 
                  topRight: Radius.circular(50.0), 
                  bottomLeft: Radius.circular(50.0),
                  bottomRight: Radius.circular(50.0)
                ),
                 child: Container(
                  height: 420, 
                  // color: Colors.red,
                   child: ListView.builder(
                   itemCount: cartItems.selectedItems.length,
                   itemBuilder: (context, index) {
                    index = index; 
                    showItems.add(cartItems.selectedItems[index]);
                     return  Container(
                             margin: EdgeInsets.all(10),
                             height: 150, 
                             decoration: BoxDecoration(
                              
                              boxShadow: [ 
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.25), 
                                  offset: Offset(0, 10), 
                                  blurRadius: 10
                                )
                              ],
                             color: Colors.white,
                             borderRadius: BorderRadius.circular(25),
                           ),
                             child: Row(
                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
                               children: [
                                  Row(  
                                   children: [
                                     Container(
                                       height: 150,
                                       width: 130,
                                       decoration: BoxDecoration(
                                         image: DecorationImage(
                                           fit: BoxFit.cover,
                                           image: NetworkImage("${cartItems.selectedItems[index].ProductImage}")
                                         ),
                                         borderRadius: BorderRadius.only(
                                           topLeft: Radius.circular(20),
                                           bottomLeft: Radius.circular(20),
                                         ), 
                                       ),
                                     ), 
                                     Padding(
                                       padding: const EdgeInsets.only(top: 10, left: 12),
                                       child: Column(
                                         crossAxisAlignment: CrossAxisAlignment.start,
                                         children: [
                                             Text("${cartItems.selectedItems[index].ProducteName}", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black.withOpacity(0.6)),),
                                             Container(
                                               width: 150,
                                               child: Text(
                                                 "${cartItems.selectedItems[index].ProductDescription}"
                                                 ,maxLines: 5, style: TextStyle(fontSize: 16, color: Colors.black),
                                                 textAlign: TextAlign.justify,
                                               ), 
                                             ),
                                         ],
                                       ),
                                     ),
                                   ],
                                 ),
                                 Padding(
                                   padding: const EdgeInsets.only(top: 20, right: 20, bottom: 25),
                                   child: Column(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                        AddAndRemoveItemsIcons(
                                        icon: Icons.remove,
                                        onTap: (){
                                            cartItems.removeItems(cartItems.selectedItems[index]); 
                                        },
                                      ),
                                      Container(
                                          alignment: Alignment.center,
                                          height: 30, 
                                          width: 30,
                                          decoration: BoxDecoration(
                                            color: Colors.black, 
                                            borderRadius: BorderRadius.circular(5.0)
                                          ),
                                          child: Text("${widget.counter}", style: TextStyle(color: Colors.white, fontSize: 16),),
                                      ),
                                      AddAndRemoveItemsIcons(
                                          onTap: (){ 
                                            cartItems.addItems(cartItems.selectedItems[index]);
                                          },
                                            icon: Icons.add,
                                      ) 
                                   ],
                                ),
                              )
                          ],
                        ), 
                       );
                     },
                   ),
                 ),
               ),
              Padding(
                 padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30.0),
                 child: Column(
                   children: [
                     Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                       children: [
                         Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                               Text("SubTotal: ", style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),), 
                               SizedBox(height: 5,),
                               Text(cartItems.selectedItems.length > 0? "\$${(cartItems.totalPrice).toStringAsFixed(1)}":"\$0", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),)
                            ],
                         ),
                         Container(
                            margin: EdgeInsets.only(top: 20),
                            alignment: Alignment.center,
                            height: 60, 
                            width: 180, 
                            decoration: BoxDecoration(
                                color: KPrimaryColor, 
                                borderRadius: BorderRadius.circular(13),
                            ),
                            child: Text("CHECKOUT", style: TextStyle(fontSize: 22, color: Colors.white, fontWeight: FontWeight.bold),),
                          ),  
                       ],
                     ),    
                                   
                   ],
                 ),
               ), 
             ],
           ),
         )
       ),
    );
  }
}