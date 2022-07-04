

// import 'dart:js';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../screens/auth/login_screen.dart';
import '../screens/cars/available_cars_screen.dart';
import '../screens/welcome/splash_screen.dart';
// class Googlisingin{
//   final _auth = FirebaseAuth.instance;
//   final _googleSignIn = GoogleSignIn();
//
//   signInWithGoogle() async {
//     try {
//       final GoogleSignInAccount? googleSignInAccount =
//       await _googleSignIn.signIn();
//       if (googleSignInAccount != null) {
//
//        GoogleSignInAuthentication googleSignInAuthentication = await googleSignInAccount?.authentication;
//         final AuthCredential authCredential = GoogleAuthProvider.credential(
//             accessToken: googleSignInAuthentication.accessToken,
//             idToken: googleSignInAuthentication.idToken);
//             await _auth.signInWithCredential(authCredential).then((uid) => null);
//       }
//     } on FirebaseAuthException catch (e) {
//       print(e.message);
//       throw e;
//     }
//   }
//
// }
class Googlesignin{

  final _auth = FirebaseAuth.instance;
  final _googleSignIn = GoogleSignIn();
  signInWithGoogle() async {

    final GoogleSignInAccount? googleSignInAccount = await _googleSignIn.signIn();
    GoogleSignInAuthentication? googleAuth = await googleSignInAccount?.authentication;
    AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
          idToken: googleAuth?.idToken);
    UserCredential userCredential = await FirebaseAuth.instance.signInWithCredential(credential);
    print(userCredential.user?.displayName);


  }
}
signOut() {
  FirebaseAuth.instance.signOut();
}



