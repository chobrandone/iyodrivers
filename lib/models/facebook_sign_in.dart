//
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:google_sign_in/google_sign_in.dart';
//
// import '../utils/showSnackbar.dart';
//
// class FacebookSignin{
//   final _auth = FirebaseAuth.instance;
//   final _facebookSignIn = FacebookSignin();
//   signInWithFacebaook() async {
//
//       // final GoogleSignInAccount? googleSignInAccount = await _googleSignIn.signIn();
//       final LoginResult loginResult = await _facebookSignIn.signIn();
//
//       final OAuthCredential facebookAuthCredential =
//       FacebookAuthProvider.credential(loginResult.accessToken!.token);
//
//       await _auth.signInWithCredential(facebookAuthCredential);
//
//   }
//
// }
