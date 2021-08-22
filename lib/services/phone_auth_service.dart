import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shop_clone/screens/home_screen.dart';
import 'package:shop_clone/screens/otp_screen.dart';

import '../auth/location_screen.dart';

class PhoneAuthServices {
  FirebaseAuth auth = FirebaseAuth.instance;
  User user = FirebaseAuth.instance.currentUser;
  CollectionReference users = FirebaseFirestore.instance.collection('users');

  Future<void> verifyPhoneNumber(BuildContext context, number) async {
    final PhoneVerificationCompleted verificationCompleted =
        (PhoneAuthCredential credential) async {
      await auth.signInWithCredential(
          credential); // after verification completed need to signin
    };
    final PhoneVerificationFailed verificationFailed = (FirebaseException e) {
      // if veerfication faild , it will show this
      if (e.code == 'invalid-phone-number') {}
    };
    final PhoneCodeSent codeSent = (String verId, int resendToken) async {
      // if otp send now new screen to should open to enter otp.

      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (_) => OTPScreen(
                    number: number,
                    verId: verId,
                  )));
    };
    try {
      auth.verifyPhoneNumber(
          phoneNumber: number,
          verificationCompleted: verificationCompleted,
          verificationFailed: verificationFailed,
          codeSent: codeSent,
          timeout: const Duration(seconds: 60),
          codeAutoRetrievalTimeout: (String verificationId) {
            print(verificationId); // will work on this later
          });
    } catch (e) {
      print('error ${e.toString()}');
    }
  }

  

  Future<void> addUser(context) async {
    final QuerySnapshot result =
        await users.where('uid', isEqualTo: user.uid).get();
    List<DocumentSnapshot> document = result.docs;

    if (document.length > 0) {
      // user data exists
      // so just skip firestore
      Navigator.pushReplacementNamed(context, LocationScreen.id);
    } else {
      // data not exists
      // add user data to firebase
      return users.doc(user.uid).set({
        'uid': user.uid,
        'mobile': user.phoneNumber,
        'email': user.email
      }).then((value) {
        Navigator.pushReplacementNamed(context, LocationScreen.id);
      }).catchError((error) => print('failed to add user: $error'));
    }
  }

}