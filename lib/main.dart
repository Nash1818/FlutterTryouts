import 'package:flutter/material.dart';
import 'package:side_and_dash/layout.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dash',
      theme: ThemeData(primarySwatch: Colors.amber),
      home: MenuDashboardPage(),
    );
  }
}
