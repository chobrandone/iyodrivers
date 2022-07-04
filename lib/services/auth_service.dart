import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../screens/cars/available_cars_screen.dart';

class AuthMethods extends StatefulWidget {
  const AuthMethods({Key? key}) : super(key: key);

  @override
  _AuthMethodsState createState() => _AuthMethodsState();
}

class _AuthMethodsState extends State<AuthMethods> {
  //form key
  final _formkey = GlobalKey<FormState>();

  //ediiting controller
  final TextEditingController emailController = new TextEditingController();
  final TextEditingController passWordContreller = new TextEditingController();

//firebase
  final _auth = FirebaseAuth.instance;
//loader
  bool loading =false;
  @override
  Widget build(BuildContext context) {
    return Container();
  }

  void signIn(String email, String password) async {
    final _formkey = GlobalKey<FormState>();
    if(_formkey.currentState!.validate()){
      setState(() {
        loading= true;
      });
      await _auth.signInWithEmailAndPassword(email: email, password: password)
          .then((uid) => {
        Fluttertoast.showToast(msg:"Login Successful"),
        Navigator.push(context, MaterialPageRoute(builder: (context) => AvailableCarsScreen()))
        // Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=> const AvailableCarsScreen()))
      }).catchError((e){
        Fluttertoast.showToast(msg:e!.message);
        setState(() {
          loading= false;
        });
      });
    }
  }

//Sign out
  signOut() {
    FirebaseAuth.instance.signOut();
  }
}
