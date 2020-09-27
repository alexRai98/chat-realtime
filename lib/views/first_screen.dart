import 'package:challengeChat/helper/get_current_user.dart';
import 'package:challengeChat/helper/helperfunction.dart';
import 'package:challengeChat/service/firebase_auth.dart';
import 'package:challengeChat/views/search.dart';
import 'package:flutter/material.dart';

import 'login.dart';

class FirstScreen extends StatefulWidget {
  @override
  _FirstScreenState createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  @override
  void initState() {
    getCurrentUser();
    super.initState();
  }

  getCurrentUser() async {
    // Constans.currentUserName
    String user = await HelperFunctions.getUserNameSharePreference();
    print("CurrentUSername:" + user);
  }

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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => SearchScreen()));
        },
        child: Icon(Icons.message),
      ),
      body: Container(
          alignment: Alignment.center,
          child: Column(
            children: [Text("Fist screen yeee!!!")],
          )),
    );
  }
}
