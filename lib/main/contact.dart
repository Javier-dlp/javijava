
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:javijava/text_utils.dart';
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
          TextUtils.getText("JAVIER DE LA PEÑA", fontSize: TextUtils.superTitleSIze, bold: true, textAlign: TextAlign.center),
          TextUtils.getText("Engineering Manager", fontSize: TextUtils.titleSize),
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
        Spacer(flex: 5,),
        InkWell(
          child: SvgPicture.network("https://upload.wikimedia.org/wikipedia/commons/c/c9/Linkedin.svg", height: 40,),
          onTap: () => call("https://www.linkedin.com/in/javier-de-la-pena"),
        ),
        Spacer(),
        InkWell(
          child: Icon(Icons.email_outlined, size: 50.0,),
          onTap: () => call("mailto:javier.pfayos@gmail.com"),
        ),
        Spacer(),
        InkWell(
          child: SvgPicture.network("https://upload.wikimedia.org/wikipedia/commons/a/ae/Github-desktop-logo-symbol.svg", height: 40,),
          onTap: () => call("https://github.com/Javier-dlp/javijava"),
        ),
        Spacer(),
        InkWell(
          child: Icon(Icons.download, size: 50.0,),
          onTap: () => call("https://github.com/Javier-dlp/javijava/raw/master/assets/Javier_de_la_Pena_CV.pdf"),
        ),
        Spacer(flex: 5,),
      ],
    );
  }

  Future<void> call(String url) async {
    await canLaunch(url) ? await launch(url) : throw 'Could not launch $url';
  }

}