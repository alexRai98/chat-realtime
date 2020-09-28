import 'package:challengeChat/views/doc_chat.dart';
import 'package:flutter/material.dart';

class ChatRoom extends StatefulWidget {
  final String userName;
  ChatRoom({Key key, @required this.userName});
  @override
  _ChatRoomState createState() => _ChatRoomState();
}

class _ChatRoomState extends State<ChatRoom> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => DocChat()));
          },
        ),
        title: Text(widget.userName),
      ),
    );
  }
}
