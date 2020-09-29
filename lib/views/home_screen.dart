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
      "${Constans.currentUserEmail}_${Constans.currentUserUserName}";

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
                    // print(snapshot.data.docs[index]
                    //     .data()['users']
                    //     .data
                    //     .docs[0]
                    //     .data()["userName"]);
                    return ChatRoomItem(
                      snapshot.data.docs[index].data()['chatRoomId'],
                    );
                  })
              : Container();
        });
  }
}
