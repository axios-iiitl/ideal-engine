import 'dart:io';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class NewPost extends StatefulWidget {
  @override
  _NewPostState createState() => _NewPostState();
}

class _NewPostState extends State<NewPost> {
  bool imageSelected = false;
  File _image;
  final picker = ImagePicker();
  Future getImage() async {
    final pickImage = await picker.getImage(source: ImageSource.gallery);
    if (pickImage != null) {
      _image = File(pickImage.path);
    } else {
      print("not");
    }
  }

  int selectedRadio;
  @override
  void initState() {
    super.initState();
    setState(() {
      selectedRadio = 0;
    });
  }

  setSelectedRadio(int value) {
    setState(() {
      selectedRadio = value;
    });
  }

  imageIsSelected() {
    setState(() {
      imageSelected = !imageSelected;
    });
  }

  @override
  Widget _buildChild() {
    if (selectedRadio == 1) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          ButtonBar(
            alignment: MainAxisAlignment.center,
            children: <Widget>[
              new Radio(
                value: 1,
                groupValue: selectedRadio,
                onChanged: (value) {
                  setSelectedRadio(value);
                },
              ),
              Text(
                "Text",
                style: TextStyle(color: Colors.white),
              ),
              new Radio(
                value: 2,
                groupValue: selectedRadio,
                onChanged: (value) {
                  setSelectedRadio(value);
                },
              ),
              Text(
                "Poll",
                style: TextStyle(color: Colors.white),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(18, 5, 10, 0),
            child: Text(
              "Heading",
              textAlign: TextAlign.start,
              style: TextStyle(fontSize: 15, color: Colors.white),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(2)),
            child: TextField(
              minLines: 1,
              maxLines: 2,
              decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue),
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue, width: 3),
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  hoverColor: Colors.white),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(18, 5, 10, 0),
            child: Text(
              "Content",
              textAlign: TextAlign.start,
              style: TextStyle(fontSize: 15, color: Colors.white),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              children: [
                RaisedButton.icon(
                    color: Colors.black,
                    onPressed: () {
                      imageIsSelected();
                      getImage();
                    },
                    icon: Icon(
                      Icons.image,
                      color: Colors.white,
                    ),
                    label: Text(
                      "Add an Image",
                      style: TextStyle(color: Colors.white),
                    )),
                RaisedButton.icon(
                    onPressed: null,
                    icon: Icon(
                      Icons.text_fields,
                      color: Colors.white,
                    ),
                    label: Text(
                      "Text",
                      style: TextStyle(color: Colors.white),
                    ))
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(2)),
            child: TextField(
              maxLines: 4,
              decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue),
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue, width: 3),
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  hoverColor: Colors.white),
            ),
          ),
          Container(
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: FloatingActionButton.extended(
                  elevation: 10,
                  hoverColor: Colors.pink,
                  splashColor: Colors.red,
                  focusColor: Colors.deepOrange,
                  label: Text(
                    "Post",
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: null),
            ),
          ),
        ],
      );
    } else {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          ButtonBar(
            alignment: MainAxisAlignment.center,
            children: <Widget>[
              new Radio(
                value: 1,
                groupValue: selectedRadio,
                onChanged: (value) {
                  setSelectedRadio(value);
                },
              ),
              Text(
                "Text",
                style: TextStyle(color: Colors.white),
              ),
              new Radio(
                value: 2,
                groupValue: selectedRadio,
                onChanged: (value) {
                  setSelectedRadio(value);
                },
              ),
              Text(
                "Poll",
                style: TextStyle(color: Colors.white),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(25, 10, 10, 10),
            child: Text(
              "Poll Question?",
              textAlign: TextAlign.start,
              style: TextStyle(fontSize: 15, color: Colors.white),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(2)),
            child: TextField(
              maxLines: 1,
              decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue),
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue, width: 3),
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  hoverColor: Colors.white),
            ),
          ),
          SizedBox(
            height: 50,
          ),
          Container(
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: FloatingActionButton.extended(
                  elevation: 10,
                  hoverColor: Colors.pink,
                  splashColor: Colors.red,
                  focusColor: Colors.deepOrange,
                  label: Text(
                    "Post",
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: null),
            ),
          ),
        ],
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SizedBox(
          child: Container(
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(13),
              border: Border.all(
                color: Colors.white,
                width: 3,
              ),
            ),
            child: Padding(
                padding: const EdgeInsets.fromLTRB(8, 40, 8, 0),
                child: _buildChild()),
          ),
        ),
      ),
    );
  }
}
