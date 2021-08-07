import 'package:flutter/material.dart';
import 'package:javijava/main/left_column.dart';
import 'package:javijava/main/right_column.dart';

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

    var row = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        LeftColumn(size.width*.3),
        Spacer(),
        RightColumn(size.width*.6),
      ],
    );

    var column = ListView(
      children: [
        LeftColumn(size.width),
        Text(""),
        Text(""),
        RightColumn(size.width),
      ],
    );


    return Scaffold(
      body: Center(
        heightFactor: 1.2,
        child: size.width < 600 ? column : row,
      ),
    );
  }

}
