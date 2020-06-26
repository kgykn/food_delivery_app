import 'package:firebase_auth/firebase_auth.dart';
import 'package:fooddeliveryapp/Models/user.dart';
import 'package:fooddeliveryapp/Models/user.dart';

class AuthService {
  final FirebaseAuth _auth =  FirebaseAuth.instance;

  // Create user on FirebaseUser
  User _userfromFirebaseUser(FirebaseUser user)
  {
    return user != null ? User(uid: user.uid) : null;
  } 

  // Auth change user stream
  Stream<User> get user{
    return _auth.onAuthStateChanged.map(_userfromFirebaseUser);
  } 

  // Anonymously log in
  Future signinAnon() async{
    try {
      AuthResult result = await _auth.signInAnonymously();
      FirebaseUser user = result.user;
      return _userfromFirebaseUser(user);
    } catch(e) {
      print(e.toString());
      return null;
    }
}

  // Email + Password

  // Register with Email + Password

  // Sign out
  Future signOut() async{
    try {
      return await _auth.signOut();
    }
    catch(e) {
      print(e.toString());
      return null;
    }
  }
}