import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:iyodrivers/screens/auth/login_screen.dart';
import 'package:iyodrivers/screens/cars/available_cars_screen.dart';
import 'package:iyodrivers/screens/screens.dart';

class AuthService{



  handleAuthState() {
  return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (BuildContext context, snapshot) {
        if (snapshot.hasData) {
          return LoginScreen();
        } else {
          return const SplashScreen();
        }
      });
}
  signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn(
        scopes: <String>["email"]).signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication googleAuth = await googleUser!.authentication;


    //
    // if (googleAuth?.accessToken != null && googleAuth?.idToken != null) {
    //   // Create a new credential
    //   final credential = GoogleAuthProvider.credential(
    //     accessToken: googleAuth?.accessToken,
    //     idToken: googleAuth?.idToken,
    //   );
    //   UserCredential userCredential =
    //   await _auth.signInWithCredential(credential);}

    // Create a new credential


    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }
//Sign out
  signOut() {
    FirebaseAuth.instance.signOut();
  }

}