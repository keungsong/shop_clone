import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shop_clone/auth/location_screen.dart';
import 'package:shop_clone/screens/forms/seller_form.dart';
import 'package:shop_clone/screens/home_screen.dart';
import 'package:shop_clone/screens/main_screen.dart';
import 'package:shop_clone/widegets/alerDialog.dart';
import 'package:shop_clone/widegets/auth_ui.dart';

class LoginScreen extends StatelessWidget {
  static const String id = 'login-screen';
  @override
  Widget build(BuildContext context) {
   /* FirebaseAuth.instance.authStateChanges().listen((User user) {
      if (user == null) {
      } else {
        // if already logged in it will not ask agian to login
        Navigator.pushReplacementNamed(context, LocationScreen.id);
      }
    });*/
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Container(
              width: MediaQuery.of(context).size.width,
              color: Colors.white,
              child: Column(
                children: [
                  SizedBox(
                    height: 150,
                  ),
                  CircleAvatar(
                    radius: 53,
                    backgroundColor: Color(0xffFDCF09),
                    child: CircleAvatar(
                      radius: 50,
                      backgroundImage: AssetImage('assets/images/logo.jpg'),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Company Name',
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
              child: AuthUi(),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Text(
                  '??????????????????????????????????????????????????????????????????',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.blue, fontSize: 12),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (context) => MyPrivacyAlerDialog(
                                  title: '????????????????????????',
                                  description: '?????????????????????????????????????????????????????????......',
                                ));
                      },
                      child: Text(
                        '????????????????????????',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.blue,
                            fontSize: 12,
                            decoration: TextDecoration.underline),
                      ),
                    ),
                    Text(
                      '?????????',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.blue,
                        fontSize: 12,
                      ),
                    ),
                    TextButton(
                        onPressed: () {
                          showDialog(
                              context: context,
                              builder: (context) => MyPrivacyPolicyAlerDialog(
                                    title: '??????????????????????????????????????????????????????????????????',
                                    description:
                                        '???????????????????????????????????????????????????????????????????????????????????????????????????......',
                                  ));
                        },
                        child: Text(
                          '??????????????????????????????????????????????????????????????????',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.blue,
                              fontSize: 12,
                              decoration: TextDecoration.underline),
                        )),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
