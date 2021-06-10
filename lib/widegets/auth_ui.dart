import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';

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
                onPressed: () {},
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
          SignInButton(Buttons.Google,
              text: ('ດຳເນີນການຕໍ່ດ້ວຍກູໂກ'), onPressed: () {}),
          SizedBox(
            height: 8,
          ),
          SignInButton(Buttons.FacebookNew,
              text: ('ດຳເນີນການຕໍ່ດ້ວຍເຟດບຸກ'), onPressed: () {}),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'ຫຼື',
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'ເຂົ້າລະບົບຜ່ານອີເມວ',
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.underline),
            ),
          ),
        ],
      ),
    );
  }
}
