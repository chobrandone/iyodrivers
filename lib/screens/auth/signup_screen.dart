import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:iyodrivers/main_page.dart';
import 'package:iyodrivers/screens/cars/available_cars_screen.dart';

import '../../models/google_sign_in.dart';
import '../../models/user_model.dart';
import 'package:iyodrivers/services/auth_service.dart';
import 'login_screen.dart';
// import 'package:iyodriver/Screens/screens.dart';

class SignUpScreen extends StatefulWidget {
  // static const routeName = '/signup';

  const SignUpScreen({Key? key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {

  //form key
  final _formkey = GlobalKey<FormState>();

  //ediiting controller
  final nameEditingController  = new TextEditingController();
  final emailEditingController = new TextEditingController();
  final phoneNumberEditingController  = new TextEditingController();
  final passwordEditingController = new TextEditingController();
  final confirmPasswordEditingController = new TextEditingController();

  //firebase
  final _auth = FirebaseAuth.instance;

  // boolean loading
  bool loading =false;



  @override
  Widget build(BuildContext context) {

      //firstNameField
      final nameField =TextFormField(

        autofocus: false,
        controller: nameEditingController,
        keyboardType: TextInputType.emailAddress,

        // validator: () {},
        validator: (value) {
          RegExp regex = new RegExp(r'^.{3,}$');
          if (value!.isEmpty) {
            return (" Name cannot be Empty");
          }
          if (!regex.hasMatch(value)) {
            return (" Valid name(Min. 3 Character)");
          }
          return null;
        },


        onSaved :(value){
          nameEditingController.text=value!;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(

            hintText: "Name",
            prefixIcon: Icon(
              Icons.person,
              color: Color(0xffCEA110),
            ),
            contentPadding: EdgeInsets.fromLTRB(20, 15 , 20, 15),

            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30), borderSide: BorderSide(color: Colors.grey)),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30), borderSide: BorderSide(color: Colors.grey)),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(30))),

      );



      //emailField
      final emailField =TextFormField(

        autofocus: false,
        controller: emailEditingController,
        keyboardType: TextInputType.emailAddress,

        // validator: () {},
        validator: (value) {
          if (value!.isEmpty) {
            return ("Please Enter Your Email");
          }
          // reg expression for email validation
          if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
              .hasMatch(value)) {
            return ("Please Enter a valid email");
          }
          return null;
        },
        onSaved :(value){
          emailEditingController.text=value!;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(

            hintText: "email",
            prefixIcon: Icon(
              Icons.email,
              color: Color(0xffCEA110),
            ),
            contentPadding: EdgeInsets.fromLTRB(20, 15 , 20, 15),

            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30), borderSide: BorderSide(color: Colors.grey)),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30), borderSide: BorderSide(color: Colors.grey)),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(30))),

      );
      //phoneNumberField
      final phoneNumberField =TextFormField(

        autofocus: false,
        controller: phoneNumberEditingController,
        keyboardType: TextInputType.emailAddress,

        // validator: () {},
        validator: (value) {
          if (value!.isEmpty) {
            return ("Please Enter Your Email");
          }
          // reg expression for email validation
          if (!RegExp("^[0-9+_.-]")
              .hasMatch(value)) {
            return ("Please Enter a valid phone number");
          }
          return null;
        },
        onSaved :(value){
          phoneNumberEditingController.text=value!;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(

            hintText: "phone number",
            prefixIcon: Icon(
              Icons.call,
              color: Color(0xffCEA110),
            ),
            contentPadding: EdgeInsets.fromLTRB(20, 15 , 20, 15),

            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30), borderSide: BorderSide(color: Colors.grey)),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30), borderSide: BorderSide(color: Colors.grey)),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(30))),

      );

      //passwordField
      final passwordField =TextFormField(
        obscureText: true,
        autofocus: false,
        controller: passwordEditingController,


        // validator: () {},
        validator: (value) {
          RegExp regex = new RegExp(r'^.{6,}$');
          if (value!.isEmpty) {
            return ("Password is required for login");
          }
          if (!regex.hasMatch(value)) {
            return ("Enter Valid Password(Min. 6 Character)");
          }
        },

        onSaved :(value){
          passwordEditingController.text=value!;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(

            hintText: "password",
            prefixIcon: Icon(
              Icons.password_outlined,
              color: Color(0xffCEA110),
            ),
            contentPadding: EdgeInsets.fromLTRB(20, 15 , 20, 15),

            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30), borderSide: BorderSide(color: Colors.grey)),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30), borderSide: BorderSide(color: Colors.grey)),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(30))),

      );

      //confirmPasswordField
      final confirmPasswordField =TextFormField(
        obscureText: true,
        autofocus: false,
        controller: confirmPasswordEditingController,


        // validator: () {},
        validator: (value) {
          if (confirmPasswordEditingController.text !=
              passwordEditingController.text) {
            return "Password don't match";
          }
          return null;
        },
        onSaved :(value){
          confirmPasswordEditingController.text=value!;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(

            hintText: "confirm password",
            prefixIcon: Icon(
              Icons.password_outlined,
              color: Color(0xffCEA110),
            ),
            contentPadding: EdgeInsets.fromLTRB(20, 15 , 20, 15),

            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30), borderSide: BorderSide(color: Colors.grey)),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30), borderSide: BorderSide(color: Colors.grey)),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(30))),

      );

      final signUpButton= Material(
        elevation: 5,
        borderRadius: BorderRadius.circular(30),
        color: Color(0xffCEA110),
        child: MaterialButton(
          padding: EdgeInsets.fromLTRB(20, 15 , 20, 15),
          minWidth: 350,
          onPressed:() {

            signUp(emailEditingController.text, passwordEditingController.text);

          },

          child: Text("Inscrire",textAlign: TextAlign.center, style: TextStyle(color: Colors.white,fontSize: 20),),
        ),
      );
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
          child:Container(
            // margin: EdgeInsets.fromLTRB(20, 20, 20, 20),
            //  decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(30), boxShadow: [
            //    BoxShadow(blurRadius: 10,spreadRadius: 7,offset: Offset(1,1), color: Colors.grey.withOpacity(0.2))
            //  ]),
            // color: Colors.white,
            child: Form(
              key: _formkey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  // Container(
                  //   child: Image.asset("assets/logo.png"),
                  // ),
                  Container(
                    height: 250,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(bottomLeft: Radius.circular(90)),
                      color: new Color(0xffF5591F),
                      gradient: LinearGradient(
                        colors: [
                          (new Color(0xffCEA110)),
                          new Color(0xff2F2E41),
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                    ),
                    child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              // margin: EdgeInsets.only( top: 20),
                             // padding: EdgeInsets.only(top: 30),
                             child:  IconButton(icon: Icon(Icons.arrow_back, color: Colors.grey,),
                      onPressed: (){
                        //paasin this to our root
                        // Navigator.of(context).pop();
                      },
                    ),
                            ),
                            Container(
                              // margin: EdgeInsets.only(top: ),
                              child: Image.asset(
                                "assets/images/logowhite.png",
                                height: 200,
                                width: 200,
                              ),
                            ),
                          ],
                        )),
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 20, top: 20),
                    alignment: Alignment.center,
                    child: Text(
                      "SE CONNECTER",
                      style: TextStyle(fontSize: 20, color: Color(0xffCEA110)),
                    ),
                  ),
                  SizedBox(height: 20,),
               Container(
                 margin: EdgeInsets.fromLTRB(20, 20, 20, 20),
                 child: Column(
                   children: [
                     Container(
                       // decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(30), boxShadow: [
                       //   BoxShadow(blurRadius: 10, spreadRadius: 7, offset: Offset(1, 1), color: Colors.grey.withOpacity(0.2))
                       // ]),
                       child: nameField,
                     ),
                     SizedBox(height: 20,),
                     Container(
                       // decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(30), boxShadow: [
                       //   BoxShadow(blurRadius: 10, spreadRadius: 7, offset: Offset(1, 1), color: Colors.grey.withOpacity(0.2))
                       // ]),
                       child: emailField,
                     ),
                     SizedBox(height: 20,),
                     Container(
                       // decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(30), boxShadow: [
                       //   BoxShadow(blurRadius: 10, spreadRadius: 7, offset: Offset(1, 1), color: Colors.grey.withOpacity(0.2))
                       // ]),
                       child: phoneNumberField,
                     ),

                     SizedBox(height: 20,),
                     Container(
                       // decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(30), boxShadow: [
                       //   BoxShadow(blurRadius: 10, spreadRadius: 7, offset: Offset(1, 1), color: Colors.grey.withOpacity(0.2))
                       // ]),
                       child: passwordField,
                     ),
                     SizedBox(height: 20,),
                     Container(
                       // decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(30), boxShadow: [
                       //   BoxShadow(blurRadius: 10, spreadRadius: 7, offset: Offset(1, 1), color: Colors.grey.withOpacity(0.2))
                       // ]),
                       child: confirmPasswordField,
                     ),
                     SizedBox(height: 30,),
                     loading ? CircularProgressIndicator(): Container(child: signUpButton,),
                   ],
                 ),
               ),
                  SizedBox(height: 10,),
                  Container(
                    child: Text(
                      "ou",
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        child: Image.asset(
                          "assets/images/call.png",
                          // height: 200,
                          // width: 300,
                        ),
                      ),
                      GestureDetector(
                        onTap: () async{
                          await Googlesignin().signInWithGoogle();
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => AvailableCarsScreen()));

                        },
                        child: Container(
                          margin: EdgeInsets.only(right: 20, left: 20),
                          child: Image.asset(
                            "assets/images/google.png",
                            // height: 200,
                            // width: 300,
                          ),
                        ),
                      ),
                      Container(
                        child: Image.asset(
                          "assets/images/facebook.png",
                          // height: 200,
                          // width: 300,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,

                    children: <Widget>[
                      Text("Vousavez un compte? "),
                      SizedBox(width: 10,),
                      GestureDetector(

                        onTap: (){
                          Navigator.pop(context);
                        },
                        child: Text("Connecte Vouz",style: TextStyle(fontSize: 20,color: Color(0xffCEA110),fontWeight: FontWeight.w500),),
                      )
                    ],
                  ),
                  SizedBox(height: 30,),

                ],),
            ),
          ) ,

        ),
      ),

    );
  }
  void signUp(String email, String password) async {
    if(_formkey.currentState!.validate()){
      setState(() {
        loading= true;
      });
      await _auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) => {postDetailsToFirestore()
      }).catchError((e){
        Fluttertoast.showToast(msg: e!.message);
      });
      setState(() {
        loading = false;
      });

    }
  }

  postDetailsToFirestore() async {


    // calling our firestore
    // calling our user model
    // sedning these values

    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    User? user = _auth.currentUser;

    UserModel userModel = UserModel();

    // writing all the values
    userModel.email = user!.email;
    userModel.uid = user.uid;
    userModel.name = nameEditingController.text;
    userModel.phoneNumber = phoneNumberEditingController.text;


    await firebaseFirestore
        .collection("users")
        .doc(user.uid)
        .set(userModel.toMap());
    Fluttertoast.showToast(msg: "Account created successfully :) ");


    Navigator.pushAndRemoveUntil(
        (context),
        MaterialPageRoute(builder: (context) => AvailableCarsScreen()),
            (route) => false);

  }

}
