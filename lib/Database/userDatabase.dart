import 'package:cloud_firestore/cloud_firestore.dart';

class UserDatabaseService {
  final String uid;
  UserDatabaseService({this.uid});

  final CollectionReference userCollection =
      Firestore.instance.collection('user');

  Future updateUserData(String name, String phone_number) async {
    return await userCollection.document(uid).setData({
      'name': name,
      'phone_number': phone_number,
    });
  }

  Stream<QuerySnapshot> get user {
    return userCollection.snapshots();
  }
}
