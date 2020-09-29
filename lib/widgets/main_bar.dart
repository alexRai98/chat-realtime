import 'package:challengeChat/service/firebase_auth.dart';
import 'package:challengeChat/views/login.dart';
import 'package:flutter/material.dart';

class MainBar extends StatelessWidget {
  final String title;
  final double heigth;
  final bool isHome;
  MainBar(this.title, this.heigth, this.isHome);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      alignment: Alignment(1.0, 1.0),
      height: heigth,
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Color(0xFF00F0DC), Color(0xFF00C8EF)])),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
                color: Colors.white,
                fontSize: 30.0,
                fontWeight: FontWeight.bold),
          ),
          isHome
              ? GestureDetector(
                  onTap: () {
                    signOutGoogle();
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => SignIn()));
                  },
                  child: Container(
                      child: Icon(
                    Icons.exit_to_app,
                    color: Colors.white,
                  )))
              : Container()
        ],
      ),
    );
  }
}
