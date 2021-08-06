import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:javijava/text_utils.dart';
import 'package:timeline_list/timeline.dart';
import 'package:timeline_list/timeline_model.dart';

class RightColumn extends StatelessWidget {

  final double width;

  RightColumn(this.width);

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(maxWidth: width),
      child: ListView(
        shrinkWrap: true,
        children: [
          getSummary(),
          Text(""),
          Text(""),
          TextUtils.getTitle("Experience"),
          Text(""),
          getExperience(width),
        ]
      )
    );
  }

  Widget getSummary() {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextUtils.getTitle("Summary"),
          Text(""),
          TextUtils.getText("""
IT Professional with over 10 years of experience specialized on JVM BE technologies with focus on: micro-service architecture, supporting apps, and application lifecycle.
\nI am passionate about helping teams and companies to move into faster, more reliable iterations."""),
        ]
    );
  }

  Widget getExperience(double width) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Flexible(
          child: Container(
            constraints: BoxConstraints(maxWidth: 770),
            padding: EdgeInsets.only(right: 75),
            child: Timeline(
              shrinkWrap: true,
              children: getJobs(),
            ),
          )
        )
      ]
    );
  }

  List<TimelineModel> getJobs() {
    return [
      getJob(
        TimelineItemPosition.right,
        "Full stack Developer",
        { "2021-Now": "Freelance Movie Recommender App" }
      ),
      getJob(
        TimelineItemPosition.left,
        "Senior Software Engineer",
        { "2017-2020": "Auto1 Group" }
      ),
      getJob(
        TimelineItemPosition.right,
        "Technical Leader",
        { "2017": "bonial.com" }
      ),
      getJob(
        TimelineItemPosition.left,
        "Senior Developer",
        {
          "2015-2016": "bonial.com",
          "2012-2014": "Protec Mobile",
        }
      ),
      getJob(
        TimelineItemPosition.right,
        "Junior Developer",
        {
          "2008-2010": "Alten",
          "2007-2008": "Tecnocom"
        }
      ),
    ];
  }

  TimelineModel getJob(TimelineItemPosition position, String title, Map<String, String> companiesByDate) {
    return TimelineModel(
      getCard(position, title, companiesByDate),
      position: position,
      iconBackground: TextUtils.darkBlue,
      icon: Icon(Icons.blur_circular)
    );
  }

  Widget getCard(TimelineItemPosition position, String title, Map<String, String> companiesByDate) {
    var textAlign = position == TimelineItemPosition.left ? TextAlign.right : TextAlign.left;
    List<Widget> children = [
      TextUtils.getText(title, bold: true, fontSize: 24, textAlign: textAlign)
    ];
    children.addAll(companiesByDate.entries.map((e) => mapEntry(e, textAlign)).toList());

    return ListView(
      shrinkWrap: true,
      padding: EdgeInsets.only(top: 20, bottom: 20),
      children: children,
    );
  }

  Widget mapEntry(MapEntry<String, String> companyByDate, TextAlign textAlign) {
    var dateStyle = TextStyle(fontSize: TextUtils.textSize, fontStyle: FontStyle.normal, fontWeight: FontWeight.normal,);
    var companyStyle = TextStyle(fontSize: TextUtils.titleSize-4, fontStyle: FontStyle.normal, fontWeight: FontWeight.w300);

    var text;
    if (textAlign == TextAlign.right) {
      text = TextSpan(
        text: companyByDate.value,
        style: companyStyle,
        children: [
          TextSpan(text: "   "),
          TextSpan(text: companyByDate.key, style: dateStyle)
        ]
      );
    } else {
      text = TextSpan(
        text: companyByDate.key,
        style: dateStyle,
        children: [
          TextSpan(text: "   "),
          TextSpan(text: companyByDate.value, style: companyStyle)
        ]
      );
    }

    return RichText(text: text, textAlign: textAlign,);
  }
}