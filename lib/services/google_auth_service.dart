import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_authentication/widgets/utils.dart';

class AuthService {
  final _auth = FirebaseAuth.instance;

  Future<UserCredential?> loginWithGoogle() async {
    try {
      // Trigger the Google Sign-In flow
      final googleUser = await GoogleSignIn().signIn();

      // Handle null case when user cancels sign-in
      if (googleUser == null) {
        Utils().toastMessage("Google sign-in was cancelled");
        return null;
      }

      // Obtain authentication details from the request
      final googleAuth = await googleUser.authentication;

      // Create a new credential
      final cred = GoogleAuthProvider.credential(
        idToken: googleAuth.idToken,
        accessToken: googleAuth.accessToken,
      );

      // Sign in with the credential
      return await _auth.signInWithCredential(cred);
    } catch (e) {
      Utils().toastMessage(e.toString());
      return null;
    }
  }
}
