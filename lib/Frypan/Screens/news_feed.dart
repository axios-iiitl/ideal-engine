import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:ideal_engine/Frypan/Screens/mainScreen.dart';
import 'dart:async';
import 'dart:convert';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import 'New_Post/newpost.dart';

class NewsFeed extends StatefulWidget {
  @override
  _NewsFeedState createState() => _NewsFeedState();
}

class _NewsFeedState extends State<NewsFeed> {
  Map data;
  List userData;
  bool createnewpost = false;

  Future getData() async {
    http.Response response =
        await http.get("https://reqres.in/api/users?page=2");
    data = json.decode(response.body);
    setState(() {
      userData = data["data"];
    });
    debugPrint(userData.toString());
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(8.0),
        child: FloatingActionButton(
          backgroundColor: Colors.yellow,
          child: Icon(
            Icons.add,
            color: Colors.black,
          ),
          onPressed: () {
            showDialog(
                context: context,
                builder: (_) => AlertDialog(
                    contentPadding: EdgeInsets.zero,
                    title:
                        Text('Create New Post', style: TextStyle(fontSize: 17)),
                    content: NewPost()));
          },
        ),
      ),
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: userData == null ? 0 : userData.length,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.all(5.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: new Border.all(
                      color: Colors.white,
                      width: 0.7,
                      style: BorderStyle.solid),
                ),
                child: Card(
                  color: Colors.black,
                  child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Row(
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: CircleAvatar(
                                  backgroundImage:
                                      NetworkImage(userData[index]["avatar"]),
                                ),
                              ),
                              Text(
                                "${userData[index]["first_name"]} ${userData[index]["last_name"]}",
                                style: TextStyle(color: Colors.white),
                              )
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Center(
                              child: Container(
                                padding: EdgeInsets.all(10),
                                width: MediaQuery.of(context).size.width * 0.9,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(5)),
                                child: Text(
                                    "${userData[index]["email"]} ${userData[index]["email"]} ${userData[index]["email"]}"),
                              ),
                            ),
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.arrow_upward_outlined,
                                color: Colors.white,
                                size: 30,
                              ),
                              Icon(
                                Icons.arrow_downward_outlined,
                                color: Colors.white,
                                size: 30,
                              ),
                              Spacer(),
                              Align(
                                  alignment: Alignment.centerRight,
                                  child: Icon(
                                    Icons.share_outlined,
                                    color: Colors.white,
                                    size: 30,
                                  )),
                              Align(
                                  alignment: Alignment.centerRight,
                                  child: Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(8, 0, 0, 0),
                                    child: Icon(
                                      MdiIcons.chat,
                                      color: Colors.white,
                                      size: 30,
                                    ),
                                  ))
                            ],
                          ),
                        ],
                      )),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
