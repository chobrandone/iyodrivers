
import 'package:flutter/cupertino.dart';


import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

//
class ResetPassword extends StatefulWidget {
  const ResetPassword({Key? key}) : super(key: key);

  @override
  _ResetPasswordState createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
 // form key
  final _formkey = GlobalKey<FormState>();

  //ediiting controller
  final TextEditingController emailController = new TextEditingController();

  // final TextEditingController passWordContreller = new TextEditingController();

//firebase
  final _auth = FirebaseAuth.instance;
//loader
  bool loading =false;

  @override
  Widget build(BuildContext context) {
   // emailfield
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
        final loginButton= Material(

      elevation: 8,
      borderRadius: BorderRadius.circular(30),

      color: Color(0xffCEA110),
      child: MaterialButton(
        padding: EdgeInsets.fromLTRB(20, 15 , 20, 15),

        minWidth: 350,
        onPressed:() {
FirebaseAuth.instance.sendPasswordResetEmail(email: emailController.text).then((value) => Navigator.of(context).pop());
        },
        child: Text("Reset",textAlign: TextAlign.center, style: TextStyle(color: Colors.white,fontSize: 20),),
      ),
    );
    double w = MediaQuery.of(context).size.width;
 double h = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
          child:Container(


            child: Form(
              key: _formkey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[


                  Container(
                    margin: EdgeInsets.fromLTRB(20, 20, 20, 20),
                    child: Column(
                      children: [

                        Container(
                          margin: EdgeInsets.only(right: 20, top: 20),
                          padding: EdgeInsets.only(right: 20, left: 25),
                          alignment: Alignment.center,
                          child: Text(
                            "reset password",
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
                        loading ? CircularProgressIndicator(): Container(
                          child: loginButton,),



                      ],
                    ),
                  ),
                  SizedBox(height: 13,),


             ]
            ),
          ) ,

        ),
      ),
      )
    );
  }
}






