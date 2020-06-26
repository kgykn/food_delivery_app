import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth =  FirebaseAuth.instance;

  // Anonymous
  Future signinAnon() async{
    try {
      AuthResult result = await _auth.signInAnonymously();
      FirebaseUser user = result.user;
      return user;
    } catch(e) {
      print(e.toString());
      return null;
    }
}

  // Email + Password

  // Register with Email + Password

  // Sign out
}