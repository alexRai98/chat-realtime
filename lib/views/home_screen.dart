import 'package:challengeChat/helper/get_current_user.dart';
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
  String userEmailName =
      "${Constans.currentUserEmail} ${Constans.currentUserUserName}";

  @override
  void initState() {
    databaseMethods.getChatRooms(userEmailName).then((value) {
      setState(() {
        chatRoomStream = value;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MainBar("Doc Chat", 100, true),
        Expanded(child: chatRoomList())
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
                    return ChatRoomItem(getUser(Constans.currentUserEmail,
                        snapshot.data.docs[index].data()['users']));
                  })
              : Container();
        });
  }
}

String getUser(String email, users) {
  List dataBaseEmail;
  String otherUser = "";
  users.forEach((element) {
    dataBaseEmail = element.split(" ");
    if (dataBaseEmail[0] != email) {
      otherUser = dataBaseEmail[1];
    }
  });
  return otherUser;
}
