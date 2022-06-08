import 'package:flutter/material.dart';
class IntroPage2 extends StatelessWidget {
  const IntroPage2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double w =MediaQuery.of(context).size.width;
    double h =MediaQuery.of(context).size.height;
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
                  child: Image.asset("assets/images/screen2.png"),
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

                      "Demander un trajet",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                          color: Colors.white
                      ),
                    ),
                    SizedBox(height: 30,),
                    Text(
                      "Inscrivez-vous à l'application et réservez pour une voiture en choisissant à l'avance votre lieu de prise en charge exact et la marque de votre voiture.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        // fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Colors.white
                      ),
                    ),
                  ],
                )),],),),
    );
  }
}
