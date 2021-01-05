import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    return Container(
      color: Colors.black,
      height: _height,
      width: _width,
      child: ListView(shrinkWrap: true, children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(30),
                    child: CircleAvatar(
                      maxRadius: 60,
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.black,
                      backgroundImage: AssetImage("assets/images/avatar.png"),
                    ),
                  ),
                  Spacer(),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          Text(
                            "Username",
                            style: TextStyle(color: Colors.white),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Icon(
                              Icons.edit,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(0, 0, 25, 0),
                        child: Container(
                          height: 1.0,
                          width: 100.0,
                          color: Colors.blue,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 15, 10, 8),
                        child: Text("XYZ Name",
                            style:
                                TextStyle(color: Colors.white, fontSize: 20)),
                      ),
                    ],
                  ),
                  Spacer(),
                ],
              ),
            ),
            SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 33),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Bio",
                        style: TextStyle(color: Colors.white),
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: TextField(
                      autocorrect: true,
                      minLines: 1,
                      maxLines: 3,
                      decoration: InputDecoration(
                          fillColor: Colors.white,
                          focusColor: Colors.white,
                          hintText: "My Bio",
                          hintStyle: TextStyle(color: Colors.blue),
                          labelStyle:
                              TextStyle(color: Colors.blue, fontSize: 20),
                          helperMaxLines: 3,
                          hintMaxLines: 3,
                          border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.blue, width: 3),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          prefixIcon: Icon(Icons.face_rounded),
                          filled: true,
                          hoverColor: Colors.white),
                    ),
                  ),
                  FloatingActionButton.extended(
                    label: Text("Save Changes"),
                    onPressed: null,
                  )
                ],
              ),
            )
          ],
        ),
      ]),
    );
  }
}
