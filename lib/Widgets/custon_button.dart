// ignore_for_file: prefer_const_constructors, must_be_immutable, unnecessary_import

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:food_delivery_app/Constants/app_colors.dart';

class CustomButtom extends StatelessWidget {
  CustomButtom({
    required this.text, 
    required this.onTap, 
    required this.height, 
    required this.width
  });
  String text;  
  VoidCallback onTap; 
  double height; 
  double width; 

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        height: height, 
        width: width, 
        decoration: BoxDecoration(  
          color: KPrimaryColor,
          borderRadius: BorderRadius.circular(20), 
        ),
        child: Text(text, style: TextStyle(
            fontSize: 22, 
            color: Colors.white
          ),
        ),
      ),
    );
  }
}