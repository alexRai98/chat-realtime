import 'package:challengeChat/widgets/main_bar.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController searchTextControler = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarMain(context),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
            color: Colors.black26,
            offset: Offset(0.0, 1.0),
            blurRadius: 6.0,
          )
        ]),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                    child: TextField(
                  controller: searchTextControler,
                  decoration: InputDecoration(
                      hintText: "Search username ....",
                      hintStyle: TextStyle(color: Colors.black26),
                      border: InputBorder.none),
                )),
                Container(
                  height: 40,
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      gradient: LinearGradient(colors: [
                        const Color(0x36FFFFFF),
                        const Color(0x0FFFFFFF)
                      ]),
                      borderRadius: BorderRadius.circular(40)),
                  child: Icon(Icons.search),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
