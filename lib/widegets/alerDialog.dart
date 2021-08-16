import 'dart:ui';

import 'package:flutter/material.dart';

class MyPrivacyAlerDialog extends StatelessWidget {
  final String title, description, buttonText;
  final image;

  MyPrivacyAlerDialog(
      {this.title, this.description, this.buttonText, this.image});
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: dialogContent(context),
    );
  }

  dialogContent(BuildContext context) {
    return Stack(
      overflow: Overflow.visible,
      alignment: Alignment.topCenter,
      children: [
        Container(
          padding: EdgeInsets.only(
            top: 90,
            bottom: 90,
            left: 16,
            right: 16,
          ),
          margin: EdgeInsets.only(top: 16),
          decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(17),
              boxShadow: [
                BoxShadow(
                    color: Colors.black,
                    blurRadius: 10,
                    offset: Offset(0.0, 10.0))
              ]),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Text(
                description,
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(
                height: 24,
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: RaisedButton(
                  color: Colors.blue,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    'ຍອມຮັບ',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              )
            ],
          ),
        ),
        Positioned(
            top: -27,
            left: 16,
            right: 16,
            child: CircleAvatar(
              backgroundColor: Colors.blueAccent,
              radius: 40,
              child: Text(
                'LOGO',
                style: TextStyle(color: Colors.white),
              ),
            ))
      ],
    );
  }
}

class MyPrivacyPolicyAlerDialog extends StatelessWidget {
  final String title, description, buttonText;
  final image;

  MyPrivacyPolicyAlerDialog(
      {this.title, this.description, this.buttonText, this.image});
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: dialogContent(context),
    );
  }

  dialogContent(BuildContext context) {
    return Stack(
      overflow: Overflow.visible,
      alignment: Alignment.topCenter,
      children: [
        Container(
          padding: EdgeInsets.only(
            top: 90,
            bottom: 90,
            left: 16,
            right: 16,
          ),
          margin: EdgeInsets.only(top: 16),
          decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(17),
              boxShadow: [
                BoxShadow(
                    color: Colors.black,
                    blurRadius: 10,
                    offset: Offset(0.0, 10.0))
              ]),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Text(
                description,
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(
                height: 24,
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: RaisedButton(
                  color: Colors.blue,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    'ຍອມຮັບ',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              )
            ],
          ),
        ),
        Positioned(
          top: -27,
          left: 16,
          right: 16,
          child: CircleAvatar(
            backgroundColor: Colors.blueAccent,
            radius: 40,
            child: Text(
              'LOGO',
              style: TextStyle(color: Colors.white),
            ),
          ),
        )
      ],
    );
  }
}
