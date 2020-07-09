import 'package:cloud_firestore/cloud_firestore.dart';

class UserDatabaseService {
  final String uid;
  UserDatabaseService({this.uid});

  final CollectionReference userCollection =
      Firestore.instance.collection('user');

  Future updateUserData(String name, String phoneNumber) async {
    return await userCollection.document(uid).setData({
      'name': name,
      'phone_number': phoneNumber,
    });
  }

  Stream<QuerySnapshot> get user {
    return userCollection.snapshots();
  }
}
