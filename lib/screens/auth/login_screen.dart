import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:iyodrivers/main_page.dart';
import 'package:iyodrivers/screens/auth/signup_screen.dart';
import 'package:iyodrivers/screens/screens.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:iyodrivers/services/auth_service.dart';
import 'package:iyodrivers/services/firebase_auth_methods.dart';

import '../../models/google_sign_in.dart';
class LoginScreen extends StatefulWidget {
  static const routeName = '/login';

  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

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

    //emailfield
    final emailField =TextFormField(

      autofocus: false,
      controller: emailController,
      keyboardType: TextInputType.emailAddress,

      validator:(value){
        if(value!.isEmpty){
          return ("Please enter your email");
        }
        // reg expression for email validate
        if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
            .hasMatch(value)) {
          return ("Please Enter a valid email");
        }
        return null;
      },
      onSaved :(value){
        emailController.text=value!;
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
    //passwordfield
    final passwordField =TextFormField(

      autofocus: false,
      controller:passWordContreller,
      obscureText: true,


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
        passWordContreller.text=value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(

          hintText: "Mot de passe",

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
    final loginButton= Material(

      elevation: 8,
      borderRadius: BorderRadius.circular(30),

      color: Color(0xffCEA110),
      child: MaterialButton(
        padding: EdgeInsets.fromLTRB(20, 15 , 20, 15),

        minWidth: 350,
        onPressed:() {
          signIn(emailController.text, passWordContreller.text);
        },
        child: Text("Login",textAlign: TextAlign.center, style: TextStyle(color: Colors.white,fontSize: 20),),
      ),
    );    final googleButon= Material(

      elevation: 8,
      borderRadius: BorderRadius.circular(30),


      color: Colors.white,

      child: MaterialButton(

        padding: EdgeInsets.fromLTRB(20, 15 , 20, 15),


        minWidth: 350,
        onPressed:() async{
          await Googlesignin().signInWithGoogle();
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => AvailableCarsScreen()));

        },

        child: Text("Google",textAlign: TextAlign.center, style: TextStyle(color: Colors.white,fontSize: 20),),
      ),

    );
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
          child:Container(

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
                          children: [
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
                    margin: EdgeInsets.fromLTRB(20, 20, 20, 20),
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.only(right: 20, top: 10),
                          alignment: Alignment.center,
                          child: Text(
                            "SE CONNECTER",
                            style: TextStyle(fontSize: 20, color: Color(0xffCEA110)),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(right: 20, top: 20),
                          padding: EdgeInsets.only(right: 20, left: 25),
                          alignment: Alignment.center,
                          child: Text(
                            "Entrez votre numéro de téléphone mobile ou votre e-mail pour vous connecter",
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 15, color: Color(0xff2F2E41)),
                          ),
                        ),
                        SizedBox(height: 20,),
                        Container(

                          // decoration: BoxDecoration(
                          //
                          //     color: Colors.white, borderRadius: BorderRadius.circular(30), boxShadow: [
                          //   BoxShadow(blurRadius: 10, spreadRadius: 7, offset: Offset(1, 1), color: Colors.grey.withOpacity(0.3))
                          // ]),
                          child: emailField,
                        ),

                        SizedBox(height: 20,),
                        Container(
                          // decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(30), boxShadow: [
                          //   BoxShadow(blurRadius: 10, spreadRadius: 7, offset: Offset(1, 1), color: Colors.grey.withOpacity(0.2))
                          // ]),
                          child: passwordField,
                        ),
                        SizedBox(height: 13,),
                        Container(
                          alignment: Alignment.topRight,
                          margin: EdgeInsets.only(right: 12),
                          child: Text("Forgot password",
                          textDirection: TextDirection.ltr,
                          textAlign: TextAlign.right,
                          ),
                        ),
                        SizedBox(height: 30,),
                        loading ? CircularProgressIndicator(): Container(
                          child: loginButton,),
                      ],
                    ),
                  ),
                  SizedBox(height: 13,),
                  Container(
                    child: Text(
                      "ou",
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget> [

                      // SignInButton(
                      //   Buttons.Google,
                      //   onPressed: () {},
                      // )

// with custom text
                      loading ? CircularProgressIndicator(): Container(
                        width: w*0.5,

                        padding: EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50)
                        ),
                        child: SignInButton(

                          Buttons.Google,
                          text: "Google",
                          onPressed: () async {
                            await Googlesignin().signInWithGoogle();
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) => AvailableCarsScreen()));

                          },
                        ),
                      ),

                      Container(
                        width: w*0.5,
                        // margin: EdgeInsets.only(right: 20),
                        padding: EdgeInsets.all(20),
                        child: SignInButton(
                          Buttons.Facebook,
                          text: "Facebook",
                          onPressed: () {
                            // await signInWithFacebook().signInWithGoogle();
                            // Navigator.push(context,
                            //     MaterialPageRoute(builder: (context) => AvailableCarsScreen()));

                          },
                        ),
                      ),


                      // Container(
                      //     height: 200,
                      //     alignment: Alignment.center,
                      //     padding: EdgeInsets.all(20),
                      //     child: ElevatedButton.icon(
                      //       onPressed: (){
                      //         print("You pressed Icon Elevated Button");
                      //       },
                      //       icon: Icon(Icons.facebook_outlined),  //icon data for elevated button
                      //       label: Text("Elevated Button with Icon"), //label text
                      //       style: ElevatedButton.styleFrom(
                      //           primary: Colors.blueAccent //elevated btton background color
                      //       ),
                      //     ),
                      // )



                    ]
                  ),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.center,
                  //   children: [
                  //     Container(
                  //       child: Image.asset(
                  //         "assets/images/call.png",
                  //         // height: 200,
                  //         // width: 300,
                  //       ),
                  //     ),
                  //     GestureDetector(
                  //
                  //       onTap: () async{
                  //         await Googlesignin().signInWithGoogle();
                  //         Navigator.push(context,
                  //             MaterialPageRoute(builder: (context) => AvailableCarsScreen()));
                  //
                  //       },
                  //       child: Container(
                  //         margin: EdgeInsets.only(right: 20, left: 20),
                  //         child: Image.asset(
                  //           "assets/images/google.png",
                  //           // height: 200,
                  //           // width: 300,
                  //         ),
                  //       ),
                  //     ),
                  //     Container(
                  //       child: Image.asset(
                  //         "assets/images/facebook.png",
                  //         // height: 200,
                  //         // width: 300,
                  //       ),
                  //     ),
                  //   ],
                  // ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text("Vous n'avez pas de compte? "),
                      SizedBox(width: 10,),
                      GestureDetector(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => SignUpScreen()));

                        },
                        child: Text("S'inscrire",style: TextStyle(fontSize: 20,color: Color(0xffCEA110),fontWeight: FontWeight.bold),),
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
  void signIn(String email, String password) async {
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




}
class _auth {
}




