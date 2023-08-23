import 'package:aimtv/utils/constants.dart';
import 'package:aimtv/utils/sizeLocal.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../utils/colorUtil.dart';
import 'kioskService.dart';

class KioskPage extends StatefulWidget {
  @override
  State<KioskPage> createState() => _KioskPageState();
}

class _KioskPageState extends State<KioskPage> {
  @override
  List<dynamic> TrendingVideo = [
    {
      "Img": "assets/kiosk/kiosk-bg.png",
    },
    {
      "Img": "assets/kiosk/kiosk-bg.png",
    },
  ];
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
      child: SafeArea(
        child:  Container(
            width: SizeConfig.screenWidth,
            height: SizeConfig.screenHeight,
             child: CarouselSlider(
              options: CarouselOptions(
                // aspectRatio: 16 / 9,
                height: SizeConfig.screenHeight,
                viewportFraction: 1,
                initialPage: 0,
                enableInfiniteScroll: true,
                reverse: false,
                autoPlay: true,
                autoPlayInterval: Duration(seconds: 3),
                autoPlayAnimationDuration: Duration(milliseconds: 800),
                autoPlayCurve: Curves.fastOutSlowIn,
                enlargeCenterPage: false,
                scrollDirection: Axis.horizontal,
                pageSnapping: true,
                // enlargeCenterPage: false,
              ),
              items: TrendingVideo.map((item) => GestureDetector(
              onTap: (){
                fadeRoute(KioskService());
              },
                child: Image.asset(
                  item['Img'],
                  fit: BoxFit.cover,
                  // width: SizeConfig.screenWidth,
                ),
              )).toList(),
            )),
        ),
      ),
    ) ;
  }
}
