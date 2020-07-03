import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uuid/uuid.dart';

class ProductDatabaseService {
  Firestore _firestore = Firestore.instance;

  void uploadProduct(Map<String, dynamic> data) {
    var id = Uuid();
    String productId = id.v1();
    data["id"] = productId;
    _firestore.collection('products').document(productId).setData(data);
  }
}
