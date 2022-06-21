import 'package:flutter/material.dart';
import 'package:iyodrivers/screens/auth/login_screen.dart';
import 'package:iyodrivers/screens/welcome/splash_screen.dart';
import 'firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'services/auth_service.dart';
// import 'package:iyodrivers/routes/route.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,

  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'iyodriver',
      themeMode: ThemeMode.system,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(

        primarySwatch: Colors.orange,
      ),


      home:SplashScreen(),
    );
  }
}

