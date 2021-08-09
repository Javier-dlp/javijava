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
      body: Center(
        heightFactor: 1.2,
        child: size.width < 600 ? getListView() : getGridView(size),
      ),
    );
  }

  ListView getListView() {
    var column = ListView(
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

  Row getGridView(Size size) {
    var row = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: size.width*.3,
          constraints: BoxConstraints(maxWidth: size.width*.3),
          child: ListView(
            children: [
              Contact(),
              Text(""),
              Text(""),
              Skills(CrossAxisAlignment.center),
            ],
          )
        ),
        Spacer(),
        Container(
          width: size.width*.6,
          child: ListView(
            children: [
              Text(""),
              Summary(),
              Text(""),
              Experience(),
            ],
          )
        ),
        Spacer(),
      ],
    );
    return row;
  }

}
