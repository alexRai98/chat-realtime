import 'package:flutter/material.dart';

class ChatRoomItem extends StatelessWidget {
  final String userName;
  ChatRoomItem(this.userName);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Container(
              decoration: BoxDecoration(
                  color: Colors.lightBlue,
                  borderRadius: BorderRadius.circular(40)),
              child: Text(
                userName.substring(0, 1),
                style: TextStyle(color: Colors.white),
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
    );
  }
}
