import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fooddeliveryapp/Components/Categories/CategoryList.dart';
import 'package:fooddeliveryapp/Database/categoryDatabase.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:fooddeliveryapp/Models/category.dart';
import 'package:fooddeliveryapp/UI/loading.dart';
import 'package:provider/provider.dart';

class AddCategory extends StatefulWidget {
  @override
  _AddCategoryState createState() => _AddCategoryState();
}

class _AddCategoryState extends State<AddCategory> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();

  CategoryDatabaseService categoryData = CategoryDatabaseService();

  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return !_isLoading
        ? Scaffold(
            appBar: AppBar(
                backgroundColor: Colors.deepOrangeAccent,
                title: Text(
                  'Add category',
                  style: (TextStyle(color: Colors.white)),
                )),
            body: Form(
                key: _formKey,
                child: ListView(children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: nameController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(hintText: "Category name"),
                      validator: (value) => value.isEmpty
                          ? 'Category name can\'t be empty!'
                          : null,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: FlatButton(
                        color: Colors.deepOrangeAccent,
                        child: Text(
                          'Add category',
                          style: TextStyle(color: Colors.white),
                        ),
                        onPressed: () {
                          formValidateAndUpload();
                        }),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('All categories',
                        style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.deepOrangeAccent)),
                  ),
                  Container(
                      height: 500.0,
                      child: StreamProvider<List<Category>>.value(
                          initialData: List(),
                          value: CategoryDatabaseService().categoriesDescending,
                          child: CategoryList())),
                ])))
        : Loading();
  }

  void formValidateAndUpload() {
    if (_formKey.currentState.validate()) {
      setState(() => _isLoading = true);

      categoryData.updateCategoryData({"name": nameController.text});

      _formKey.currentState.reset();
      setState(() => _isLoading = false);
      initState();
    } else {
      setState(() => _isLoading = false);
    }
  }
}
