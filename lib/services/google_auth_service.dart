import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_authentication/widgets/utils.dart';

// try 2
class AuthService {
  final _auth = FirebaseAuth.instance;

  Future<UserCredential?> loginWithGoogle() async {
    try {

      final googleUser = await GoogleSignIn().signIn();


      if (googleUser == null) {
        Utils().toastMessage("Google sign-in was cancelled");
        return null;
      }

      final googleAuth = await googleUser.authentication;


      final cred = GoogleAuthProvider.credential(
        idToken: googleAuth.idToken,
        accessToken: googleAuth.accessToken,
      );

      return await _auth.signInWithCredential(cred);
    } catch (e) {
      Utils().toastMessage(e.toString());
      return null;
    }
  }
}
