import 'package:flutter/material.dart';
import 'package:trivia/pages/home.dart';
import 'package:trivia/pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Trivia',
      theme: ThemeData(
        fontFamily: 'ArchitectsDaughter',
        scaffoldBackgroundColor: Colors.blueGrey,
        primarySwatch: Colors.blue,
      ),
      home: Home(),
    );
  }
}
