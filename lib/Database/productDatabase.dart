import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fooddeliveryapp/Models/product.dart';

class ProductDatabaseService {
  final String productId;
  ProductDatabaseService({this.productId});

  final CollectionReference productCollection =
      Firestore.instance.collection('products');

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
            category: doc.data['category'],
            isFeatured: doc.data['isFeatured'],
            description: doc.data['description']))
        .toList());
  }

  Stream<List<Product>> get featuredProducts {
    Stream<QuerySnapshot> stream = Firestore.instance
        .collection("products")
        .where("isFeatured", isEqualTo: true)
        .snapshots();

    return stream.map((qShot) => qShot.documents
        .map((doc) => Product(
            name: doc.data['name'],
            imageUrl: doc.data['imageUrl'],
            price: doc.data['price'],
            category: doc.data['category'],
            isFeatured: doc.data['isFeatured'],
            description: doc.data['description']))
        .toList());
  }

  Stream<List<Product>> viewProductByCategory(String category) {
    Stream<QuerySnapshot> stream = Firestore.instance
        .collection("products")
        .where("category", isEqualTo: category)
        .snapshots();

    return stream.map((qShot) => qShot.documents
        .map((doc) => Product(
            name: doc.data['name'],
            imageUrl: doc.data['imageUrl'],
            price: doc.data['price'],
            category: doc.data['category'],
            isFeatured: doc.data['isFeatured'],
            description: doc.data['description']))
        .toList());
  }
}
