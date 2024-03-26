import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:link_flutter/pages/onboarding_page.dart';
import 'package:link_flutter/pages/splash.dart';
import 'package:link_flutter/theme/color.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: 'Montserrat',
          scaffoldBackgroundColor: white,
          appBarTheme: AppBarTheme(color: white, elevation: 0),
        ),
        home: AnimatedSplashScreen(
          duration: 3000,
          splash: 'assets/images/logo.png', 
          pageTransitionType: PageTransitionType.fade,
          nextScreen: OnBoardingPage(),));
  }
}
