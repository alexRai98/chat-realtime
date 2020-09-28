import 'package:challengeChat/views/home_screen.dart';
import 'package:challengeChat/views/search.dart';
import 'package:challengeChat/views/profile_user.dart';
import 'package:flutter/material.dart';

class DocChat extends StatefulWidget {
  @override
  _DocChatState createState() => _DocChatState();
}

class _DocChatState extends State<DocChat> {
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
              canvasColor: Colors.white, primaryColor: Colors.lightBlue),
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
