import 'package:fooddeliveryapp/Models/category.dart';
import 'package:flutter/material.dart';

class CategoryCard extends StatelessWidget {
  final Category category;
  CategoryCard({this.category});

  @override
  Widget build(BuildContext context) {
    return Card(
        child: Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        ListTile(
            title: Text(
          category.name,
          style: TextStyle(fontSize: 16.0),
        ))
      ],
    ));
  }
}
