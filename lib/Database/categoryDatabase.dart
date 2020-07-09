import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fooddeliveryapp/Models/category.dart';

class CategoryDatabaseService {
  final String categoryId;
  CategoryDatabaseService({this.categoryId});

  final CollectionReference categoryCollection =
      Firestore.instance.collection('categories');

  Future<void> updateProductData(Map<String, dynamic> data) async {
    return await categoryCollection.document(categoryId).setData(data);
  }

  Stream<List<Category>> get categories {
    Stream<QuerySnapshot> stream =
        Firestore.instance.collection("categories").snapshots();

    return stream.map((qShot) => qShot.documents
        .map((doc) => Category(
              name: doc.data['name'],
            ))
        .toList());
  }
}
