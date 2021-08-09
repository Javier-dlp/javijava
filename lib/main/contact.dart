
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:javijava/text_utils.dart';
import 'package:mailto/mailto.dart';
import 'package:url_launcher/url_launcher.dart';

class Contact extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        getIdentityCard(),
        const Text(""),
        getContact(),
      ]
    );
  }

  Widget getIdentityCard() {
    return Container(
      child:  Column(
        children: [
          getPhtoto(),
          TextUtils.getText("G'DAY, I'M JAVIER DE LA PEÑA", fontSize: TextUtils.superTitleSIze, bold: true, textAlign: TextAlign.center),
          TextUtils.getText("Sr. Software Engineer", fontSize: TextUtils.titleSize),
        ]
      )
    );
  }

  Container getPhtoto() {
    return Container(
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

  Future<void> call(String url) async {
    await canLaunch(url) ? await launch(url) : throw 'Could not launch $url';
  }

}