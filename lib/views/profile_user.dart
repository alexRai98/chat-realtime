import 'package:challengeChat/helper/get_current_user.dart';
import 'package:flutter/material.dart';

class ProfileUser extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return showProfile();
  }

  Widget showProfile() {
    return Container(
      child: Column(
        children: [
          Image(image: NetworkImage(Constans.currentUserUrlPhoto)),
          Text(Constans.currentUserName),
          Text(Constans.currentUserEmail),
        ],
      ),
    );
  }
}
