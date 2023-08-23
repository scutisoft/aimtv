import 'package:aimtv/KioskPages/kioskOrderType.dart';
import 'package:aimtv/utils/constants.dart';
import 'package:aimtv/utils/sizeLocal.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../utils/colorUtil.dart';

class KioskService extends StatefulWidget {
  @override
  State<KioskService> createState() => _KioskServiceState();
}

class _KioskServiceState extends State<KioskService> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:SafeArea(
        child:  Container(
          width: SizeConfig.screenWidth,
          height: SizeConfig.screenHeight,
          decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage('assets/kiosk/service.png'),fit: BoxFit.cover)
          ),
          child:Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 350,),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                       GestureDetector(
                       onTap: (){
                          fadeRoute(KioskOrderType());
                       },
                         child: Column(
                         children: [
                             Image.asset('assets/kiosk/Dine-in.png',width: 200,fit: BoxFit.cover,),
                             SizedBox(height: 20,),
                             Text('Dine in'.toUpperCase(),style: ts20(ColorUtil.themeWhite,fontsize: 50,fontfamily: 'RM'),)
                         ],
                    ),
                       ),
                    GestureDetector(
                      onTap: (){

                      },
                      child: Column(
                        children: [
                          Image.asset('assets/kiosk/Take-away.png',width: 180,fit: BoxFit.cover,),
                          SizedBox(height: 20,),
                          Text('TakeAway'.toUpperCase(),style: ts20(ColorUtil.themeWhite,fontsize: 50,fontfamily: 'RM'),)
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ) ,
        ),
      ),
    ) ;
  }
}
