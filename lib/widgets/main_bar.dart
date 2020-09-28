import 'package:challengeChat/service/firebase_auth.dart';
import 'package:challengeChat/views/login.dart';
import 'package:flutter/material.dart';

class MainBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      alignment: Alignment(1.0, 1.0),
      height: 100,
      color: Colors.lightBlue,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Doc Chat",
            style: TextStyle(
                color: Colors.white,
                fontSize: 30.0,
                fontWeight: FontWeight.bold),
          ),
          GestureDetector(
              onTap: () {
                signOutGoogle();
                Navigator.pushReplacement(
                    context, MaterialPageRoute(builder: (context) => SignIn()));
              },
              child: Container(
                  child: Icon(
                Icons.exit_to_app,
                color: Colors.white,
              )))
        ],
      ),
    );
  }
}
