import 'dart:async';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  startTime() async {
    var _duration = new Duration(seconds: 3);
    return new Timer(_duration, navigationPage);
  }

  void navigationPage() {
    Navigator.of(context).pushReplacementNamed('/root');
  }

  @override
  void initState() {
    super.initState();
    startTime();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints){
        return OrientationBuilder(
          builder: (context, orientation){
            SizerUtil().init(constraints, orientation);
            return Scaffold(
              resizeToAvoidBottomInset: false,
              body: Container(
                  color: Color.fromRGBO(143, 238, 191, 1),
                  alignment: Alignment.center,
                  padding: EdgeInsets.fromLTRB(30, 70, 30, 0),
                  child: Column(
                    children: [
                      Text("Curhat.in", textScaleFactor: 1.3,
                        style: TextStyle(fontSize: 5.0.h, fontFamily: "AdreenaScript", color: Colors.white,
                            shadows: [
                              Shadow(blurRadius: 10.0, color: Colors.black38, offset: Offset(1, 1)),
                            ]),),
                      Text(
                        "Ruang Konsultasi Online Berbasis\nAndroid untuk Mahasiswa IPB", textScaleFactor: 1.3,
                        style: TextStyle(fontSize: 1.6.h, color: Colors.white, fontStyle: FontStyle.italic, fontFamily: "OpenSans-Regular",
                            shadows: [
                              Shadow(blurRadius: 10.0, color: Colors.black38, offset: Offset(2, 2)),
                            ]),
                        textAlign: TextAlign.center,),
                      Padding(
                        padding:EdgeInsets.only(top: 10.0.h),
                      ),
                      Container(
                        height: 40.0.h,
                        child: Image.asset("assets/images/image-landing-page.png", scale: 0.1,)
                      )
                    ],
                  )
              ),
            );
        });
    });
  }
}