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
Engineering Manager with a 20-year trajectory in JVM technologies, building cloud-native, highly scalable systems with a product-oriented approach.
\nI combine technical leadership, coaching and cross-functional collaboration to help teams deliver software faster and more reliably."""),
        ]
      )
    );
  }
}
