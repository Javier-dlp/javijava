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
IT Professional with over 10 years of experience specialized on JVM BE technologies with focus on: micro-service architecture, supporting apps, and application lifecycle.
\nI am passionate about helping teams and companies to move into faster, more reliable iterations."""),
        ]
      )
    );
  }
}