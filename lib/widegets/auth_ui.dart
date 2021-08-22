import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';

import 'package:provider/provider.dart';
import 'package:shop_clone/provider/google_sign_in.dart';
import 'package:shop_clone/screens/phone_auth_screen.dart';

class AuthUi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            width: 220,
            child: ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.white)),
                onPressed: () {
                  Navigator.pushNamed(context, PhoneAuthScreen.id);
                },
                child: Row(
                  children: [
                    Icon(
                      Icons.phone_android_outlined,
                      color: Colors.black,
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Text(
                      'ດຳເນີນການຕໍ່ດ້ວຍເບີໂທ',
                      style: TextStyle(color: Colors.black),
                    )
                  ],
                )),
          ),
          SizedBox(
            height: 8,
          ),
          SignInButton(Buttons.Google, text: ('ດຳເນີນການຕໍ່ດ້ວຍກູໂກ'),
              onPressed: () {
            final provider =
                Provider.of<GoogleSignInProvider>(context, listen: false);

            provider.googleLogin();
          }),
          SizedBox(
            height: 8,
          ),
          SignInButton(Buttons.FacebookNew,
              text: ('ດຳເນີນການຕໍ່ດ້ວຍເຟດບຸກ'), onPressed: () {}),
        ],
      ),
    );
  }
}
