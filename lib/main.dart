import 'package:flutter/material.dart';
import 'package:ideal_engine/Frypan/Screens/mainScreen.dart';
import 'package:ideal_engine/loginScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      color: Colors.black,
      home: LoginScreen(),
    );
  }
}
