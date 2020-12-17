import 'package:firebase_auth/firebase_auth.dart';
import 'package:fyp_smart_shopping/Pages/welcome_page.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Stream<User> get authStateChanges => _auth.authStateChanges();
  //Stream<User> get authStateChanges => _auth.idTokenChanges();

  // sign in anon
  Future signInAnon() async {
    try {
      UserCredential result = await _auth.signInAnonymously();
      User user = result.user;
      return user;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  // sign in with email and password

  Future<String> signIn(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      return "Signed In";
    } on FirebaseAuthException catch (e) {
      return e.message;
    }

  }

  // register with email and password

  Future<String> signUp(String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      return "Signed Up";
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  // sign out

  Future<void> signOut() async {
    await _auth.signOut();
  }
}
