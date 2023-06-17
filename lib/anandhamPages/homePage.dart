import 'package:aimtv/utils/constants.dart';
import 'package:aimtv/utils/sizeLocal.dart';
import 'package:flutter/material.dart';

import '../utils/colorUtil.dart';

class HomePage extends StatefulWidget {
  VoidCallback voidCallback;
  HomePage({required this.voidCallback});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
      color: ColorUtil.themeWhite,
        child: SafeArea(
          child:Container(
            width: SizeConfig.screenWidth,
            height: SizeConfig.screenHeight,
            child: Center(child: Image.asset('assets/no-data-available.jpg')),
          ),/* SizedBox(
            width: SizeConfig.screenWidth,
            height: SizeConfig.screenHeight,
            child: Padding(
              padding: const EdgeInsets.only(top: 15,left: 15.0,right: 15.0),
              child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              GestureDetector(
              onTap: (){
                widget.voidCallback();
              },
              child: Image.asset('assets/anandham/Icons/menu-left.png'))
              ],),
            ),
          ),*/
        ),
      ),
    ) ;
  }
}
