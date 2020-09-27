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

  // uploadUSerInfo(userMap) {
  //   Firestore.instance.collection("users").add(userMap);
  // }
}
