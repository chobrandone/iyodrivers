import 'package:flutter/material.dart';
import 'package:iyodrivers/screens/welcome/onboarding/onboarding_screen.dart';
import 'package:iyodrivers/routes/route.dart';
import 'package:iyodrivers/utils/hex_color.dart';

class SplashScreen extends StatefulWidget {
  static const routeName = '/';

  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  //to incremet the numberos second that the splash screen will take
//   void initState(){
//     super.initState();
//     startTime();
//   }
//   //setting the duration
//   startTime() async {
//     var duration = Duration(seconds: 4);
//     return new Timer(duration, route);
//   }
// // routing to the next page
//   route() {
//     Navigator.pushReplacement(context, MaterialPageRoute(
//         builder: (context) => WelcomeSreen()
//     ));
//   }
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
        body: Container(

      decoration: const BoxDecoration(
          image: DecorationImage(
        image: AssetImage(
          ("assets/images/homescreen.png"),
        ),
        fit: BoxFit.cover,
      )),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              child: Image.asset("assets/images/logowhite.png"),
            ),
            Container(
              child: Image.asset(
                "assets/images/homecar.png",
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              child: const Center(
                child: Text(
                  "Bienvenue chez iyodriver",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Container(
              child:     const Center(
                child: Text(
                  "Faites un tour en quelque clics ",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 45,
            ),

            Container(

              margin: EdgeInsets.only(left: 40,right: 40, bottom: 35),
              width: w*0.5,
              height: h * 0.06,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
              ),
              child: GestureDetector(

                onTap: () {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=> OnboardingScreen()));
                },
                child: Center(
                  child: Text(
                    "COMMENCER",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Color(0xffCEA110)),
                  ),
                ),
              ),
            )// GestureDetector(
            //
            //   onTap: () {
            //     Navigator.pushNamed(context, OnboardingScreen.routeName);
            //   },
            //   child: Container(
            //     width: w * 0.2,
            //     height: h * 0.06,
            //     decoration: BoxDecoration(
            //         borderRadius: BorderRadius.circular(10),
            //       color: Colors.orangeAccent,
            //     ),
            //     child: Center(
            //       child: Text(
            //         "COMMENCER",
            //         style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white),
            //       ),
            //     ),
            //   ),
            // ),

          ],
        ),
      )
      // child: Center(
      // child: Image.asset("assets/images/homecar.png"),
      // ),
    ));
  }
}
