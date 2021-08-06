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

    return Scaffold(
      body: Center(
        // heightFactor: 1.2,
        // widthFactor: 1.2,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            LeftColumn(size.width*.3),
            Spacer(),
            RightColumn(size.width*.6),
          ],
        ),
      ),
    );
  }

}
