// ignore_for_file: unused_import, prefer_const_constructors

import 'package:flutter/material.dart';

class CustomSearch extends StatelessWidget {
  const CustomSearch({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 40, 
      decoration: BoxDecoration(
        boxShadow: [  
          BoxShadow(
            color: Colors.black.withOpacity(0.3), 
            offset: Offset(-5, 5), 
            blurRadius: 5
          )
        ],
        color: Colors.white, 
        borderRadius: BorderRadius.circular(5)
      ),
      // width:,
      child: TextFormField(
        
        decoration: const InputDecoration(
          suffixIcon: Icon(Icons.camera_enhance_outlined, color: Colors.grey , size: 25,),
          hintText: "Search Product",
          
          prefixIcon: Icon(Icons.search, size: 25, color: Color.fromARGB(255, 114, 108, 136),),
          contentPadding: EdgeInsets.symmetric(horizontal: 25, vertical: 7),
          border: InputBorder.none, 
        ), 
      ),
    );
  }
}