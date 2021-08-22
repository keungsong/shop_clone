import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shop_clone/screens/home_screen.dart';
import 'package:shop_clone/screens/main_screen.dart';
import 'package:shop_clone/screens/phone_auth_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';

class OTPScreen extends StatefulWidget {
  final String number, verId;

  OTPScreen({Key key, this.number, this.verId});
  @override
  _OTPScreenState createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  var _text1 = TextEditingController();
  var _text2 = TextEditingController();
  var _text3 = TextEditingController();
  var _text4 = TextEditingController();
  var _text5 = TextEditingController();
  var _text6 = TextEditingController();

  bool _loading = false;
  String error = '';

  Future<void> phoneCredential(BuildContext context, String otp) async {
    FirebaseAuth _auth = FirebaseAuth.instance;

    try {
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
          verificationId: widget.verId, smsCode: otp);
      // need to otp validated or not
      final User user = (await _auth.signInWithCredential(credential)).user;

      if (user != null) {
        // signed in
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => HomeScreen()));
      } else {
        if (mounted) {
          setState(() {
            error = 'login failed';
          });
        }
      }
    } catch (e) {
      setState(() {
        if (mounted) {
          error = 'Invalid OTP';
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final node = FocusScope.of(context);
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        backgroundColor: Colors.white,
        title: Text(
          'Verification',
          style: TextStyle(color: Colors.black),
        ),
        automaticallyImplyLeading: false, // to move back screen
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(
              Icons.keyboard,
              size: 60,
              color: Colors.black,
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'Verify By Code',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Expanded(
                  child: RichText(
                      text: TextSpan(
                          text: 'ພວກເຮົາຈະສົ່ງລະຫັດ 6 ຕົວເລກເຂົ້າທີ່',
                          style: TextStyle(color: Colors.grey, fontSize: 13),
                          children: [
                        TextSpan(
                            text: widget.number,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                                fontSize: 12))
                      ])),
                ),
                InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => PhoneAuthScreen()));
                    },
                    child: Icon(Icons.edit))
              ],
            ),
            SizedBox(
              height: 12,
            ),
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: _text1,
                    textAlign: TextAlign.center,
                    keyboardType: TextInputType.number,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(border: OutlineInputBorder()),
                    onChanged: (value) {
                      if (value.length == 1) {
                        node.nextFocus();
                      }
                    },
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: TextFormField(
                    controller: _text2,
                    textAlign: TextAlign.center,
                    keyboardType: TextInputType.number,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(border: OutlineInputBorder()),
                    onChanged: (value) {
                      if (value.length == 1) {
                        node.nextFocus();
                      }
                    },
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: TextFormField(
                    controller: _text3,
                    textAlign: TextAlign.center,
                    keyboardType: TextInputType.number,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(border: OutlineInputBorder()),
                    onChanged: (value) {
                      if (value.length == 1) {
                        node.nextFocus();
                      }
                    },
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: TextFormField(
                    controller: _text4,
                    textAlign: TextAlign.center,
                    keyboardType: TextInputType.number,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(border: OutlineInputBorder()),
                    onChanged: (value) {
                      if (value.length == 1) {
                        node.nextFocus();
                      }
                    },
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: TextFormField(
                    controller: _text5,
                    textAlign: TextAlign.center,
                    keyboardType: TextInputType.number,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(border: OutlineInputBorder()),
                    onChanged: (value) {
                      if (value.length == 1) {
                        node.nextFocus();
                      }
                    },
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: TextFormField(
                    controller: _text6,
                    textAlign: TextAlign.center,
                    keyboardType: TextInputType.number,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(border: OutlineInputBorder()),
                    onChanged: (value) {
                      if (value.length == 1) {
                        if (_text1.text.length == 1) {
                          if (_text2.text.length == 1) {
                            if (_text3.text.length == 1) {
                              if (_text4.text.length == 1) {
                                if (_text5.text.length == 1) {
                                  String _otp =
                                      '${_text1.text}${_text2.text}${_text3.text}${_text4.text}${_text5.text}${_text6.text}';

                                  setState(() {
                                    _loading = true;
                                  });
                                  // phone login
                                  phoneCredential(context, _otp);
                                }
                              }
                            }
                          }
                        }
                      } else {
                        setState(() {
                          _loading = false;
                        });
                      }
                    },
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 18,
            ),
            if (_loading)
              Align(
                alignment: Alignment.center,
                child: SizedBox(
                  width: 50,
                  child: LinearProgressIndicator(
                    backgroundColor: Colors.grey.shade200,
                    valueColor: AlwaysStoppedAnimation<Color>(
                        Theme.of(context).primaryColor),
                  ),
                ),
              ),
            Text(
              error,
              style: TextStyle(color: Colors.red, fontSize: 12),
            )
          ],
        ),
      ),
    );
  }
}
