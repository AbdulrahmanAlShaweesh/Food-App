// ignore_for_file: non_constant_identifier_names, prefer_is_empty

import 'package:flutter/material.dart';
import 'package:food_delivery_app/Models/items.dart';

class Cart extends ChangeNotifier {
  Items? _items; 

  List<Items> selectedItems = []; 
  double totalPrice = 0.0;

  void addItems(Items product){
    selectedItems.add(product);
    totalPrice += product.ProductPrice!; 
    notifyListeners();
  }

  void removeItems(Items product){
    selectedItems.remove(product);
    if(selectedItems.length > 0) {
      totalPrice -= product.ProductPrice! ;
      notifyListeners();
    }
    notifyListeners();
  }

  productDetials(Items? data) {
    _items = data; 
  }

  int get totalItems => selectedItems.length;

  double get prices => totalPrice;

  Items get product => _items!;

}