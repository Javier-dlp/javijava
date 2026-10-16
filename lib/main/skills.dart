

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
                  getSkillsTable(constraints.maxWidth.clamp(0.0, 260.0).toDouble())
                ],
              );
            }
          )
        )
      ]
    );
  }

  static const skills = {
    "Engineering management & coaching": 4,
    "Architecture & code review": 4,
    "Scrum": 5,
    "Kotlin": 3,
    "Java": 4,
    "Spring / Spring Boot": 4,
    "SQL / databases": 4,
    "CI/CD": 4,
    "AWS / Microservices": 4,
  };

  Table getSkillsColumn() => getSkillsTable(180);

  Table getSkillsTable([double width = 260]) {
    return Table(
      columnWidths: {
        0: FixedColumnWidth(width - 70),
        1: FixedColumnWidth(70),
      },
      defaultVerticalAlignment: TableCellVerticalAlignment.middle,
      children: skills.entries.map((skill) => getSkillRow(skill.key, skill.value)).toList(),
    );
  }

  Future<void> call(String url) async {
    await canLaunch(url) ? await launch(url) : throw 'Could not launch $url';
  }

  TableRow getSkillRow(String text, int rating) {
    return TableRow(
      children: [
        Padding(
          padding: EdgeInsets.only(right: 10, top: 6, bottom: 6),
          child: TextUtils.getText(text),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: List.generate(5, (index) => Icon(
            index < rating ? Icons.circle : Icons.circle_outlined,
            color: TextUtils.darkBlue,
            size: 14,
          )),
        ),
      ],
    );
  }

}
