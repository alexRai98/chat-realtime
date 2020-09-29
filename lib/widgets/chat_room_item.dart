import 'package:challengeChat/views/conversation_screen.dart';
import 'package:flutter/material.dart';

class ChatRoomItem extends StatelessWidget {
  final String userName;
  final String chatRoomId;
  ChatRoomItem(this.userName, this.chatRoomId);

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      color: Colors.white,
      onPressed: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ConversationScreen(
                    userName: userName, chatRoomId: chatRoomId)));
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        child: Row(
          children: [
            Container(
                height: 40,
                width: 40,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Color(0xFF00DEDC),
                  shape: BoxShape.circle,
                ),
                child: Text(
                  userName.substring(0, 1),
                  style: TextStyle(color: Colors.white, fontSize: 30),
                )),
            SizedBox(
              width: 8,
            ),
            Text(
              userName,
              style: TextStyle(color: Colors.black38, fontSize: 20),
            )
          ],
        ),
      ),
    );
  }
}
