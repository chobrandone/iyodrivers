import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:iyodrivers/screens/screens.dart';
import 'package:iyodrivers/routes/route.dart';

import '../../models/user_model.dart';

class AvailableCarsScreen extends StatefulWidget {
  static const routeName = '/available-cars';

  const AvailableCarsScreen({Key? key}) : super(key: key);

  @override
  _AvailableCarsScreenState createState() => _AvailableCarsScreenState();
}

class _AvailableCarsScreenState extends State<AvailableCarsScreen> {

  User? user = FirebaseAuth.instance.currentUser;
  UserModel loggedInUser = UserModel();

  @override
  void initState() {
    super.initState();
    FirebaseFirestore.instance
        .collection("users")
        .doc(user!.uid)
        .get()
        .then((value) {
      this.loggedInUser = UserModel.fromMap(value.data());
      setState(() {});
    });
  }
  @override
  Widget build(BuildContext context) {
    return initWidget();
  }

  initWidget() {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
       Container(
         margin: EdgeInsets.only(left: 20,right: 20,top: 10),
         child: Row(
           children: [
            Expanded(child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(

                  child: Text(
                      "welcome", style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600),),
                ),
                Text("${loggedInUser.name  }",style: TextStyle(fontWeight: FontWeight.w200,fontSize: 20),),
              ],
            ),
            ),
             Column(
               children: [
                 Container(
                   decoration: const BoxDecoration(),
                   child: Container(
                     width:50,
                     // height: 350.0,
                     child: Center(
                       child: Column(
                         children: const [
                           CircleAvatar(
                             backgroundImage: AssetImage(
                               "assets/images/pic.png",
                             ),
                             radius: 50.0,

                           )

                         ],
                       ),
                     ),
                   ),
                 )
               ],
             )
           ],
         ),
       ),
            Container(
              margin: const EdgeInsets.only(top: 20),
              alignment: Alignment.center,
              child: const Text(
                "Choisissez une voiture",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400, color: Color(0xff2F2E41)),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Container(
              // width: w * 0.85,
              // height: h * 0.15,
              margin: const EdgeInsets.only(left: 20, right: 20),
              decoration: BoxDecoration(
                  color: const Color(0xffFFF9EE),
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: [
                    BoxShadow(
                        blurRadius: 10,
                        spreadRadius: 7,
                        offset: const Offset(1, 1),
                        color: Colors.grey.withOpacity(0.2))
                  ]),
              child: Row(
                children: [
                Expanded(child:   Column(
                  children: [
                    Transform.scale(
                      scale: 1.2,
                      child: Container(
                          padding: const EdgeInsets.only(left: 20),
                          // color: const Color(0xFFE8581C),
                          child: Image.asset("assets/images/toyota1.png")),
                    ),
                    // Container(
                    //
                    //   child: Image.asset("assets/images/toyota.png",
                    //
                    //     width: w*0.3,
                    //     height: h*0.095,),
                    // ),
                    const SizedBox(
                      height: 25,
                    ),
                    Container(
                        margin: const EdgeInsets.only(left: 20),
                        child: RichText(
                          text: TextSpan(
                              text: "35,000FCA",
                              style: const TextStyle(fontSize: 15, color: Color(0xff2F2E41)),
                              children: [
                                TextSpan(
                                  text: "/JOUR",
                                  style:
                                  TextStyle(fontSize: 15, color: Colors.grey[500], fontWeight: FontWeight.bold),
                                ),
                              ]),
                        ))
                  ],
                ),),
                  Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(left: 10, top: 9),
                        alignment: Alignment.bottomRight,
                        child: const Text(
                          "TOYOTA VITZ",
                          textAlign: TextAlign.right,
                          style: TextStyle(color: Color(0xff2F2E41), fontWeight: FontWeight.bold, fontSize: 15),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 30, top: 5),
                        alignment: Alignment.bottomRight,
                        child: const Text(
                          "2009",
                          textAlign: TextAlign.right,
                          style: TextStyle(),
                        ),
                      ),
                     GestureDetector(
                       onTap: () {
                         Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=> const BookNowScreen()));
                       },
                       child:  Container(

                         alignment: Alignment.bottomRight,
                         margin: const EdgeInsets.only(top: 26, left: 46),
                         height: h * 0.05,
                         width: w * 0.35,
                         decoration: BoxDecoration(
                             color: const Color(0xffCEA110),
                             borderRadius:
                             const BorderRadius.only(bottomRight: Radius.circular(30), topLeft: Radius.circular(30)),
                             border: Border.all(width: 3, color: const Color(0xffCEA110), style: BorderStyle.solid)),
                         child: const Center(

                             child: Text(
                               " Réservez",
                               style: TextStyle(color: Colors.white, fontSize: 20),
                             )),
                       ),
                     )
                    ],
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Container(
              // width: w * 0.85,
              // height: h * 0.15,
              margin: const EdgeInsets.only(left: 20, right: 20),
              decoration: BoxDecoration(
                  color: const Color(0xffFFF9EE),
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: [
                    BoxShadow(
                        blurRadius: 10,
                        spreadRadius: 7,
                        offset: const Offset(1, 1),
                        color: Colors.grey.withOpacity(0.2))
                  ]),
              child: Row(
                children: [
                 Expanded(child:  Column(
                   children: [
                     Transform.scale(
                       scale: 1.2,
                       child: Container(
                           padding: const EdgeInsets.only(left: 20),
                           // color: const Color(0xFFE8581C),
                           child: Image.asset("assets/images/toyota.png")),
                     ),
                     // Container(
                     //
                     //   child: Image.asset("assets/images/toyota.png",
                     //
                     //     width: w*0.3,
                     //     height: h*0.095,),
                     // ),
                     const SizedBox(
                       height: 25,
                     ),
                     Container(
                         margin: const EdgeInsets.only(left: 20),
                         child: RichText(
                           text: TextSpan(
                               text: "35,000FCA",
                               style: const TextStyle(fontSize: 15, color: Color(0xff2F2E41)),
                               children: [
                                 TextSpan(
                                   text: "/JOUR",
                                   style:
                                   TextStyle(fontSize: 15, color: Colors.grey[500], fontWeight: FontWeight.bold),
                                 ),
                               ]),
                         ))
                   ],
                 ),),
                  Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(left: 10, top: 9),
                        alignment: Alignment.bottomRight,
                        child: const Text(
                        "TOYOTA VITZ",
                          textAlign: TextAlign.right,
                          style: TextStyle(color: Color(0xff2F2E41), fontWeight: FontWeight.bold, fontSize: 15),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 30, top: 5),
                        alignment: Alignment.bottomRight,
                        child: const Text(
                          "2009",
                          textAlign: TextAlign.right,
                          style: TextStyle(),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, BookNowScreen.routeName);
                        },
                        child:  Container(

                          alignment: Alignment.bottomRight,
                          margin: const EdgeInsets.only(top: 26, left: 35),
                          height: h * 0.05,
                          width: w * 0.35,
                          decoration: BoxDecoration(
                              color: const Color(0xffCEA110),
                              borderRadius:
                              const BorderRadius.only(bottomRight: Radius.circular(30), topLeft: Radius.circular(30)),
                              border: Border.all(width: 3, color: const Color(0xffCEA110), style: BorderStyle.solid)),
                          child: const Center(

                              child: Text(
                                " Réservez",
                                style: TextStyle(color: Colors.white, fontSize: 20),
                              )),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Container(
              // width: w * 0.85,
              // height: h * 0.15,
              margin: const EdgeInsets.only(left: 20, right: 20),
              decoration: BoxDecoration(
                  color: const Color(0xffFFF9EE),
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: [
                    BoxShadow(
                        blurRadius: 10,
                        spreadRadius: 7,
                        offset: const Offset(1, 1),
                        color: Colors.grey.withOpacity(0.2))
                  ]),
              child: Row(
                children: [
                 Expanded(child:  Column(
                   children: [
                     Transform.scale(
                       scale: 1.2,
                       child: Container(
                           padding: const EdgeInsets.only(left: 20),
                           // color: const Color(0xFFE8581C),
                           child: Image.asset(
                             "assets/images/jeep.png",
                           )),
                     ),
                     // Container(
                     //
                     //   child: Image.asset("assets/images/toyota.png",
                     //
                     //     width: w*0.3,
                     //     height: h*0.095,),
                     // ),
                     const SizedBox(
                       height: 25,
                     ),
                     Container(
                         margin: const EdgeInsets.only(left: 20),
                         child: RichText(
                           text: TextSpan(
                               text: "70,000FCA",
                               style: const TextStyle(fontSize: 15, color: Color(0xff2F2E41)),
                               children: [
                                 TextSpan(
                                   text: "/JOUR",
                                   style:
                                   TextStyle(fontSize: 15, color: Colors.grey[500], fontWeight: FontWeight.bold),
                                 ),
                               ]),
                         ))
                   ],
                 ),),
                  Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(left: 10, top: 9),
                        alignment: Alignment.bottomRight,
                        child: const Text(
                          "NISSAN PATHFINDER",
                          textAlign: TextAlign.right,
                          style: TextStyle(color: Color(0xff2F2E41), fontWeight: FontWeight.bold, fontSize: 15),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 30, top: 5),
                        alignment: Alignment.bottomRight,
                        child: const Text(
                          "2009",
                          textAlign: TextAlign.right,
                          style: TextStyle(),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, BookNowScreen.routeName);
                        },
                        child:  Container(

                          alignment: Alignment.bottomRight,
                          margin: const EdgeInsets.only(top: 26, left: 55),
                          height: h * 0.05,
                          width: w * 0.35,
                          decoration: BoxDecoration(
                              color: const Color(0xffCEA110),
                              borderRadius:
                              const BorderRadius.only(bottomRight: Radius.circular(30), topLeft: Radius.circular(30)),
                              border: Border.all(width: 3, color: const Color(0xffCEA110), style: BorderStyle.solid)),
                          child: const Center(

                              child: Text(
                                " Réservez",
                                style: TextStyle(color: Colors.white, fontSize: 20),
                              )),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Container(
              // width: w * 0.85,
              // height: h * 0.15,
              margin: const EdgeInsets.only(left: 20, right: 20),
              decoration: BoxDecoration(
                  color: const Color(0xffFFF9EE),
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: [
                    BoxShadow(
                        blurRadius: 10,
                        spreadRadius: 7,
                        offset: const Offset(1, 1),
                        color: Colors.grey.withOpacity(0.2))
                  ]),
              child: Row(
                children: [
               Expanded(child:    Column(
                 children: [
                   Transform.scale(
                     scale: 1.2,
                     child: Container(
                         padding: const EdgeInsets.only(left: 20),
                         // color: const Color(0xFFE8581C),
                         child: Image.asset("assets/images/hilux.png")),
                   ),
                   // Container(
                   //
                   //   child: Image.asset("assets/images/toyota.png",
                   //
                   //     width: w*0.3,
                   //     height: h*0.095,),
                   // ),
                   const SizedBox(
                     height: 25,
                   ),
                   Container(
                       margin: const EdgeInsets.only(left: 20),
                       child: RichText(
                         text: TextSpan(
                             text: "70,000FCA",
                             style: const TextStyle(fontSize: 15, color: Color(0xff2F2E41)),
                             children: [
                               TextSpan(
                                 text: "/JOUR",
                                 style:
                                 TextStyle(fontSize: 15, color: Colors.grey[500], fontWeight: FontWeight.bold),
                               ),
                             ]),
                       ))
                 ],
               ),),
                  Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(left: 10, top: 9),
                        alignment: Alignment.bottomRight,
                        child: const Text(
                          "TOYOTA HILUX",
                          textAlign: TextAlign.right,
                          style: TextStyle(color: Color(0xff2F2E41), fontWeight: FontWeight.bold, fontSize: 15),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 30, top: 5),
                        alignment: Alignment.bottomRight,
                        child: const Text(
                          "2009",
                          textAlign: TextAlign.right,
                          style: TextStyle(),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, BookNowScreen.routeName);
                        },
                        child:  Container(

                          alignment: Alignment.bottomRight,
                          margin: const EdgeInsets.only(top: 26, left: 46),
                          height: h * 0.05,
                          width: w * 0.35,
                          decoration: BoxDecoration(
                              color: const Color(0xffCEA110),
                              borderRadius:
                              const BorderRadius.only(bottomRight: Radius.circular(30), topLeft: Radius.circular(30)),
                              border: Border.all(width: 3, color: const Color(0xffCEA110), style: BorderStyle.solid)),
                          child: const Center(

                              child: Text(
                                " Réservez",
                                style: TextStyle(color: Colors.white, fontSize: 20),
                              )),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Container(
              // width: w * 0.85,
              // height: h * 0.15,
              margin: const EdgeInsets.only(left: 20, right: 20),
              decoration: BoxDecoration(
                  color: const Color(0xffFFF9EE),
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: [
                    BoxShadow(
                        blurRadius: 10,
                        spreadRadius: 7,
                        offset: const Offset(1, 1),
                        color: Colors.grey.withOpacity(0.2))
                  ]),
              child: Row(
                children: [
                 Expanded(child:  Column(
                   children: [
                     Transform.scale(
                       scale: 1.2,
                       child: Container(
                           padding: const EdgeInsets.only(left: 20),
                           // color: const Color(0xFFE8581C),
                           child: Image.asset("assets/images/toyota.png")),
                     ),
                     // Container(
                     //
                     //   child: Image.asset("assets/images/toyota.png",
                     //
                     //     width: w*0.3,
                     //     height: h*0.095,),
                     // ),
                     const SizedBox(
                       height: 25,
                     ),
                     Container(
                         margin: const EdgeInsets.only(left: 20),
                         child: RichText(
                           text: TextSpan(
                               text: "100,000FCA",
                               style: const TextStyle(fontSize: 15, color: Color(0xff2F2E41)),
                               children: [
                                 TextSpan(
                                   text: "/JOUR",
                                   style:
                                   TextStyle(fontSize: 15, color: Colors.grey[500], fontWeight: FontWeight.bold),
                                 ),
                               ]),
                         ))
                   ],
                 ),),
                  Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(left: 10, top: 9),
                        alignment: Alignment.bottomRight,
                        child: const Text(
                          "TOYOTA VITZ",
                          textAlign: TextAlign.right,
                          style: TextStyle(color: Color(0xff2F2E41), fontWeight: FontWeight.bold, fontSize: 15),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 30, top: 5),
                        alignment: Alignment.bottomRight,
                        child: const Text(
                          "2009",
                          textAlign: TextAlign.right,
                          style: TextStyle(),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, BookNowScreen.routeName);
                        },
                        child: Container(
                          alignment: Alignment.bottomRight,
                          margin: const EdgeInsets.only(top: 25, left: 35),
                          height: h * 0.05,
                          width: w * 0.35,
                          decoration: BoxDecoration(
                              color: const Color(0xffCEA110),
                              borderRadius: const BorderRadius.only(
                                  bottomRight: Radius.circular(30), topLeft: Radius.circular(30)),
                              border: Border.all(width: 3, color: const Color(0xffCEA110), style: BorderStyle.solid)),
                          child: const Center(
                            child: Text(
                              " Réservez",
                              style: TextStyle(color: Colors.white, fontSize: 20),
                            ),
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }


}
