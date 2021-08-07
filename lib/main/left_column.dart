
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:javijava/text_utils.dart';
import 'package:mailto/mailto.dart';
import 'package:url_launcher/url_launcher.dart';

class LeftColumn extends StatelessWidget {

  final double width;

  LeftColumn(this.width);

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(maxWidth: width),
      child: ListView(
        shrinkWrap: true,
        children: [
          geCardId(),
          const Text(""),
          getContact(),
          const Text(""),
          const Text(""),
          const Text(""),
          const Text(""),
          const Text(""),
          getSkills(),
        ],
      )
    );
  }

  Widget geCardId() {
    return Column(
      children: [
        Container(
          height: 200,
          width: 200,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.black,
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage("assets/photo.jpg"),
            ),
          ),
        ),
        TextUtils.getText("G'DAY, I'M JAVIER DE LA PEÑA", fontSize: TextUtils.superTitleSIze, bold: true, textAlign: TextAlign.center),
        TextUtils.getText("Sr. Software Engineer", fontSize: TextUtils.titleSize),
      ]
    );
  }

  Widget getContact() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        InkWell(
          child: SvgPicture.network("https://upload.wikimedia.org/wikipedia/commons/c/c9/Linkedin.svg", height: 50,),
          onTap: () {
            var url = "https://www.linkedin.com/in/javier-de-la-pena";
            call(url);
          },
        ),
        Container(width: 25,),
        InkWell(
          child: Icon(Icons.email_outlined, size: 60.0,),
          onTap: () {
            var mailto = Mailto(
                to: [ "javier.pfayos@gmail.com" ],
                subject: "From javijava.com"
            );
            call("https://$mailto");
          },
        ),
      ],
    );
  }

  Widget getSkills() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children :[
        Flexible(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextUtils.getTitle("Skills"),
              Text(""),
              Container(
                child: LayoutBuilder(
                  builder: (BuildContext context, BoxConstraints constraints) => constraints.maxWidth > 160 ? getSkillsTable() : getSkillsColumn(),
                ),
              )
            ],
          )
        )
      ]
    );
  }

  Table getSkillsTable() {
    return Table(
      // defaultColumnWidth: FixedColumnWidth(160.0),
      columnWidths: {0: FixedColumnWidth(160), 1: FixedColumnWidth(80)},
      children: [
        getSkillRow("Java", 5),
        getSkillRow("Python, Dart, Kotlin", 2),
        getSkillRow("Groovy", 3),
        getSkillRow("Spring", 4),
        getSkillRow("AWS, Micro-services", 4),
        getSkillRow("Terraform", 3),
        getSkillRow("DBs", 4),
        getSkillRow("Scrum", 4),
      ],
    );
  }

  Table getSkillsColumn() {
    return Table(
      // defaultColumnWidth: FixedColumnWidth(160.0),
      columnWidths: {0: FlexColumnWidth(1)},
      children: [
        getSkillRow("Java"),
        getSkillRow("Python, Dart, Kotlin"),
        getSkillRow("Groovy"),
        getSkillRow("Spring"),
        getSkillRow("AWS, Micro-services"),
        getSkillRow("Terraform"),
        getSkillRow("DBs"),
        getSkillRow("Scrum"),
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
        height: 35,),
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