// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class Recommended extends StatelessWidget {
  Recommended({super.key, 
    required this.seeAll, 
    required this.text
  });
  String text; 
  String seeAll; 

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 25),
      child: Row(  
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: 28,
              // color: Colors.red,
              child: Stack(
                children: [
                  Text(text, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, letterSpacing: 1.0, color: Colors.grey),),
                  Positioned(
                    bottom: 0, 
                    left: 0, 
                    right: 0,
                    child: Container(
                      height: 1.5,
                      color: Colors.green,
                    ),
                  ),
                ],
              ),
            ), 
            Stack(
              children: [
                Text(seeAll, style: TextStyle(fontSize: 20, color: Colors.blueGrey, fontWeight: FontWeight.bold),),
                Positioned(
                  bottom: 0.0,
                  left: 0.0, 
                  right: 0.0,
                  child: Container(
                    height: 1.5, 
                    color: Colors.green,
                  ),
                )
              ],
            )
          ],
        ),
    );
  }
}