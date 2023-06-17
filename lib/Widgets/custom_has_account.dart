// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class HasAccount extends StatelessWidget {
  HasAccount({
    required this.navigatePage, 
    required this.text,
    });
  String navigatePage; 
  String text; 
  @override
  Widget build(BuildContext context) {
    return Row(  
        mainAxisAlignment: MainAxisAlignment.center,
        children:  [
          Text(text, style: TextStyle(fontSize: 18, ),), 
          GestureDetector(
            onTap: (){ 
              Navigator.pushNamed(context, navigatePage);
            },
            child: Text("Create", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Color(0xFFA439B3)),))
        ],
      );
  }
}