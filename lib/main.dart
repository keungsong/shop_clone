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
  Widget build(BuildContext context) => ChangeNotifierProvider(
        create: (_) => GoogleSignInProvider(),
        child: FutureBuilder(
            future: Future.delayed(Duration(seconds: 5)),
            builder: (context, AsyncSnapshot snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return MaterialApp(
                  debugShowCheckedModeBanner: false,
                  home: SplashScreen(),
                );
              } else {
                return MaterialApp(
                  debugShowCheckedModeBanner: false,
                  theme: ThemeData(primaryColor: Colors.cyan.shade900),
                  home: LoginScreen(),
                  routes: {
                    HomeScreen.id: (context) => HomeScreen(),
                    PhoneAuthScreen.id: (context) => PhoneAuthScreen(),
                    LoginScreen.id: (context) => LoginScreen(),
                    MainScreen.id: (context) => MainScreen(),
                    SellerFormScreen.id: (context) => SellerFormScreen(),
                  },
                );
              }
            }),
      );
}
