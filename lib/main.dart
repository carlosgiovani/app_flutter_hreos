import 'package:app_flutter_herois/home_page.dart';
import 'package:app_flutter_herois/list_person.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Heros',
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

