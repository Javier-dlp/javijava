import 'package:flutter/material.dart';
import 'package:javijava/main/contact.dart';
import 'package:javijava/main/experience.dart';
import 'package:javijava/main/skills.dart';
import 'package:javijava/main/summary.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  var title = "Javier de la Peña";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: title,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(24),
        child: size.width < Experience.wideLayoutWidth
            ? getListView()
            : getGridView(size),
      ),
    );
  }

  ListView getListView() {
    var column = ListView(
      padding: EdgeInsets.zero,
      children: [
        Contact(),
        Text(""),
        Text(""),
        Summary(),
        Text(""),
        Text(""),
        Experience(),
        Text(""),
        Text(""),
        Skills(),
      ],
    );
    return column;
  }

  Widget getGridView(Size size) {
    var row = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          flex: 1,
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              Contact(),
              Text(""),
              Text(""),
              Skills(CrossAxisAlignment.center),
            ],
          )
        ),
        SizedBox(width: 32),
        Expanded(
          flex: 2,
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              Summary(),
              Text(""),
              Text(""),
              Experience(),
            ],
          )
        ),
      ],
    );
    return row;
  }

}
