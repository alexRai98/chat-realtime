import 'package:challengeChat/service/database.dart';
import 'package:challengeChat/widgets/main_bar.dart';
import 'package:challengeChat/widgets/search_list_item.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  DatabaseMethods databaseMethods = new DatabaseMethods();
  TextEditingController searchTextControler = new TextEditingController();

  QuerySnapshot searchSnapshot;

  initialSearch() {
    databaseMethods.getUsersByUserName(searchTextControler.text).then((val) {
      setState(() {
        searchSnapshot = val;
      });
    });
    print(searchSnapshot.docs[0].data()["name"]);
  }

  @override
  // void initState() {
  //   initialSearch();
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarMain(context),
      body: Container(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(color: Colors.white, boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  offset: Offset(0.0, 1.0),
                  blurRadius: 6.0,
                )
              ]),
              child: Row(
                children: [
                  Expanded(
                      child: TextField(
                    style: TextStyle(fontSize: 20),
                    controller: searchTextControler,
                    onChanged: (text) => print(text),
                    decoration: InputDecoration(
                        hintText: "Search username ....",
                        hintStyle: TextStyle(color: Colors.black26),
                        border: InputBorder.none),
                  )),
                  GestureDetector(
                    onTap: () {
                      initialSearch();
                    },
                    child: Container(
                      height: 40,
                      padding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 9),
                      decoration: BoxDecoration(
                          color: Colors.black12,
                          borderRadius: BorderRadius.circular(50)),
                      child: Icon(Icons.search),
                    ),
                  ),
                ],
              ),
            ),
            searchList()
          ],
        ),
      ),
    );
  }

  Widget searchList() {
    return searchSnapshot != null
        ? ListView.builder(
            shrinkWrap: true,
            itemCount: searchSnapshot.docs.length,
            itemBuilder: (context, index) {
              return SearchItem(
                  searchSnapshot.docs[index].data()["name"],
                  searchSnapshot.docs[index].data()["url_image"],
                  searchSnapshot.docs[index].data()["email"]);
            })
        : Container();
  }
}
