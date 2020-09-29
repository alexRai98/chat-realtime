import 'package:challengeChat/helper/get_current_user.dart';
import 'package:challengeChat/helper/helperfunction.dart';
import 'package:challengeChat/views/home_screen.dart';
import 'package:challengeChat/views/search.dart';
import 'package:challengeChat/views/profile_user.dart';
import 'package:flutter/material.dart';

class DocChat extends StatefulWidget {
  @override
  _DocChatState createState() => _DocChatState();
}

class _DocChatState extends State<DocChat> {
  @override
  void initState() {
    getUsername();
    super.initState();
  }

  getUsername() async {
    Constans.currentUserName =
        await HelperFunctions.getUserNameSharePreference();
    Constans.currentUserEmail =
        await HelperFunctions.getUserEmailSharePreference();
    Constans.currentUserUserName =
        await HelperFunctions.getUserUserNameSharePreference();
    Constans.currentUserUrlPhoto =
        await HelperFunctions.getUserUrlPhotoSharePreference();
  }

  int indexTap = 0;
  final List<Widget> widgetsChildren = [
    HomeScreen(),
    SearchScreen(),
    ProfileUser()
  ];
  void onTap(int index) {
    setState(() {
      indexTap = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widgetsChildren[indexTap],
      bottomNavigationBar: Theme(
          data: Theme.of(context).copyWith(
              canvasColor: Color(0xFF008A88),
              primaryColor: Color(0xFF00DEDC),
              textTheme: Theme.of(context)
                  .textTheme
                  .copyWith(caption: new TextStyle(color: Colors.white))),
          child: BottomNavigationBar(
            onTap: onTap,
            currentIndex: indexTap,
            items: [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: ""),
              BottomNavigationBarItem(icon: Icon(Icons.message), label: ""),
              BottomNavigationBarItem(icon: Icon(Icons.person), label: ""),
            ],
          )),
    );
  }
}
