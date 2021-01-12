import 'dart:io';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class NewPost extends StatefulWidget {
  @override
  _NewPostState createState() => _NewPostState();
}

class _NewPostState extends State<NewPost> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _nameController;
  static List<String> optionsList = [null];
  bool imageSelected = false;
  File _image;
  final picker = ImagePicker();
  Future getImage() async {
    final pickImage = await picker.getImage(source: ImageSource.gallery);
    if (pickImage != null) {
      _image = File(pickImage.path);
      print("done");
      showImageDialog(context, _image);
    } else {
      print("not");
    }
  }

  int selectedRadio;
  @override
  void initState() {
    super.initState();
    setState(() {
      selectedRadio = 1;
      _nameController = TextEditingController();
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
  void dispose() {
    _nameController.dispose();
    super.dispose();
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
                    onPressed: () async {
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
              padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
              child: FloatingActionButton.extended(
                  elevation: 10,
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
          Container(
            child: _buildOptions(),
          ),
          SizedBox(
            height: 20,
          ),
        ],
      );
    }
  }

  @override
  Widget _buildOptions() {
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.all(2.0),
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(25, 10, 10, 10),
                child: Text(
                  "Options",
                  style: TextStyle(color: Colors.white),
                  textAlign: TextAlign.left,
                ),
              ),
              ..._getOptions(),
              Padding(
                padding: const EdgeInsets.all(0),
                child: TextFormField(
                  controller: _nameController,
                  validator: (v) {
                    if (v.trim().isEmpty) return 'Please enter something';
                    return null;
                  },
                ),
              ),
              Center(
                child: FloatingActionButton.extended(
                  onPressed: () {
                    if (_formKey.currentState.validate()) {
                      _formKey.currentState.save();
                    }
                  },
                  label: Text('Post'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> _getOptions() {
    List<Widget> optionsTextFields = [];
    for (int i = 0; i < optionsList.length; i++) {
      optionsTextFields.add(Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0),
        child: Row(
          children: [
            Expanded(child: OptionsTextFields(i)),
            SizedBox(
              width: 16,
            ),
            // we need add button at last friends row
            _addRemoveButton(i == optionsList.length - 1, i),
          ],
        ),
      ));
    }
    return optionsTextFields;
  }

  Widget _addRemoveButton(bool add, int index) {
    return InkWell(
      onTap: () {
        if (add) {
          // add new text-fields at the top of all friends textfields
          optionsList.insert(optionsList.length, null);
        } else
          optionsList.removeAt(index);
        setState(() {});
      },
      child: Container(
        width: 30,
        height: 30,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Icon(
          (add) ? Icons.add : Icons.delete,
          color: (add) ? Colors.green : Colors.red,
          size: 30.0,
        ),
      ),
    );
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

class OptionsTextFields extends StatefulWidget {
  final int index;
  OptionsTextFields(this.index);
  @override
  _OptionsTextFieldsState createState() => _OptionsTextFieldsState();
}

class _OptionsTextFieldsState extends State<OptionsTextFields> {
  TextEditingController _nameController;
  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _nameController.text = _NewPostState.optionsList[widget.index] ?? '';
    });

    return TextFormField(
      controller: _nameController,
      onChanged: (v) => _NewPostState.optionsList[widget.index] = v,
      maxLines: 1,
      decoration: InputDecoration(
        hintText: 'Enter an option',
        filled: true,
        fillColor: Colors.white,
      ),
      validator: (v) {
        if (v.trim().isEmpty) return 'Please enter something';
        return null;
      },
    );
  }
}

showImageDialog(context, img) {
  return showDialog(
      context: context,
      builder: (context) {
        return Center(
          child: Material(
            type: MaterialType.transparency,
            child: SingleChildScrollView(
              child: Container(
                  padding: EdgeInsets.all(15.0),
                  width: MediaQuery.of(context).size.width * 0.7,
                  height: MediaQuery.of(context).size.height * 0.5,
                  child: Column(
                    children: [
                      Container(
                        child: ClipRRect(
                          child: Image.file(
                            img,
                            height: MediaQuery.of(context).size.height * 0.35,
                            fit: BoxFit.fitHeight,
                          ),
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          FloatingActionButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            backgroundColor: Colors.red,
                            child: Icon(Icons.clear),
                          ),
                          FloatingActionButton(
                            onPressed: () {
                              print(img);
                              Navigator.of(context).pop();
                            },
                            backgroundColor: Colors.green,
                            child: Icon(
                              Icons.done,
                              color: Colors.white,
                            ),
                          )
                        ],
                      )
                    ],
                  )),
            ),
          ),
        );
      });
}
