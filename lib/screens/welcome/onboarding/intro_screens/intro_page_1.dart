import 'package:flutter/material.dart';
class IntroPage1 extends StatefulWidget {
  const IntroPage1({Key? key}) : super(key: key);

  @override
  _IntroPage1State createState() => _IntroPage1State();
}

class _IntroPage1State extends State<IntroPage1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: <Widget>[
            Container(
              child: Center(
                child: Image.asset("assets/images/logodark.png"),
                // child: AssetImage("assets/images/logodark.png"),
              ),

              height: 100,
              width: 200,
            ),
            Expanded(
              child: Container(
                child: Center(
                  child: Image.asset("assets/images/screen1.png"),
                  // child: AssetImage("assets/images/logodark.png"),
                ),

                // width: 200,
              ),
            ),
    Container(
      height: 250,
    padding: const EdgeInsets.only(top: 0,left: 30,right: 30),
    decoration: BoxDecoration(
    borderRadius: BorderRadius.only(
    topRight: Radius.circular(30.0),
    topLeft: Radius.circular(30.0)
    ),
    image: DecorationImage(
    image: AssetImage(
    "assets/images/Rectangle.png"
    ),
    fit: BoxFit.cover
    )
    ),
    child: Column(

    children: [

    SizedBox(height: 30,),
    Text(

    "Planifiez votre voyage",
    style: TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 30,
    color: Colors.white
    ),
    ),
    SizedBox(height: 30,),
    Text(
    "Choisissez votre lieu de prise en charge et la date de prise en charge .",
    textAlign: TextAlign.center,
    style: TextStyle(
    // fontWeight: FontWeight.bold,
    fontSize: 19,
    color: Colors.white
    ),
    ),
          ],
        )),],),),
    );
  }
}


// void main() {
//   runApp(MaterialApp(
//     home: Scaffold(
//       appBar: AppBar(
//           title: Text('Geeksforgeeks'),
//           backgroundColor: Colors.greenAccent[400],
//           leading: IconButton(
//             icon: Icon(Icons.menu),
//             tooltip: 'Menu',
//             onPressed: () {},
//           )),
//       body: Center(
//           child: Column(
//             children: <Widget>[
//               Container(
//                 child: Center(
//                   child: Text(
//                     'First widget',
//                     style: TextStyle(
//                       color: Colors.white,
//                     ),
//                   ),
//                 ),
//                 color: Colors.blue,
//                 height: 100,
//                 width: 200,
//               ),
//               Expanded(
//                 child: Container(
//                   child: Center(
//                     child: Text(
//                       'Second widget',
//                       style: TextStyle(
//                         color: Colors.white,
//                       ),
//                     ),
//                   ),
//                   color: Colors.amber,
//                   width: 200,
//                 ),
//               ),
//               Container(
//                 child: Center(
//                   child: Text(
//                     'Third widget',
//                     style: TextStyle(
//                       color: Colors.white,
//                     ),
//                   ),
//                 ),
//                 color: Colors.orange,
//                 height: 100,
//                 width: 200,
//               ),
//             ],
//           )),
//     ),
//     debugShowCheckedModeBanner: false,
//   ));
// }
