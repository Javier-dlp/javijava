import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:javijava/text_utils.dart';
import 'package:timeline_list/timeline_list.dart';
import 'package:url_launcher/url_launcher.dart';

class Experience extends StatelessWidget {
  static const double wideLayoutWidth = TextUtils.wideLayoutWidth;

  @override
  Widget build(BuildContext context) {
    final jobs = getJobs();
    return LayoutBuilder(builder: (context, constraints) {
      final minimumWidth = _naturalTimelineWidth(context, jobs);
      final proposedPadding = constraints.maxWidth * .15;
      final hasRoom = constraints.maxWidth - proposedPadding >= minimumWidth;
      final rightPadding = MediaQuery.of(context).size.width >= wideLayoutWidth && hasRoom
          ? proposedPadding : 0.0;
      return Padding(
        padding: EdgeInsets.only(right: rightPadding),
        child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextUtils.getTitle("Experience"),
          Text(""),
          Timeline(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            properties: TimelineProperties(
              timelinePosition: TimelinePosition.center,
              iconSize: 36,
              lineColor: Colors.black,
              markerGap: 0,
            ),
            children: jobs,
          ),
        ]
      ));
    });
  }

  double _naturalTimelineWidth(BuildContext context, List<Marker> jobs) {
    var widest = 0.0;
    for (final job in jobs) {
      final card = job.child as ListView;
      final children = (card.childrenDelegate as SliverChildListDelegate).children;
      for (var child in children) {
        if (child is InkWell) child = child.child!;
        final InlineSpan span;
        if (child is Text) {
          span = TextSpan(text: child.data, style: DefaultTextStyle.of(context).style.merge(child.style));
        } else if (child is RichText) {
          span = child.text;
        } else {
          continue;
        }
        final painter = TextPainter(
          text: span,
          textDirection: Directionality.of(context),
          textScaler: MediaQuery.textScalerOf(context),
        )..layout();
        widest = math.max(widest, painter.width);
        painter.dispose();
      }
    }
    // Two content columns plus the marker, icon gaps and timeline padding.
    return widest * 2 + 128;
  }

  List<Marker> getJobs() {
    return [
      getJob(
        MarkerPosition.left,
        "Engineering Manager",
        { "2022-Now": "DKB Code Factory" }
      ),
      getJob(
        MarkerPosition.right,
        "Full-stack Developer",
        { "2021-2022": "Creator of moviemirador.com" },
        "https://moviemirador.com"
      ),
      getJob(
        MarkerPosition.left,
        "Senior Software Engineer",
        { "2017-2020": "AUTO1 Group" }
      ),
      getJob(
        MarkerPosition.right,
        "Technical Leader",
        { "2017": "bonial.com" }
      ),
      getJob(
        MarkerPosition.left,
        "Senior Developer",
        {
          "2015-2016": "bonial.com",
          "2012-2014": "Protec Mobile",
        }
      ),
      getJob(
        MarkerPosition.right,
        "Junior Developer",
        {
          "2008-2010": "Alten",
          "2007-2008": "Tecnocom"
        }
      ),
    ];
  }

  Marker getJob(MarkerPosition position, String title, Map<String, String> companiesByDate, [String? url]) {
    return Marker(
      child: getCard(position, title, companiesByDate, url),
      position: position == MarkerPosition.left ? MarkerPosition.right : MarkerPosition.left,
      icon: Container(
        decoration: BoxDecoration(shape: BoxShape.circle, color: TextUtils.darkBlue),
        child: Icon(Icons.blur_circular, color: Colors.black, size: 24),
      )
    );
  }

  Widget getCard(MarkerPosition position, String title, Map<String, String> companiesByDate, [String? url]) {
    var textAlign = position == MarkerPosition.left ? TextAlign.right : TextAlign.left;
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
