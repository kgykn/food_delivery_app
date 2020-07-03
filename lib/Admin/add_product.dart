import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fooddeliveryapp/Database/categories.dart';
import 'package:fooddeliveryapp/Database/productDatabase.dart';
import 'package:fooddeliveryapp/UI/loading.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';

class AddProduct extends StatefulWidget {
  @override
  _AddProductState createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _isLoading = false;

  TextEditingController nameController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  File productImage;
  ProductDatabaseService productData = ProductDatabaseService();
  List<DocumentSnapshot> categories = <DocumentSnapshot>[];
  List<DropdownMenuItem<String>> categoriesDropDown =
      <DropdownMenuItem<String>>[];
  RegExp regExp = RegExp(r'^[a-zA-Z ]*$');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.deepOrangeAccent,
            title: Text(
              'Add product',
              style: TextStyle(color: Colors.white),
            )),
        body: Form(
            key: _formKey,
            child: ListView(
              children: <Widget>[
                OutlineButton(
                    borderSide: BorderSide(
                        color: Colors.grey.withOpacity(0.8), width: 2.0),
                    onPressed: () {
                      _selectImage(
                          // ignore: deprecated_member_use
                          ImagePicker.pickImage(source: ImageSource.gallery));
                    },
                    child: productImage == null
                        ? Padding(
                            padding: const EdgeInsets.fromLTRB(15, 40, 15, 40),
                            child: Icon(Icons.add, color: Colors.grey),
                          )
                        : Image.file(
                            productImage,
                            fit: BoxFit.fill,
                          )),
                SizedBox(height: 10.0),
                TextFormField(
                  maxLength: 30,
                  maxLines: 1,
                  controller: nameController,
                  decoration: InputDecoration(hintText: "Product name"),
                  validator: (value) =>
                      !regExp.hasMatch(value) ? 'Name invalid!' : null,
                ),
                SizedBox(height: 10.0),
                TextFormField(
                  maxLength: 200,
                  maxLines: 5,
                  controller: descriptionController,
                  decoration: InputDecoration(hintText: "Description"),
                  validator: (value) =>
                      value.isEmpty ? 'Description can\'t be empty!' : null,
                ),
                SizedBox(height: 10.0),
                TextFormField(
                  controller: priceController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(hintText: "Price"),
                  validator: (value) =>
                      value.isEmpty ? 'Price can\'t be empty!' : null,
                ),
                FlatButton(
                    color: Colors.deepOrangeAccent,
                    child: Text(
                      'Add product',
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () {
                      ValidateAndUpload();
                    })
              ],
            )));
  }

  void _selectImage(Future<File> pickImage) async {
    File tempImg = await pickImage;
    setState(() => productImage = tempImg);
  }

  void ValidateAndUpload() {
    if (_formKey.currentState.validate()) {
      setState(() => _isLoading = true);
      if (productImage != null) {
        String imageUrl;

        final FirebaseStorage storage = FirebaseStorage.instance;
        final String _imageName =
            "${DateTime.now().millisecondsSinceEpoch.toString()}.jpg";
        StorageUploadTask task =
            storage.ref().child("products/$_imageName").putFile(productImage);

        task.onComplete.then((snapshot) async {
          imageUrl = await snapshot.ref.getDownloadURL();
        });

        productData.uploadProduct({
          "name": nameController.text,
          "description": descriptionController.text,
          "price": priceController.text,
          "image": imageUrl,
        });
        _formKey.currentState.reset();
        setState(() => _isLoading = false);
        Navigator.pop(context);
      } else {
        setState(() => _isLoading = false);
      }
    }
  }
}
