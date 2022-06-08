import 'package:flutter/material.dart';
import 'package:iyodrivers/screens/auth/login_screen.dart';
import 'package:iyodrivers/screens/welcome/onboarding/intro_screens/intro_page_1.dart';
import 'package:iyodrivers/screens/welcome/onboarding/intro_screens/intro_page_2.dart';
import 'package:iyodrivers/screens/welcome/onboarding/intro_screens/intro_page_3.dart';
import 'package:iyodrivers/utils/hex_color.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreen extends StatefulWidget {
  static const routeName = '/onboarding';

  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  // controller just to keep track on what p[age we are on
  final PageController _controller = PageController();
  bool onLastPage = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        PageView(
          controller: _controller,
          onPageChanged: (index) {
            setState(() {
              onLastPage = (index == 2);
            });
          },
          children: const [IntroPage1(), IntroPage2(), IntroPage3()],
        ),
        //dot indicators
        Container(
          alignment: const Alignment(0, 0.94),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              //skips
              GestureDetector(
                onTap: () {
                  _controller.jumpToPage(2);
                },
                child: const Text(
                  "SAUTER",
                  style: TextStyle(color: Colors.white),
                ),
              ),

              SmoothPageIndicator(
                controller: _controller,
                count: 3,
                effect: SlideEffect(
                    spacing: 8.0,
                    radius: 4.0,
                    dotWidth: 24.0,
                    dotHeight: 8.0,
                    // paintStyle:  PaintingStyle.stroke,
                    strokeWidth: 1.5,
                    dotColor: HexColor('#7177AB'),
                    activeDotColor: Colors.white),
              ),

              // next or done page
              onLastPage
                  ? GestureDetector(
                      onTap: () {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>LoginScreen()));
                      },
                      child: const Text(
                        "FINI",
                        style: TextStyle(color: Colors.white),
                      ),
                    )
                  : GestureDetector(
                      onTap: () {
                        _controller.nextPage(duration: const Duration(milliseconds: 500), curve: Curves.easeIn);
                      },
                      child: const Text(
                        "SUIVANTE",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
              // next
            ],
          ),
        )
      ],
    ));
  }
}
