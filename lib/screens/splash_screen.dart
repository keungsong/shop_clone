import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

import '../auth/location_screen.dart';
import 'login_screen.dart';

class SplashScreen extends StatefulWidget {
  static const String id='splash-screen';

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    // TODO: implement initState
    Timer(Duration(seconds: 3,
    ), (){
      FirebaseAuth.instance.authStateChanges().listen((User user) {
        if(user == null){
          Navigator.pushReplacementNamed(context, LoginScreen.id);
        }else{
           Navigator.pushReplacementNamed(context, LocationScreen.id);
        }
       });
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    const colorizeColors = [
      Colors.white,
      Colors.blue,
    ];

    const colorizeTextStyle = TextStyle(
      fontSize: 30.0,
      fontFamily: 'RobotoMono',
    );
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CircleAvatar(
              radius: 53,
              backgroundColor: Color(0xffFDCF09),
              child: CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage('assets/images/logo.jpg'),
              ),
            ),
            AnimatedTextKit(
              animatedTexts: [
                ColorizeAnimatedText(
                  ' Company Name ',
                  textStyle: colorizeTextStyle,
                  colors: colorizeColors,
                ),
              ],
              isRepeatingAnimation: true,
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
