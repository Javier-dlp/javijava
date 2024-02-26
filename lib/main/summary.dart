import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:javijava/text_utils.dart';

class Summary extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextUtils.getTitle("Summary"),
          Text(""),
          TextUtils.getText("""
IT Leader with a 15 year trajectory in JVM Backend technologies, I excel in developing cloud-native, high-scalable systems and product-oriented development.\n
My expertise lies not just in technical leadership but also in driving teams towards faster and successful project deliveries through cross-functional collaboration."""),
        ]
      )
    );
  }
}