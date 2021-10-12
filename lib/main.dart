
import 'package:animation/timer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'main_page.dart';
import 'stop_watch.dart';

void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      darkTheme: ThemeData.dark(),
      themeMode: ThemeMode.dark,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:  MainPage(),
    );
  }
}



