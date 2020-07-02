import 'package:cloud_firestore/cloud_firestore.dart';

class ProductDatabaseService {
  final String id;
  ProductDatabaseService({this.id});

  final CollectionReference productCollection =
      Firestore.instance.collection('product');

  Future updateProductData(
      String name, String description, int price, String imageUrl) async {
    return await productCollection.document(id).setData({
      'name': name,
      'description': description,
      'price': price,
      'imageUrl': imageUrl,
    });
  }

  Stream<QuerySnapshot> get user {
    return productCollection.snapshots();
  }
}
