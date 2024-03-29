import 'package:at3am/core/assets_manager.dart';
import 'package:at3am/core/color_manger.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../core/string_manager.dart';

class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double myHeight= MediaQuery.of(context).size.height ;
    double myWidth=  MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.transparent,elevation: 0,),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(top: myHeight*.04, left: myWidth * .03, right: myWidth * .03),
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                    image: DecorationImage(image: AssetImage(ImageAssets.splashLogo),fit: BoxFit.cover),
                ),
                height: myHeight*.30,
                width: myWidth,
              ),
              SizedBox(height: myHeight*.03),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'إطعام',
                    style: GoogleFonts.mochiyPopOne(
                      textStyle: TextStyle(color: Colors.black, fontWeight: FontWeight.w600 ,letterSpacing: .5, fontSize: 35.0,),
                    ),
                  ),
                  SizedBox(width: 5.0,),
                  Text(
                    'عن',
                    style: GoogleFonts.orbitron(
                      textStyle: TextStyle(color: Colors.black,fontWeight: FontWeight.w700 ,letterSpacing: .5, fontSize: 25.0,),
                    ),
                  ),
                ],
              ),
              SizedBox(height: myHeight*.01),
              Container(
                child: Center(
                  child: LayoutBuilder(builder: (context, c) {
                    return Text(
                      '${AppString.aboutUs}',
                      textAlign: TextAlign.justify,
                      textDirection: TextDirection.rtl,
                      style: GoogleFonts.notoSerif(
                        textStyle: TextStyle(color: Colors.black, fontWeight: FontWeight.w600 ,letterSpacing: .5, fontSize: 20.0,),
                      ),
                    );
                    // TextJustifyRTL(
                    //   textToEnter,
                    //   textDirection: TextDirection.rtl,
                    //   style: TextStyle(fontFamily: 'uthmanTnB', fontSize: 21),
                    //   boxConstraints: c,
                    // );
                  }),
                ),
              ),
              SizedBox(height: myHeight*.03),
            ],
          ),
        ),
      ),);
  }
}
