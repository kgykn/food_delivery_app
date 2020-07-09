import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_conditional_rendering/conditional.dart';
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
  bool _isFeatured = true;

  File productImage;
  ProductDatabaseService productData = ProductDatabaseService();
  RegExp regExp = RegExp(r'^[a-zA-Z ]*$');

  @override
  void initState() {}

  @override
  Widget build(BuildContext context) {
    return !_isLoading
        ? Scaffold(
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
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: OutlineButton(
                          borderSide: BorderSide(
                              color: Colors.grey.withOpacity(0.8), width: 2.0),
                          onPressed: () {
                            _selectImage(
                                // ignore: deprecated_member_use
                                ImagePicker.pickImage(
                                    source: ImageSource.gallery));
                          },
                          child: productImage == null
                              ? Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(15, 40, 15, 40),
                                  child: Icon(Icons.add, color: Colors.grey),
                                )
                              : Image.file(
                                  productImage,
                                  fit: BoxFit.fill,
                                )),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        maxLength: 30,
                        maxLines: 1,
                        controller: nameController,
                        decoration: InputDecoration(hintText: "Product name"),
                        validator: (value) =>
                            !regExp.hasMatch(value) ? 'Name invalid!' : null,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        maxLength: 200,
                        maxLines: 5,
                        controller: descriptionController,
                        decoration: InputDecoration(hintText: "Description"),
                        validator: (value) => value.isEmpty
                            ? 'Description can\'t be empty!'
                            : null,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: priceController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(hintText: "Price"),
                        validator: (value) =>
                            value.isEmpty ? 'Price can\'t be empty!' : null,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(children: <Widget>[
                        Conditional.single(
                            context: context,
                            conditionBuilder: (context) => _isFeatured,
                            widgetBuilder: (context) => InkWell(
                                  child: IconButton(
                                      icon: Icon(Icons.add_circle,
                                          size: 30.0,
                                          color: Colors.deepOrangeAccent),
                                      onPressed: () =>
                                          setState(() => _isFeatured = false)),
                                ),
                            fallbackBuilder: (context) => InkWell(
                                  child: IconButton(
                                      icon: Icon(Icons.add_circle_outline,
                                          size: 30.0,
                                          color: Colors.deepOrangeAccent),
                                      onPressed: () =>
                                          setState(() => _isFeatured = true)),
                                )),
                        Text(
                          'This product is featured',
                          style: TextStyle(
                            fontSize: 20.0,
                          ),
                        )
                      ]),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: FlatButton(
                          color: Colors.deepOrangeAccent,
                          child: Text(
                            'Add product',
                            style: TextStyle(color: Colors.white),
                          ),
                          onPressed: () {
                            formValidateAndUpload();
                          }),
                    )
                  ],
                )))
        : Loading();
  }

  void _selectImage(Future<File> pickImage) async {
    File tempImg = await pickImage;
    setState(() => productImage = tempImg);
  }

  void formValidateAndUpload() async {
    if (_formKey.currentState.validate()) {
      setState(() => _isLoading = true);
      if (productImage != null) {
        var imageUrl;

        final FirebaseStorage storage = FirebaseStorage.instance;
        final String _imageName =
            "${DateTime.now().millisecondsSinceEpoch.toString()}.jpg";
        StorageUploadTask uploadTask =
            storage.ref().child(_imageName).putFile(productImage);

        imageUrl = (await (await uploadTask.onComplete).ref.getDownloadURL())
            .toString();

        productData.updateProductData({
          "name": nameController.text,
          "description": descriptionController.text,
          "price": priceController.text,
          "imageUrl": imageUrl,
          "isFeatured": _isFeatured
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
