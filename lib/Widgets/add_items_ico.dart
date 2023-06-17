
// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:food_delivery_app/Constants/app_colors.dart';

class AddAndRemoveItemsIcons extends StatelessWidget {
  AddAndRemoveItemsIcons({
    super.key, 
    required this.icon, 
    required this.onTap
    });

  IconData icon;
  VoidCallback onTap; 
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
          alignment: Alignment.center,
          height: 30, 
          width: 30,
          decoration: BoxDecoration(
            color: iconColors, 
            borderRadius: BorderRadius.circular(8.0)
          ),
          child: Icon(icon, size: 28,color: Colors.black,)
        ),
    );
  }
}