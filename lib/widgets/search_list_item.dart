import 'package:flutter/material.dart';

class SearchItem extends StatelessWidget {
  final String username;
  final String urlImage;
  final String email;
  final VoidCallback chat;
  SearchItem(this.username, this.urlImage, this.email, this.chat);

  @override
  Widget build(BuildContext context) {
    return item();
  }

  Widget item() {
    return RaisedButton(
      color: Colors.white,
      onPressed: () {
        chat();
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        child: Row(
          children: [
            Container(
              margin: EdgeInsets.only(right: 20),
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      fit: BoxFit.cover, image: NetworkImage(urlImage))),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(username,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w800,
                    )),
                Text(email)
              ],
            ),
          ],
        ),
      ),
    );
  }
}
