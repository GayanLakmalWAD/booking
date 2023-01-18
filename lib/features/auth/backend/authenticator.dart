import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../models/auth_result.dart';

class Authenticator {
  Authenticator();
  var currentUser = FirebaseAuth.instance.currentUser;
  String? get userId => currentUser?.uid;
  bool get isAlreadyLoggedIn => userId != null;
  String get displayName => currentUser?.displayName ?? "";
  String get email => currentUser?.email ?? "";

  Future<AuthResult> loginWithGoogle() async {
    final GoogleSignIn googleSignIn = GoogleSignIn(scopes: ['email']);
    final signInAccount = await googleSignIn.signIn();
    if(signInAccount == null){
      return AuthResult.aborted;
    }
    final googleAuth = await signInAccount.authentication;
    final oauthCredentials = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    try{
      await FirebaseAuth.instance.signInWithCredential(oauthCredentials);
      return AuthResult.success;
    }on FirebaseAuthException catch (e){
      return AuthResult.failure;
    }
  }
}