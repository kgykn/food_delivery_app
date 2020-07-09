import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fooddeliveryapp/Components/Categories/CategoryList.dart';
import 'package:fooddeliveryapp/Database/categoryDatabase.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:fooddeliveryapp/Models/category.dart';
import 'package:provider/provider.dart';

class AddCategory extends StatefulWidget {
  @override
  _AddCategoryState createState() => _AddCategoryState();
}

class _AddCategoryState extends State<AddCategory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.deepOrangeAccent,
          title: Text(
            'Add category',
            style: (TextStyle(color: Colors.white)),
          )),
      body: Container(
          height: 500.0,
          child: StreamProvider<List<Category>>.value(
              initialData: List(),
              value: CategoryDatabaseService().categories,
              child: CategoryList())),
    );
  }
}
