import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../screens/login_screen.dart';

class LocationScreen extends StatelessWidget {
  static const String id='location-screen';
  const LocationScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Center(child: ElevatedButton(child: Text('SignOut'),
      onPressed: (){
        FirebaseAuth.instance.signOut().then((value){
          Navigator.pushReplacementNamed(context, LoginScreen.id);
        });
      },),)
    );
  }
}
