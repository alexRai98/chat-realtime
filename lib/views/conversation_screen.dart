import 'package:challengeChat/helper/get_current_user.dart';
import 'package:challengeChat/service/database.dart';
import 'package:challengeChat/views/doc_chat.dart';
import 'package:challengeChat/widgets/message_tile.dart';
import 'package:flutter/material.dart';

class ConversationScreen extends StatefulWidget {
  final String userName;
  final String chatRoomId;
  ConversationScreen(
      {Key key, @required this.userName, @required this.chatRoomId});
  @override
  _ConversationScreenState createState() => _ConversationScreenState();
}

class _ConversationScreenState extends State<ConversationScreen> {
  TextEditingController messageTextControler = new TextEditingController();
  DatabaseMethods databaseMethods = new DatabaseMethods();

  Stream chatMessageStream;

  sendMessage() {
    if (messageTextControler.text.isNotEmpty) {
      Map<String, dynamic> messageMap = {
        "message": messageTextControler.text,
        "sendBy": Constans.currentUserEmail,
        "time": DateTime.now().microsecondsSinceEpoch,
      };
      databaseMethods.addConversationMessages(widget.chatRoomId, messageMap);
      messageTextControler.text = "";
    }
  }

  @override
  initState() {
    databaseMethods.getConversationMessages(widget.chatRoomId).then((value) {
      setState(() {
        chatMessageStream = value;
      });
    });
    super.initState();
  }

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
      body: Container(
        child: Stack(children: [
          chatMessageList(),
          Container(
            alignment: Alignment.bottomCenter,
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
              decoration: BoxDecoration(color: Colors.white, boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  offset: Offset(0.0, 0.1),
                  blurRadius: 6.0,
                )
              ]),
              child: Row(
                children: [
                  Expanded(
                      child: TextField(
                    style: TextStyle(fontSize: 20),
                    controller: messageTextControler,
                    decoration: InputDecoration(
                        hintText: "Message",
                        hintStyle: TextStyle(color: Colors.black26),
                        border: InputBorder.none),
                  )),
                  GestureDetector(
                    onTap: () {
                      sendMessage();
                    },
                    child: Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                          color: Colors.lightBlue,
                          borderRadius: BorderRadius.circular(50)),
                      child: Icon(
                        Icons.send,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ]),
      ),
    );
  }

  Widget chatMessageList() {
    return StreamBuilder(
        stream: chatMessageStream,
        builder: (context, snapshot) {
          return snapshot.hasData
              ? ListView.builder(
                  itemCount: snapshot.data.docs.length,
                  itemBuilder: (context, index) {
                    return MessageTile(
                        snapshot.data.docs[index].data()['message'],
                        snapshot.data.docs[index].data()['sendBy'] ==
                            Constans.currentUserEmail);
                  })
              : Container();
        });
  }
}
