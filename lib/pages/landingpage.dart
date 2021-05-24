import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:sizer/sizer.dart';

class LandingPage extends StatefulWidget {
  LandingPage() : super();

  @override
  LandingPageState createState() => LandingPageState();
}

class LandingPageState extends State<LandingPage> {
  CarouselSlider carouselSlider;
  int _current = 0;
  List imgList = [
    'assets/images/landing-page-1.png',
    'assets/images/landing-page-2.png',
    'assets/images/landing-page-3.png'
  ];

  List<T> map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }
    return result;
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
                child: Column(
        //          Container(
        //            alignment: Alignment.topRight,
        //            padding: EdgeInsets.only(right: 30, top: 50, bottom: 50),
        //            child:
        //                (_current == imgList.length-1) ?
        //                Container(
        //                  height: 16,
        //                ) : InkWell(
        //                  onTap: () {
        //                    Navigator.of(context).pushReplacementNamed('/welcome');
        //                  },
        //                  child: Container(
        //                    child: Text("Lewati", style: TextStyle(fontWeight: FontWeight.w800),),),)
        //          ),
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    height: 5.0.h,
                  ),
                  // foto slider
                  carouselSlider = CarouselSlider(
                    height: (_current == imgList.length - 1) ? 65.0.h : 75.0.h,
                    viewportFraction: 1.0,
                    initialPage: 0,
                    enlargeCenterPage: true,
                    autoPlay: false,
                    enableInfiniteScroll: false,
                    scrollDirection: Axis.horizontal,
                    reverse: false,
                    onPageChanged: (index) {
                      setState(() {
                        _current = index;
                      });
                    },
                    items: imgList.map((imgUrl) {
                      return Builder(
                        builder: (BuildContext context) {
                          return Container(
                            margin: EdgeInsets.only(top: 5.0.h, bottom: 5.0.h),
                            height: (_current == imgList.length - 1) ? 20.0.h : 30.0.h,
                            child: Image.asset(
                              imgUrl,
                              fit: BoxFit.fill,
                            ),
                          );
                        },
                      );
                    }).toList(),
                  ),

                  // button
                  (_current == imgList.length - 1)
                    ? Column(
                        children: [
                          SizedBox(
                            height: 5.0.h,
                          ),
                          RaisedButton(
                            onPressed: () {
                              Navigator.of(context)
                                  .pushReplacementNamed('/welcome');
                            },
                            color: Color(0xFF5ABD8C),
                            textColor: Colors.white,
                            padding: EdgeInsets.fromLTRB(4.0.h, 2.0.h, 4.0.h, 2.0.h),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                              20.0,
                            )),
                            child: const Text('MULAI CURHAT',
                              textScaleFactor: 0.9,
                              textAlign: TextAlign.center,
                              style:
                                  TextStyle(fontFamily: "Montserrat-Bold",)),
                          ),
                          SizedBox(
                            height: 10.0.h,
                          ),
                        ],
                      )
                    : SizedBox(
                        height: 11.0.h,
                      ),
                  
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: map<Widget>(imgList, (index, url) {
                      return Container(
                        width: 2.0.h,
                        height: 2.0.h,
                        margin: EdgeInsets.symmetric(
                            vertical: 1.0.h, horizontal: 1.5.h),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: _current == index
                              ? Color(0xFF172F23)
                              : Color(0xFF8FEEBF),
                        ),
                      );
                    }),
                  ),
              ],
            ),
      )
    );
  });
  });
  }
}
