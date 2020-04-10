import 'package:cityanal/models/users.dart';
import 'package:cityanal/services/database.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService{

  final FirebaseAuth _auth  =FirebaseAuth.instance;
  User _userfrmfirebaseUser(FirebaseUser user) {
    return user != null ? User(uid: user.uid) : null;
  }

  //auth changes user stream

  Stream<User> get user {
    return _auth.onAuthStateChanged
    // .map((FirebaseUser user) => _userfrmfirebaseUser(user));
        .map(_userfrmfirebaseUser);
  }
  //sign in anon
  Future signInAnon() async {
    try {
      AuthResult result = await _auth.signInAnonymously();
      FirebaseUser user = result.user;
      return _userfrmfirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
  // sign in with email and pwd


  Future signInWithEmailAndPass(String email, String password) async{
    try{
      AuthResult result = await _auth.signInWithEmailAndPassword(email: email, password: password);
      FirebaseUser user = result.user;
      return _userfrmfirebaseUser(user);
    }catch(e) {
      print(e.toString());
      return null;
    }
  }
  // register with email and pwd
  Future registerWithEmailAndPass(String email, String password) async{
    try{
      AuthResult result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      FirebaseUser user = result.user;
      await DatabaseService(uid: user.uid).updateUserData('0', 'new team', 100);
      return _userfrmfirebaseUser(user);
    }catch(e) {
      print(e.toString());
      return null;
    }
  }
  // sign out method
  Future signOut() async {
    try{
      return await _auth.signOut();
    } catch(e) {
      print(e.toString());
      return null;
    }
  }
}
