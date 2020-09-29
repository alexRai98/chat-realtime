import 'package:challengeChat/helper/helperfunction.dart';
import 'package:challengeChat/models/user.dart';
import 'package:challengeChat/service/conneted_api.dart';
import 'package:challengeChat/service/database.dart';
import 'package:challengeChat/service/firebase_auth.dart';
import 'package:challengeChat/views/doc_chat.dart';
import 'package:challengeChat/widgets/button_login.dart';
import "package:flutter/material.dart";

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  DatabaseMethods databaseMethods = new DatabaseMethods();
  bool isLoading = false;
  // Future<User> _futureAlbum;

  login() {
    setState(() {
      isLoading = true;
    });
    logInWithGoogle().then((user) {
      if (user != null) {
        HelperFunctions.saveUserLoggedInSharePreference(true);
        HelperFunctions.saveUserNameSharePreference(user.displayName);
        HelperFunctions.saveUserUserNameSharePreference(
            user.displayName.split(" ")[0]);
        HelperFunctions.saveUserEmailSharePreference(user.email);
        HelperFunctions.saveUserUrlPhotoSharePreference(user.photoURL);
        Map<String, dynamic> userInfo = {
          "name": user.displayName,
          "email": user.email,
          "url_photo": user.photoURL
        };
        createUser(userInfo);

        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => DocChat(),
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return isLoading ? spinner() : signInWithGoogle();
  }

  Widget spinner() {
    return Container(
      color: Colors.white,
      child: Center(
          child: CircularProgressIndicator(
        valueColor: new AlwaysStoppedAnimation<Color>(Color(0xFF00DEDC)),
      )),
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
                  color: Color(0xFF0FE0D9),
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
