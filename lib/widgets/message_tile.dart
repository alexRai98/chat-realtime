import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MessageTile extends StatelessWidget {
  final String message;
  final bool isSendByMe;
  MessageTile(this.message, this.isSendByMe);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      width: MediaQuery.of(context).size.width,
      alignment: isSendByMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: EdgeInsets.only(top: 10),
        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
        decoration: BoxDecoration(
            border: isSendByMe
                ? Border.all(width: 1, color: Colors.lightBlue)
                : Border.all(width: 1, color: Colors.black26),
            color: isSendByMe ? Colors.lightBlue : Colors.white,
            borderRadius: isSendByMe
                ? BorderRadius.only(
                    topLeft: Radius.circular(23),
                    topRight: Radius.circular(30),
                    bottomLeft: Radius.circular(30))
                : BorderRadius.only(
                    topLeft: Radius.circular(23),
                    topRight: Radius.circular(30),
                    bottomRight: Radius.circular(30))),
        child: Text(
          message,
          style: TextStyle(
              color: isSendByMe ? Colors.white : Colors.black, fontSize: 20),
        ),
      ),
    );
  }
}
