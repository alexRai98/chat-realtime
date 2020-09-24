import 'package:challengeChat/widgets/button_login.dart';
import 'package:challengeChat/widgets/main_bar.dart';
import "package:flutter/material.dart";

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarMain(context),
      body: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ButtonLogin(0xFFFFFFFF, "assets/images/logo_google.png",
                "Login with Google", 0x80808080),
            SizedBox(
              height: 16,
            ),
            ButtonLogin(0xFF345ba0, "assets/images/face_logo.png",
                "Login with Facebook", 0xFFFFFFFF),
          ],
        ),
      ),
    );
  }
}
