import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:ideal_engine/Models/login_model.dart';
import 'package:http/http.dart' as http;

GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['profile']);

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

Future<LoginRequest> createUser(
    String email, String googleId, String name) async {
  final String url = "https://boiling-wave-98502.herokuapp.com/auth/register";
  final response = await http.post(url, body: {
    "email": email,
    "googleId": googleId,
    "name": name,
  });
  if (response.statusCode == 200) {
    final String responseString = response.body;
    return loginRequestFromJson(responseString);
  } else {
    return null;
  }
}

class _LoginScreenState extends State<LoginScreen> {
  LoginRequest _login;
  GoogleSignInAccount _currentUser;

  @override
  void initState() {
    super.initState();
    _googleSignIn.onCurrentUserChanged.listen((GoogleSignInAccount account) {
      setState(() {
        _currentUser = account;
      });
    });
    _googleSignIn.signInSilently();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: _profile(),
      ),
    );
  }

  Widget _profile() {
    if (_currentUser != null) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(_currentUser.displayName),
          SizedBox(
            height: 60,
          ),
          Text(_currentUser.email),
          SizedBox(
            height: 60,
          ),
          FloatingActionButton.extended(
            label: Text("Let's Go"),
            onPressed: () async {
              final LoginRequest login = await createUser(_currentUser.email,
                  _currentUser.id, _currentUser.displayName);
              setState(() {
                _login = login;
              });
            },
          ),
          SizedBox(
            height: 30,
          ),
          RaisedButton(
            onPressed: _signOut,
            child: Text('SIGN OUT'),
          )
        ],
      );
    } else {
      return Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            FloatingActionButton.extended(
                hoverColor: Colors.white,
                backgroundColor: Color(0xff4285F4),
                icon: Image.asset(
                  "assets/images/google_logo2.png",
                  height: 30,
                  width: 30,
                ),
                onPressed: () async {
                  _signIn();
                },
                label: Text(
                  "Sign Up with Google",
                  style: TextStyle(color: Colors.white),
                )),
            SizedBox(
              height: 50,
            ),
            FloatingActionButton.extended(
                hoverColor: Colors.white,
                backgroundColor: Colors.white,
                icon: Image.asset(
                  "assets/images/google_logo.png",
                  height: 30,
                  width: 30,
                ),
                onPressed: () async {
                  _signIn();
                },
                label: Text(
                  "Sign In with Google",
                  style: TextStyle(color: Colors.black),
                )),
          ],
        ),
      );
    }
  }

  Future<void> _signIn() async {
    try {
      await _googleSignIn.signIn();
    } catch (error) {
      print(error);
    }
  }

  Future<void> _signOut() async {
    _googleSignIn.disconnect();
  }
}
