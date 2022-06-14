import 'package:flutter/material.dart';
import 'package:taskify/pages/home_page.dart';
import 'package:hive_flutter/hive_flutter.dart';

//Hive is a NoSql Key value Database..
/*Use initialise splashscreen for the timebeing
  when you need to retreive all the databases*/
void main() async {
  await Hive.initFlutter("hive_boxes");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Taskify',
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
      ),
      home: HomePage(),
    );
  }
}
