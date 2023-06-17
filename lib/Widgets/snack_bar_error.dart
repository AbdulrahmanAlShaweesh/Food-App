 import 'package:flutter/material.dart';

showSnakBarError(BuildContext context, String textError) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(textError)
      ), 
    );
  }