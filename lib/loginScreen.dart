import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;
import 'package:ideal_engine/Frypan/Models/login_model.dart';
import 'package:ideal_engine/credentials.dart';
import 'Frypan/Screens/Carousel/carousel_page.dart';

GoogleSignIn _googleSignIn = GoogleSignIn(clientId: id ,scopes: ['profile']);

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
  GoogleSignInAuthentication auth;
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
    return MaterialApp(
      home: Container(
        decoration: new BoxDecoration(
            color: Colors.black,
            image: new DecorationImage(
              image: new AssetImage(
                  "assets/images/background/login_background.png"),
              fit: BoxFit.cover,
            )),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: new AppBar(
            backgroundColor: Colors.black,
            title: Text("Login Page"),
          ),
          body: Center(
            child: _profile(),
          ),
        ),
      ),
    );
  }

  Widget _profile() {
    if (_currentUser != null) {
      return Container(
        color: Colors.white,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: Text(
                _currentUser.displayName,
                style: TextStyle(color: Colors.black),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.1,
            ),
            Container(
              child: Text(
                _currentUser.email,
                style: TextStyle(color: Colors.black),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.1,
            ),
            FloatingActionButton.extended(
              label: Text("Let's Go"),
              onPressed: () async {
                final LoginRequest login = await createUser(_currentUser.email,
                    _currentUser.id, _currentUser.displayName);
                print(_currentUser);
                setState(() {
                  _login = login;
                });
                // add condition here -> _login.token != null
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CarouselPage()),
                );
              },
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.05,
            ),
            RaisedButton(
              elevation: 100.0,
              onPressed: _signOut,
              child: Text('SIGN OUT'),
            )
          ],
        ),
      );
    } else {
      return Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            FloatingActionButton.extended(
                hoverColor: Colors.white,
                backgroundColor: Colors.white,
                icon: Image.asset(
                  "assets/images/logos/google_colored.png",
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
      GoogleSignInAccount user = await _googleSignIn.signIn();
      auth = await user.authentication;
      print("{");
      print(auth.idToken);
      print("}{");
      print(auth.accessToken);
      print("}");
    } catch (error) {
      print(error);
    }
  }

  Future<void> _signOut() async {
    _googleSignIn.disconnect();
  }
}
