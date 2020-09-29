import 'package:challengeChat/helper/get_current_user.dart';
import 'package:challengeChat/helper/helperfunction.dart';
import 'package:challengeChat/service/database.dart';
import 'package:challengeChat/widgets/chat_room_item.dart';
import 'package:challengeChat/widgets/main_bar.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  DatabaseMethods databaseMethods = new DatabaseMethods();
  Stream chatRoomStream;

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
    Constans.currentUserUrlPhoto =
        await HelperFunctions.getUserUrlPhotoSharePreference();
    databaseMethods.getChatRooms(Constans.currentUserEmail).then((value) {
      setState(() {
        chatRoomStream = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MainBar("Doc Chat", 100, true),
        // Container(child: chatRoomList())
      ],
    );
  }

  Widget chatRoomList() {
    return StreamBuilder(
        stream: chatRoomStream,
        builder: (context, snapshot) {
          return snapshot.hasData
              ? ListView.builder(
                  itemCount: snapshot.data.docs.length,
                  itemBuilder: (context, index) {
                    return ChatRoomItem(
                      snapshot.data.docs[index].data()['chatRoomId'],
                    );
                  })
              : Container();
        });
  }
}
