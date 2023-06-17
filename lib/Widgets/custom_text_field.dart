// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables, must_be_immutable, body_might_complete_normally_nullable

import 'package:flutter/material.dart';
import 'package:food_delivery_app/Constants/app_colors.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField({
    required this.text, 
    required this.icons, 
    required this.isPassword, 
    required this.textInputType, 
    required this.validator, 
    required this.onSave, 
    this.suficIcon, 
    this.onPressed
  });

  String text; 
  IconData icons; 
  VoidCallback? onPressed;
  bool isPassword; 
  TextInputType textInputType; 
  final String? Function(String?)? validator; 
  final String? Function(String?)? onSave; 
  IconData? suficIcon;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      
      autovalidateMode: AutovalidateMode.onUserInteraction,
      style: TextStyle(fontSize: 18, ),
      onChanged: onSave,
      validator: validator, 
      keyboardType: textInputType,
      obscureText: isPassword,
        decoration: InputDecoration( 
          errorStyle: TextStyle(fontSize: 17),
          suffixIcon: IconButton(
            onPressed: onPressed,
            icon: Padding(
              padding: const EdgeInsets.only(right: 15.0),
              child: Icon(suficIcon, color: KPrimaryColor,size:28.0,),
            ),
          
          ),
          contentPadding: EdgeInsets.symmetric(horizontal: 25, vertical: 15),
          fillColor: Color(0xFFE4C3E8),
          filled: true, 
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20), 
            borderSide: BorderSide.none,
          ),
          hintText: text, 
          hintStyle: TextStyle(color: Colors.black.withOpacity(0.5)), 
          prefixIcon: Icon(icons, size: 25, color: Color(0xFF52117A),)
        ),
    );
  }
}