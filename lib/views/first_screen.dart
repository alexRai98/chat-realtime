import 'package:challengeChat/service/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'login.dart';

class FirstScreen extends StatefulWidget {
  @override
  _FirstScreenState createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Doc-Doc Chat"),
        actions: [
          GestureDetector(
              onTap: () {
                signOutGoogle();
                Navigator.pushReplacement(
                    context, MaterialPageRoute(builder: (context) => SignIn()));
              },
              child: Container(
                  padding: EdgeInsets.only(right: 15),
                  child: Icon(Icons.exit_to_app)))
        ],
      ),
      body: Container(
          alignment: Alignment.center,
          child: Column(
            children: [Text("Fist screen yeee!!!")],
          )),
    );
  }
}
