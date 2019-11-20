import 'package:app_flutter_herois/conection_api.dart';
import 'package:app_flutter_herois/home_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(SampleApp());
}

class SampleApp extends StatelessWidget {
  final String text;
  SampleApp({Key key, @required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SampleAppPage();
  }
}

class SampleAppPage extends StatefulWidget {

  @override
  _SampleAppPageState createState() => _SampleAppPageState();
}

class _SampleAppPageState extends State<SampleAppPage> {
  List widgets = <Widget>[];

  @override
  void initState() {
    super.initState();
    for (int i = 0; i <= 100; i++) {
      widgets.add(getRow(i));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sample App"),
      ),
      body: ListView(children: widgets),
    );
  }

  Widget getRow(int i) {
    return
      GestureDetector(
      child: Padding(
          padding: EdgeInsets.all(10.0),
          child: Text("Row $i")),
      onTap: () {
//        Navigator.push(context, MaterialPageRoute(builder: (context) => CardMovie(num: '$i')));
      },
    );
  }
}