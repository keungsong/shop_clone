import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_clone/provider/cat_provider.dart';
import 'package:shop_clone/provider/google_sign_in.dart';
import 'package:shop_clone/screens/forms/seller_form.dart';
import 'package:shop_clone/screens/home_screen.dart';
import 'package:shop_clone/screens/login_screen.dart';
import 'package:shop_clone/screens/main_screen.dart';
import 'package:shop_clone/screens/phone_auth_screen.dart';
import 'package:shop_clone/screens/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';

import 'auth/location_screen.dart';

import 'screens/splash_screen.dart';


Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Provider.debugCheckInvalidValueType = null;
  runApp(MultiProvider(
    providers: [
      Provider(create: (_) => CategoryProvider()),
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
                return MaterialApp(
                  debugShowCheckedModeBanner: false,
                  theme: ThemeData(primaryColor: Colors.cyan.shade900),
                  initialRoute: SplashScreen.id,
                  routes: {
                    SplashScreen.id:(context)=>SplashScreen(),
                    HomeScreen.id: (context) => HomeScreen(),
                    PhoneAuthScreen.id: (context) => PhoneAuthScreen(),
                    LoginScreen.id: (context) => LoginScreen(),
                    MainScreen.id: (context) => MainScreen(),
                    SellerFormScreen.id: (context) => SellerFormScreen(),
                    LocationScreen.id:(context)=>LocationScreen(),
                  },
                );
              }
            }
   

