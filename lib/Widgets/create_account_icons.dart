
// ignore_for_file: prefer_const_constructors, must_be_immutable

import 'package:flutter/material.dart';

class CreateAccountsIcon extends StatelessWidget {
  CreateAccountsIcon({super.key});
  List<String> iconAssets = [
      "assets/images/facebook.png", 
      "assets/images/github.png", 
      "assets/images/google.png", 
      "assets/images/twiter.png" 
  ]; 
  Widget icon(String image) {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.all(9),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey, width: 2), 
          shape: BoxShape.circle
        ),
        child: Image.asset(image, height: 30, width: 30,),
    ); 
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(iconAssets.length, (index) {
            return Padding(
              padding: const EdgeInsets.only(left: 4),
              child: icon(iconAssets[index]),
            );
          }),
      ),
    ); 
  }
}