import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class Anonymous extends StatefulWidget {
  @override
  _AnonymousState createState() => _AnonymousState();
}

class _AnonymousState extends State<Anonymous> {
  Map data;
  List anonymousData;

  Future getData() async {
    http.Response response =
        await http.get("https://reqres.in/api/users?page=2");
    data = json.decode(response.body);
    setState(() {
      anonymousData = data["data"];
    });
    debugPrint(anonymousData.toString());
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: anonymousData == null ? 0 : anonymousData.length,
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
                                      AssetImage("assets/images/avatar.png"),
                                ),
                              ),
                              Text(
                                "Anonymous",
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
                                    "${anonymousData[index]["email"]} ${anonymousData[index]["email"]} ${anonymousData[index]["email"]}"),
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
