import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Product {
  String _name;
  int _price;
  String _description;
  bool _isFeatured;
  String _image;

  Product.fromSnapshot(DocumentSnapshot snapshot) {
    Map data = snapshot.data;

    _name = data['name'];
    _price = data['price'];
    _description = data['description'];
    _isFeatured = data['isFeatured'];
    _image = data['image'];
  }
}
