import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shop_clone/screens/login_screen.dart';

class HomeScreen extends StatefulWidget {
  static const String id = 'home-screen';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('app name'),
        actions: [
          
          Container(
            margin: EdgeInsets.all(6),
            decoration: BoxDecoration(
              color:Colors.grey[100],
              shape:BoxShape.circle,
            ),
            child: IconButton(
                icon: Icon(Icons.search),
                color: Colors.black,
                iconSize:20,
                onPressed: () {
                 
                }),
          ),
          Container(
             decoration: BoxDecoration(
              color:Colors.grey[100],
              shape:BoxShape.circle,
            ),
            child: IconButton(
                icon: Icon(Icons.exit_to_app),
                color: Colors.black,
                onPressed: () {
                  FirebaseAuth.instance.signOut().then((value) {
                    Navigator.pushReplacementNamed(context, LoginScreen.id);
                  });
                }),
          ),
        ],
      ),
      
    );
  }
}
