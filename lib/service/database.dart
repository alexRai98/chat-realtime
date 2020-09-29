import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseMethods {
  getUsersByUserName(String userName) async {
    // ignore: deprecated_member_use
    return await Firestore.instance
        .collection("users")
        .where("name", isEqualTo: userName)
        // ignore: deprecated_member_use
        .getDocuments();
  }

  addUSerInfo(userMap) {
    // ignore: deprecated_member_use
    Firestore.instance
        .collection("users")
        .add(userMap)
        .catchError((e) => print(e.toString()));
  }

  createChatRoom(String chatRoomId, chatRoomMap) {
    // ignore: deprecated_member_use
    Firestore.instance
        .collection("chatRoom")
        .doc(chatRoomId)
        .set(chatRoomMap)
        .catchError((e) => print(e.toString()));
  }

  addConversationMessages(String chatRoomId, messageMap) {
    FirebaseFirestore.instance
        .collection("chatRoom")
        .doc(chatRoomId)
        .collection("chat")
        .add(messageMap)
        .catchError((e) => print(e.toString()));
  }

  getConversationMessages(String chatRoomId) async {
    // ignore: deprecated_member_use
    return await Firestore.instance
        .collection("chatRoom")
        .doc(chatRoomId)
        .collection("chat")
        .orderBy("time", descending: false)
        .snapshots();
  }

  // getChatRooms(String userEmail) async {
  //   return await FirebaseFirestore.instance
  //       .collection("chatRoom")
  //       .where("users", arrayContains: userEmail)
  //       .snapshots();
  // }
  getChatRooms(String userEmailName) async {
    return await FirebaseFirestore.instance
        .collection("chatRoom")
        .where("users", arrayContains: userEmailName)
        .snapshots();
  }
}
