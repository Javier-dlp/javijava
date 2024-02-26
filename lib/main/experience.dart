import 'package:flutter/material.dart';
import 'package:javijava/text_utils.dart';
import 'package:timeline_list/timeline.dart';
import 'package:timeline_list/timeline_model.dart';
import 'package:url_launcher/url_launcher.dart';

class Experience extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var rightPadding = size.width*.05;

    return Container(
      padding: EdgeInsets.only(right: rightPadding),
      child:  Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextUtils.getTitle("Experience"),
          Text(""),
          Timeline(
            shrinkWrap: true,
            children: getJobs(),
          ),
        ]
      )
    );
  }

  List<TimelineModel> getJobs() {
    return [
      getJob(
        TimelineItemPosition.left,
        "Engineering Manager",
        { "2022-Now": "DKB Code Factory" },
      ),
      getJob(
        TimelineItemPosition.right,
        "Full stack Developer",
        { "2021-2022": "Creator of moviemirador.com" },
        "https://moviemirador.com"
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

  TimelineModel getJob(TimelineItemPosition position, String title, Map<String, String> companiesByDate, [String? url]) {
    return TimelineModel(
      getCard(position, title, companiesByDate, url),
      position: position,
      iconBackground: TextUtils.darkBlue,
      icon: Icon(Icons.blur_circular)
    );
  }

  Widget getCard(TimelineItemPosition position, String title, Map<String, String> companiesByDate, [String? url]) {
    var textAlign = position == TimelineItemPosition.left ? TextAlign.right : TextAlign.left;
    List<Widget> children = [
      TextUtils.getText(title, bold: true, fontSize: TextUtils.titleSize, textAlign: textAlign)
    ];
    children.addAll(companiesByDate.entries.map((e) => mapEntry(e, textAlign, url)).toList());

    return ListView(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      padding: EdgeInsets.only(top: 20, bottom: 20),
      children: children,
    );
  }

  Widget mapEntry(MapEntry<String, String> companyByDate, TextAlign textAlign, [String? url]) {
    var dateStyle = TextStyle(fontSize: TextUtils.textSize, fontStyle: FontStyle.normal, fontWeight: FontWeight.normal, color: Colors.black);
    var companyStyle = TextStyle(fontSize: TextUtils.titleSize, fontWeight: FontWeight.w300, color: Colors.black);
    var hyperStyle = TextStyle(fontSize: TextUtils.titleSize, fontWeight: FontWeight.w500, color: Colors.blueAccent, decoration: TextDecoration.underline);

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
      var desc = companyByDate.value;
      var hyperText = "";
      if (url?.isNotEmpty ?? false) {
        RegExpMatch? firstMatch = RegExp("[A-Za-z]+\.com").firstMatch(desc);
        if (firstMatch != null) {
          desc = desc.substring(0, firstMatch.start);
          hyperText = firstMatch.group(0)!;
        }
      }
      text = TextSpan(
        text: companyByDate.key,
        style: dateStyle,
        children: [
          TextSpan(text: "   "),
          TextSpan(text: desc, style: companyStyle),
          TextSpan(text: hyperText, style: hyperStyle),
        ]
      );
    }

    if (url?.isNotEmpty ?? false) {
      return InkWell(onTap: () => call(url!), child: RichText(text: text, textAlign: textAlign,),);
    }
    else return RichText(text: text, textAlign: textAlign,);
  }

  Future<void> call(String url) async {
    await canLaunch(url) ? await launch(url) : throw 'Could not launch $url';
  }
}