import 'package:challengeChat/helper/helperfunction.dart';
import 'package:challengeChat/service/firebase_auth.dart';
import 'package:challengeChat/views/doc_chat.dart';
import 'package:challengeChat/widgets/button_login.dart';
import "package:flutter/material.dart";

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  bool isLoading = false;
  login() {
    setState(() {
      isLoading = true;
    });
    logInWithGoogle().then((user) {
      if (user != null) {
        //   HelperFunctions.saveUserLoggedInSharePreference(true);
        //   HelperFunctions.saveUserNameSharePreference(user.displayName);
        //   HelperFunctions.saveUserEmailSharePreference(user.email);
        //   HelperFunctions.saveUserUrlPhotoSharePreference(user.photoURL);
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => DocChat(),
          ),
        );
        // print("el usuario es ${user.displayName}");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return isLoading ? spinner() : signInWithGoogle();
  }

  Widget spinner() {
    return Container(
      child: Center(child: CircularProgressIndicator()),
    );
  }

  Widget signInWithGoogle() {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Welcome! \nThis's your Chat-Doc App",
              style: TextStyle(
                  fontSize: 38,
                  color: Colors.lightBlue,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 30,
            ),
            ButtonLogin(
                onPressed: () {
                  login();
                },
                bgColor: 0xFFFFFFFF,
                urlLogo: "assets/images/logo_google.png",
                text: "Login with Google",
                textColor: 0x80808080),
            SizedBox(
              height: 16,
            ),
            ButtonLogin(
                onPressed: () {},
                bgColor: 0xFF345ba0,
                urlLogo: "assets/images/face_logo.png",
                text: "Login with Facebook",
                textColor: 0xFFFFFFFF)
          ],
        ),
      ),
    );
  }
}
