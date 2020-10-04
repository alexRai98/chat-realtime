import 'package:challengeChat/helper/get_current_user.dart';
import 'package:challengeChat/service/conneted_api.dart';
import 'package:challengeChat/service/database.dart';
import 'package:challengeChat/views/conversation_screen.dart';
import 'package:challengeChat/widgets/circular_progress.dart';
import 'package:challengeChat/widgets/search_list_item.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  DatabaseMethods databaseMethods = new DatabaseMethods();
  TextEditingController searchTextControler = new TextEditingController();

  List futureUsers;
  bool isLogin = false;

  initialSearch() {
    setState(() {
      isLogin = true;
    });
    fetchUsers(searchTextControler.text.toLowerCase()).then((value) {
      setState(() {
        futureUsers = value;
        isLogin = false;
        print(futureUsers[0]['name']);
      });
    });
  }

  createChatRoomAndStartConversation(String userEmail, String userName) {
    String chatRoomId = generiChatRoomId(userEmail, Constans.currentUserEmail);
    String userSend = "$userEmail $userName";
    String userCurrent =
        "${Constans.currentUserEmail} ${Constans.currentUserUserName}";
    List<String> users = [userSend, userCurrent];

    Map<String, dynamic> chatRoomMap = {
      "users": users,
      "chatRoomId": chatRoomId
    };
    databaseMethods.createChatRoom(chatRoomId, chatRoomMap);
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => ConversationScreen(
                  userName: userName,
                  chatRoomId: chatRoomId,
                )));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 25.5),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(color: Colors.white, boxShadow: [
              BoxShadow(
                color: Colors.black26,
                offset: Offset(0.0, 1.0),
                blurRadius: 6.0,
              )
            ]),
            child: Row(
              children: [
                Expanded(
                    child: TextField(
                  style: TextStyle(fontSize: 20),
                  controller: searchTextControler,
                  onChanged: (text) {
                    initialSearch();
                  },
                  decoration: InputDecoration(
                      hintText: "Search username ....",
                      hintStyle: TextStyle(color: Colors.black26),
                      border: InputBorder.none),
                )),
              ],
            ),
          ),
          isLogin ? Expanded(child: CircularProgress()) : searchList()
        ],
      ),
    );
  }

  Widget searchList() {
    return futureUsers != null
        ? ListView.builder(
            shrinkWrap: true,
            itemCount: futureUsers.length,
            itemBuilder: (context, index) {
              return futureUsers.length > 0
                  ? SearchItem(
                      capitalize(futureUsers[index]["user_name"]),
                      futureUsers[index]["url_photo"],
                      futureUsers[index]["email"],
                      () => createChatRoomAndStartConversation(
                          futureUsers[index]["email"],
                          capitalize(futureUsers[index]["user_name"])))
                  : Container();
            })
        : Container();
  }
}

generiChatRoomId(String user, String user2) {
  if (user.substring(0, 1).codeUnitAt(0) >
      user2.substring(0, 1).codeUnitAt(0)) {
    return "$user2\_$user";
  } else {
    return "$user\_$user2";
  }
}

String capitalize(String string) {
  if (string == null) {
    throw ArgumentError("string: $string");
  }

  if (string.isEmpty) {
    return string;
  }

  return string[0].toUpperCase() + string.substring(1);
}
