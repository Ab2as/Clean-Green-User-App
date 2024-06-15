import 'dart:async';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:clean_and_green_app/Screens/Auth/LoginScreen.dart';
import 'package:clean_and_green_app/Screens/HomeScreen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  static const String KEYLOGIN = "login";

  @override
  void initState() {
    super.initState();

    whereToGo();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                colors: [Colors.grey, Colors.white],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 350,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/Images/logo2.png',
                      // width: 500,
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    AnimatedTextKit(
                      animatedTexts: [
                        FadeAnimatedText("Swachhta",
                            textStyle: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 2, 15, 11),
                              fontFamily: 'Roboto',
                              fontSize: 40,
                            ),
                            fadeInEnd: 1,
                            fadeOutBegin: 2),
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 320,
                ),
                const Text(
                  "One step towards cleanliness",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 11, 0, 0),
                    fontFamily: 'Roboto',
                    fontSize: 18,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void whereToGo() async {
    var sharedPref = await SharedPreferences.getInstance();

    var IsLoggedIn = sharedPref.getBool(KEYLOGIN);

    Timer(const Duration(seconds: 3), () {
      if (IsLoggedIn != null) {
        if (IsLoggedIn) {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => HomeScreen(),
              ));
        } else {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const LoginScreen(),
              ));
        }
      } else {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const LoginScreen(),
            ));
      }
    });
  }
}
