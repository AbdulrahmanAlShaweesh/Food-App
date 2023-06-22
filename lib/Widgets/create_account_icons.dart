
// ignore_for_file: prefer_const_constructors, must_be_immutable

import 'package:flutter/material.dart';

class CreateAccountsIcon extends StatelessWidget {
  CreateAccountsIcon({
    super.key, 
    required this.onTap, 
    required this.imagePath
    });
 
  Function()? onTap; 
  String imagePath; 

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: GestureDetector( 
        onTap: onTap,
        child: Container(
        margin: EdgeInsets.only(left: 10),
        height: 65, 
        width: 80,
        alignment: Alignment.center,
        padding: EdgeInsets.all(9),
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.3), 
                offset: Offset(0, 6,), 
                blurRadius: 10
              )
            ],
            borderRadius: BorderRadius.circular(15),
            color: Colors.white,
            border: Border.all(color: Colors.grey, width: 2), 
           ),
          child: Image.asset(imagePath, height: 60, width: 60,),
        ),
      ),
    ); 
  }
}