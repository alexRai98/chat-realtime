import 'package:challengeChat/helper/get_current_user.dart';
import 'package:challengeChat/widgets/main_bar.dart';
import 'package:flutter/material.dart';

class ProfileUser extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return showProfile(context);
  }

  Widget showProfile(context) {
    return Stack(
        // margin: EdgeInsets.only(top: 30),

        children: [
          MainBar("Profile", 230, false),
          Center(
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 170),
                  width: 120,
                  height: 120,
                  decoration: BoxDecoration(
                      border: Border.all(width: 4, color: Colors.white),
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(Constans.currentUserUrlPhoto))),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(Constans.currentUserName,
                    style:
                        TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
                Text(
                  Constans.currentUserEmail,
                  style: TextStyle(color: Colors.black38, fontSize: 15),
                ),
              ],
            ),
          ),
        ]);
  }
}
