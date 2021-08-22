import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shop_clone/screens/login_screen.dart';
import 'package:shop_clone/screens/main_screen.dart';
import 'package:shop_clone/widegets/banner_widget.dart';

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
        title: Text('Company name'),
        automaticallyImplyLeading: false,
        actions: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child:
                IconButton(icon: Icon(Icons.notifications), onPressed: () {}),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: IconButton(
                icon: Icon(Icons.exit_to_app),
                onPressed: () {
                  FirebaseAuth.instance.signOut();
                  Navigator.pushReplacementNamed(context, LoginScreen.id);
                }),
          )
        ],
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(56),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextField(
                decoration: InputDecoration(
              prefixIcon: Icon(Icons.search, color: Colors.grey),
              hintText: 'Search...',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: BorderSide.none,
              ),
              filled: true,
              fillColor: Colors.white,
              contentPadding: EdgeInsets.zero,
            )),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(12, 10, 12, 8),
        child: Column(children: [
          BannerWidget(),
        ]),
      ),
    );
  }
}
