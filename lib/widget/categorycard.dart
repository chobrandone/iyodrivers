// import 'package:flutter/material.dart';
//
//
// import '../models/car.dart';
// import '../screens/book/book_now_screen.dart';
// // import 'categoryicon.dart';
//
// class CategoryCard extends StatelessWidget {
//   Category? category;
//   Function? onCardClick;
//
//   CategoryCard({ this.category, this.onCardClick });
//
//   @override
//   Widget build(BuildContext context) {
//     double w = MediaQuery.of(context).size.width;
//     double h = MediaQuery.of(context).size.height;
//     return GestureDetector(
//       onTap: () {
//         this.onCardClick!();
//       },
//       child: Container(
//           margin: EdgeInsets.all(20),
//           height: 150,
//           child:  Container(
//     // width: w * 0.85,
//     // height: h * 0.15,
//         margin: const EdgeInsets.only(left: 20, right: 20),
//             decoration: BoxDecoration(
//            color: const Color(0xffFFF9EE),
//             borderRadius: BorderRadius.circular(30),
//            boxShadow: [
//                  BoxShadow(
//                       blurRadius: 10,
//                     spreadRadius: 7,
//                     offset: const Offset(1, 1),
//                     color: Colors.grey.withOpacity(0.2))
//                            ]),
//         child: Row(
//     children: [
//     Expanded(child:   Column(
//     children: [
//     Transform.scale(
//     scale: 1.2,
//     child: Container(
//     padding: const EdgeInsets.only(left: 20),
//     // color: const Color(0xFFE8581C),
//     child: Image.asset(  'assets/images/' + this.category!.imgName! + '.png',)),
//     ),
//     // Container(
//     //
//     //   child: Image.asset("assets/images/toyota.png",
//     //
//     //     width: w*0.3,
//     //     height: h*0.095,),
//     // ),
//     const SizedBox(
//     height: 25,
//     ),
//     Container(
//     margin: const EdgeInsets.only(left: 20),
//     child: RichText(
//     text: TextSpan(
//     text: "this.category!.brand!",
//     style: const TextStyle(fontSize: 15, color: Color(0xff2F2E41)),
//     children: [
//     TextSpan(
//     text: "/JOUR",
//     style:
//     TextStyle(fontSize: 15, color: Colors.grey[500], fontWeight: FontWeight.bold),
//     ),
//     ]),
//     ))
//     ],
//     ),),
//     Column(
//     children: [
//     Container(
//     margin: const EdgeInsets.only(left: 10, top: 9),
//     alignment: Alignment.bottomRight,
//     child: const Text(
//     "this.category!.brand!",
//     textAlign: TextAlign.right,
//     style: TextStyle(color: Color(0xff2F2E41), fontWeight: FontWeight.bold, fontSize: 15),
//     ),
//     ),
//     Container(
//     margin: const EdgeInsets.only(left: 30, top: 5),
//     alignment: Alignment.bottomRight,
//     child: const Text(
//     "this.category!.year!",
//     textAlign: TextAlign.right,
//     style: TextStyle(),
//     ),
//     ),
//     GestureDetector(
//     onTap: () {
//     Navigator.of(context).push(MaterialPageRoute(builder: (context)=> const BookNowScreen()));
//     },
//     child:  Container(
//
//     alignment: Alignment.bottomRight,
//     margin: const EdgeInsets.only(top: 26, left: 46),
//     height: h * 0.05,
//     width: w * 0.35,
//     decoration: BoxDecoration(
//     color: const Color(0xffCEA110),
//     borderRadius:
//     const BorderRadius.only(bottomRight: Radius.circular(30), topLeft: Radius.circular(30)),
//     border: Border.all(width: 3, color: const Color(0xffCEA110), style: BorderStyle.solid)),
//     child: const Center(
//
//     child: Text(
//     " Réservez",
//     style: TextStyle(color: Colors.white, fontSize: 20),
//     )),
//     ),
//     )
//     ],
//     )
//     ],
//     ),
//     ),
//           // child: Stack(
//           //   children: [
//           //     Positioned.fill(
//           //       child: ClipRRect(
//           //         borderRadius: BorderRadius.circular(20),
//           //         child: Image.asset(
//           //             'assets/imgs/' + this.category!.imgName! + '.png',
//           //             fit: BoxFit.cover),
//           //       ),
//           //     ),
//           //     Positioned(
//           //       bottom: 0,
//           //       left: 0,
//           //       right: 0,
//           //       child: Container(
//           //           height: 120,
//           //           decoration: BoxDecoration(
//           //               borderRadius: BorderRadius.only(
//           //                   bottomLeft: Radius.circular(20),
//           //                   bottomRight: Radius.circular(20)),
//           //               gradient: LinearGradient(
//           //                   begin: Alignment.bottomCenter,
//           //                   end: Alignment.topCenter,
//           //                   colors: [
//           //                     Colors.black.withOpacity(0.7),
//           //                     Colors.transparent
//           //                   ]))),
//           //     ),
//           //     Positioned(
//           //       bottom: 0,
//           //       child: Padding(
//           //         padding: const EdgeInsets.all(10),
//           //         child: Row(
//           //           children: [
//           //             CategoryIcon(
//           //                 color: this.category!.color,
//           //                 iconName: this.category!.icon),
//           //             SizedBox(width: 10),
//           //             Text(this.category!.name!,
//           //                 style: TextStyle(color: Colors.white, fontSize: 25))
//           //           ],
//           //         ),
//           //       ),
//           //     )
//           //   ],
//           // )),
//     )
//     );
//   }
// }