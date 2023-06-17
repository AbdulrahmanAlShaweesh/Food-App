// ignore_for_file: prefer_const_constructors, file_names

import 'package:flutter/material.dart';

class CatigoryScreen extends StatelessWidget {
  const CatigoryScreen({super.key});
  
  static String id = "catigory screen";

  @override
  Widget build(BuildContext context) {
    return Scaffold( 
       appBar: AppBar(  
          title: Text("Catigory"),
       ),
    );
  }
}