import 'package:cloud_firestore/cloud_firestore.dart';

class UserDatabaseService {
  final String uid;
  UserDatabaseService({this.uid});

  final CollectionReference userCollection =
      Firestore.instance.collection('user');

  Future updateUserData(
      String name, DateTime dob, String email, String phone_number) async {
    return await userCollection.document(uid).setData({
      'name': name,
      'dob': dob,
      'email': email,
      'phone_number': phone_number,
    });
  }

  Stream<QuerySnapshot> get user {
    return userCollection.snapshots();
  }
}
