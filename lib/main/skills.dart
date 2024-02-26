

import 'package:flutter/material.dart';
import 'package:javijava/text_utils.dart';
import 'package:url_launcher/url_launcher.dart';

class Skills extends StatelessWidget {

  CrossAxisAlignment? alignment;

  Skills([this.alignment]);

  @override
  Widget build(BuildContext context, [CrossAxisAlignment crossAxisAlignment = CrossAxisAlignment.start]) {
    return Column(
      crossAxisAlignment: alignment ?? CrossAxisAlignment.start,
      children: [
        TextUtils.getTitle("Skills"),
        Text(""),
        Container(
          child: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  constraints.maxWidth > 260 ? getSkillsTable() : getSkillsColumn()
                ],
              );
            }
          )
        )
      ]
    );
  }

  Table getSkillsColumn() {
    return Table(
      columnWidths: {0: FixedColumnWidth(160)},
      children: [
        getSkillRow("Kotlin"),
        getSkillRow("Java"),
        getSkillRow("Python, Dart"),
        getSkillRow("Groovy"),
        getSkillRow("Spring"),
        getSkillRow("AWS, Micro-services"),
        getSkillRow("Terraform"),
        getSkillRow("DBs"),
        getSkillRow("Scrum"),
      ],
    );
  }

  Table getSkillsTable() {
    return Table(
      columnWidths: {0: FixedColumnWidth(160), 1: FixedColumnWidth(80)},
      children: [
        getSkillRow("Kotlin", 3),
        getSkillRow("Java", 5),
        getSkillRow("Python, Dart", 2),
        getSkillRow("Groovy", 3),
        getSkillRow("Spring", 5),
        getSkillRow("AWS, Micro-services", 4),
        getSkillRow("Terraform", 3),
        getSkillRow("DBs", 4),
        getSkillRow("Scrum", 5),
      ],
    );
  }

  Future<void> call(String url) async {
    await canLaunch(url) ? await launch(url) : throw 'Could not launch $url';
  }

  TableRow getSkillRow(String text, [int noStars = 0]) {
    var children = [
      Container(
        child: TextUtils.getText(text, textAlign: TextAlign.left),
        padding: EdgeInsets.only(right: 10),
        alignment: Alignment.centerLeft,
        height: 35,
      ),
    ];
    if (noStars > 0) {
      children.add(
        Container(
          child: getStars(noStars),
          height: 35,
        )
      );
    }
    return TableRow(
      children: children,
    );
  }

  Widget getStars(int noStars) {
    List<Widget> stars = [];
    for (int i=1; i<6; i++) {
      stars.add(i <= noStars ? Icon(Icons.circle, color: TextUtils.darkBlue, size: 16,) : Icon(Icons.circle_outlined, size: 16,));
    }
    return Row(
      children: stars,
    );
  }

}