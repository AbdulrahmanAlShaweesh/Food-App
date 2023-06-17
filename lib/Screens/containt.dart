// ignore_for_file: prefer_const_constructors_in_immutables, prefer_const_literals_to_create_immutables, prefer_const_constructors, prefer_final_fields, sized_box_for_whitespace, must_be_immutable, unused_import

import 'package:flutter/material.dart';
import 'package:food_delivery_app/Constants/app_colors.dart';
import 'package:food_delivery_app/Models/items.dart';
import 'package:food_delivery_app/Screens/product_detials._Screen.dart';
import 'package:food_delivery_app/Services/cart.dart';
import 'package:food_delivery_app/Widgets/custom_search.dart';
import 'package:food_delivery_app/Widgets/recommended_product_screen.dart';
import 'package:provider/provider.dart';

class ContaintsPage extends StatefulWidget {
  ContaintsPage({super.key});
  static String id = "Home Screen"; 
  bool isSeeAll = true; 
  @override
  State<ContaintsPage> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<ContaintsPage> {
  PageController _pageController  = PageController(viewportFraction: 0.8);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _pageController.addListener(() {
       setState(() {
         print(_pageController.viewportFraction);
       });
    });
  }
    List<Items> recommended = [
        Items(
          ProductDescription: "alsdkfj nasdkfaldsfj asldf asldfasldfk aslkdf alskdfjasldkfasdlfaskdjfhaskdfjhlasdfasdlfasdfalsdffjadf adsfalsdfjadsfla dfasdfasdlfkjadsf", 
          ProductImage: "https://cdn.shopify.com/s/files/1/0070/7032/files/food-photgraphy-tips.png?format=jpg&quality=90&v=1657891849", 
          ProductPrice: 15.6, 
          ProductRate: 4.3, 
          ProducteName: "Burger",
        ),
        Items(
          ProductDescription: "alsdkfj nasdkfaldsfj asldf asldfasldfk aslkdf alskdfjasldkfasdlfaskdjfhaskdfjhlasdfasdlfasdfalsdffjadf adsfalsdfjadsfla dfasdfasdlfkjadsf", 
          ProductImage: "https://cdn.shopify.com/s/files/1/0070/7032/files/food-photgraphy-tips.png?format=jpg&quality=90&v=1657891849", 
          ProductPrice: 5.3, 
          ProductRate: 25.23, 
          ProducteName: "Pizza",
        ),
        Items(
          ProductDescription: "alsdkfj nasdkfaldsfj asldf asldfasldfk aslkdf alskdfjasldkfasdlfaskdjfhaskdfjhlasdfasdlfasdfalsdffjadf adsfalsdfjadsfla dfasdfasdlfkjadsf", 
          ProductImage: "https://cdn.shopify.com/s/files/1/0070/7032/files/food-photgraphy-tips.png?format=jpg&quality=90&v=1657891849", 
          ProductPrice: 7.2, 
          ProductRate: 185.23, 
          ProducteName: "Rap Chicken",
        ),
    ];
    List<Items> topSells = [
    Items(
      ProductDescription: "alsdkfj nasdkfaldsfj asldf asldfasldfk aslkdf alskdfjasldkfasdlfaskdjfhaskdfjhlasdfasdlfasdfalsdffjadf adsfalsdfjadsfla dfasdfasdlfkjadsf", 
      ProductImage: "https://img.freepik.com/free-photo/chicken-wings-barbecue-sweetly-sour-sauce-picnic-summer-menu-tasty-food-top-view-flat-lay_2829-6471.jpg?w=2000", 
      ProductPrice: 12.3, 
      ProductRate: 23.23, 
      ProducteName: "Burger Beed", 
    ),
    Items(
        ProductDescription: "alsdkfj nasdkfaldsfj asldf asldfasldfk aslkdf alskdfjasldkfasdlfaskdjfhaskdfjhlasdfasdlfasdfalsdffjadf adsfalsdfjadsfla dfasdfasdlfkjadsf", 
        ProductImage: "https://img.freepik.com/free-photo/chicken-wings-barbecue-sweetly-sour-sauce-picnic-summer-menu-tasty-food-top-view-flat-lay_2829-6471.jpg?w=2000", 
        ProductPrice: 6.4, 
        ProductRate: 10.23, 
        ProducteName: "frid fish", 
      ),
      Items(
        ProductDescription: "alsdkfj nasdkfaldsfj asldf asldfasldfk aslkdf alskdfjasldkfasdlfaskdjfhaskdfjhlasdfasdlfasdfalsdffjadf adsfalsdfjadsfla dfasdfasdlfkjadsf", 
        ProductImage: "https://img.freepik.com/free-photo/chicken-wings-barbecue-sweetly-sour-sauce-picnic-summer-menu-tasty-food-top-view-flat-lay_2829-6471.jpg?w=2000", 
        ProductPrice: 5.6, 
        ProductRate: 15.23, 
        ProducteName: "arabic sald", 
      ),
    ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEBEAEF),
      appBar: AppBar(
        toolbarHeight: 120.0,
        backgroundColor: KPrimaryColor,
        elevation: 0.0,
        title: CustomSearch(),
        actions: [
          Container(
            alignment: Alignment.center,
            margin: EdgeInsets.symmetric(vertical: 35, horizontal: 15),
            height: 50, 
            width: 55.0, 
            decoration: BoxDecoration(  
              color: iconColors, 
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Center(
              child: TextField(  
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(horizontal: 17, vertical: 10),
                  suffix: Icon(Icons.search),  
                  border: InputBorder.none, 
                ),
              ),
            ),
          )
        ],
      ),
       body:  ListView(  
         children: [
            SizedBox(height: 10,),
            Recommended(
              text: "Top Sells",
              seeAll: "See All",
            ),
            SizedBox(height: 8.0,), 
            Container(
              height: 250, 
              child: PageView.builder(
                physics: BouncingScrollPhysics(),
                controller: _pageController,
                itemCount: topSells.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context){
                          return DetialScreen(
                            items: topSells[index],
                          );
                      }));
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.3), 
                            offset: Offset(0, 5), 
                            blurRadius: 5
                          )
                        ]
                      ),
                      margin:topSells[index] == topSells.length? EdgeInsets.only(
                        right: 0, top: 10.0, bottom: 10, left: 5
                        ): EdgeInsets.only(
                          right: 40, top: 10.0, bottom: 10, left: 0
                        ),
                      child: Stack(
                        children: [
                          Container(
                            height: 150,
                            // color: Colors.red,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(25), 
                                topRight: Radius.circular(20)
                              ),
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage("${topSells[index].ProductImage}")
                              )
                            ),
                            
                          ), 
                          Positioned(
                            bottom: 0,
                            left: 0,
                            right: 0,
                            child: Container(
                              height: 80,
                              decoration: BoxDecoration( 
                                color: Color(0xFFFBFAFA),
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(20),
                                  bottomRight: Radius.circular(20),
                                )
                              ),
                              child: Column(
                                children: [
                                  Text("${topSells[index].ProductRate}")
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }
              ),
            ),
            SizedBox(height: 15,), 
            Recommended(
              text: "Recommended",
              seeAll: "See All",
            ),
            SizedBox(height: 20,),
            ...List.generate(recommended.length, (index) {
              return GestureDetector(
                onTap: (){
                  Navigator.push(context,MaterialPageRoute(builder: (context){
                      return DetialScreen(
                        items: recommended[index],
                      );
                  }));
                },
                child: Container(
                  height: 260,
                  decoration: BoxDecoration(
                    // color: Colors.red, 
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20), 
                      topRight: Radius.circular(20)
                    )
                  ),
                  margin: EdgeInsets.only(left: 35, right: 35, bottom: 15, top: 10),
                  child: Stack(
                    children: [
                      Container(
                        // color: Colors.green,
                         height: 180, 
                         decoration: BoxDecoration( 
                          image: DecorationImage(image: NetworkImage(
                              "${recommended[index].ProductImage}",
                            ), 
                            fit: BoxFit.cover
                          ), 
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20), 
                            topRight: Radius.circular(20), 
                           ), 
                         ),
                      ),
                      Positioned(
                        bottom: 0, 
                        right: 0, 
                        left: 0,
                        child: Container(
                          margin: EdgeInsets.only(bottom: 5),
                          height: 80,
                          decoration: BoxDecoration(
                            
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(20), 
                              bottomRight: Radius.circular(20),
                            )
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            })
         ],
       ),
    );
  }
}