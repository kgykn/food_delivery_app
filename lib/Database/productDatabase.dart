import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fooddeliveryapp/Models/products.dart';

class ProductDatabaseService {
  final String productId;
  ProductDatabaseService({this.productId});

  final CollectionReference productCollection =
      Firestore.instance.collection('products');

  List<Product> _productListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc) {
      return Product(
          name: doc.data["name"],
          imageUrl: doc.data["imageUrl"],
          description: doc.data["description"],
          isFeatured: doc.data["isFeatured"],
          price: doc.data["price"]);
    }).toList();
  }

  Future<void> updateProductData(Map<String, dynamic> data) async {
    return await productCollection.document(productId).setData(data);
  }

  Stream<List<Product>> get products {
    Stream<QuerySnapshot> stream =
        Firestore.instance.collection("products").snapshots();

    return stream.map((qShot) => qShot.documents
        .map((doc) => Product(
            name: doc.data['name'],
            imageUrl: doc.data['imageUrl'],
            price: doc.data['price'],
            isFeatured: doc.data['isFeatured'],
            description: doc.data['description']))
        .toList());
  }
}
