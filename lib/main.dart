import 'package:flutter/material.dart';
import 'package:shop_clone/screens/login_screen.dart';
import 'package:shop_clone/screens/splash_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: Future.delayed(Duration(seconds: 3)),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              home: SplashScreen(),
            );
          } else {
            return MaterialApp(
                theme: ThemeData(primaryColor: Colors.cyan.shade900),
                home: LoginScreen());
          }
        });
  }
}
