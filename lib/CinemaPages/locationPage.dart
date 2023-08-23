import 'package:aimtv/utils/constants.dart';
import 'package:aimtv/utils/sizeLocal.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../utils/colorUtil.dart';
import 'homePage.dart';

class LocationPage extends StatefulWidget {
  @override
  State<LocationPage> createState() => _LocationPageState();
}

class _LocationPageState extends State<LocationPage> {
  @override
  List<dynamic> Location = [
    {"Img": "assets/cinema/sri-ranganathasvamy.png","title":"Chennai"},
    {"Img": "assets/cinema/sri-ranganathasvamy.png","title":"Mumbai" },
    {"Img": "assets/cinema/sri-ranganathasvamy.png","title":"Kerala"},
    {"Img": "assets/cinema/sri-ranganathasvamy.png","title":"Mumbai" },
    {"Img": "assets/cinema/sri-ranganathasvamy.png","title":"Kerala"},
  ];
  Widget build(BuildContext context) {
    return Scaffold(
    backgroundColor: ColorUtil.themeWhite,
      body: Container(
      child: SafeArea(
        child:  Column(
        crossAxisAlignment: CrossAxisAlignment.start,
          children: [
             Padding(
               padding: const EdgeInsets.only(top: 20.0,left: 20.0,right: 20.0),
               child: Text('Select Your',style: ts20(ColorUtil.themeBlack.withOpacity(0.8),fontfamily: 'RM',fontsize: 16),),
             ),
            Padding(
              padding: const EdgeInsets.only(top: 5.0,left: 20.0,right: 20.0),
              child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text('Theater Location',style: ts20(ColorUtil.themeBlack,fontfamily: 'RB',fontsize: 17),),
                  SizedBox(width: 5,),
                  Image.asset('assets/cinema/popcorn.png',width: 30,)
                ],
              ),
            ),
            Container(
                width: SizeConfig.screenWidth,
                height: SizeConfig.screenHeight!-200,
                margin: EdgeInsets.only(left: 20,right: 20,top: 20),
                child: GridView.builder(
                     //physics: NeverScrollableScrollPhysics(),
                     shrinkWrap: true,
                     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                       crossAxisCount: 3,
                       crossAxisSpacing: 15.0,
                       mainAxisSpacing: 15.0,
                     ),
                     itemCount: Location.length,
                     itemBuilder: (context, index) {
                       return GestureDetector(
                       onTap: (){
                         fadeRoute(HomePage());
                       },
                         child: Container(
                         clipBehavior: Clip.antiAlias,
                           decoration: BoxDecoration(
                             borderRadius: BorderRadius.circular(10.0),
                             color: Color(0XffEEEEEE),
                           ),
                           child: Column(
                           mainAxisAlignment: MainAxisAlignment.center,
                           crossAxisAlignment: CrossAxisAlignment.center,
                             children: [
                               Image.asset(Location[index]['Img'],fit:BoxFit.contain ,width: 50,),
                               SizedBox(height: 10,),
                               Text(Location[index]['title'],style: ts18(ColorUtil.themeBlack),)
                             ],
                           ),
                         ),
                       );
                     },
                   ),
                ),
          ],
        ),
        ),
      ),
    ) ;
  }
}
