import 'package:challengeChat/views/first_screen.dart';
import 'package:challengeChat/views/search.dart';
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
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(widget.userName),
      ),
    );
  }
}
