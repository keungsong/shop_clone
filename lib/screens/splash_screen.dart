import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class SplashScreen extends StatelessWidget {
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
