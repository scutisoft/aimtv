import 'dart:io';
import 'package:aimtv/anandhamPages/Notification.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../HappyExtension/extensionHelper.dart';
import '../../utils/colorUtil.dart';
import '../../utils/constants.dart';
import '../../utils/sizeLocal.dart';
import '../../utils/utils.dart';
import '../../widgets/innerShadowTBContainer.dart';
import '../../widgets/listView/HE_ListView.dart';
import '../../widgets/loader.dart';
import '../../widgets/popupBanner/popup.dart';


class MyIdCard extends StatefulWidget {
  VoidCallback voidCallback;
  MyIdCard({required this.voidCallback});
  @override
  _MyIdCardState createState() => _MyIdCardState();
}

class _MyIdCardState extends State<MyIdCard> with HappyExtensionHelper,TickerProviderStateMixin  implements HappyExtensionHelperCallback {
  late  double width,height,width2,height2, gridWidth;
  double cardWidth=SizeConfig.screenWidth!;

  @override
  void initState(){
    assignWidgets();
    super.initState();
  }

  var node;
  @override
  Widget build(BuildContext context) {
    width=MediaQuery.of(context).size.width;
    height=MediaQuery.of(context).size.height;
    width2=width-16;
    height2=height-16;
    gridWidth=width-30;

    node=FocusScope.of(context);
    return Scaffold(
      backgroundColor: ColorUtil.theme,
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              child: Align(
              alignment: Alignment.center,
              child: Image.asset('assets/anandham/IdCard.png',fit:BoxFit.cover),
              ),
            ),
            Container(
              height:60,
              width: SizeConfig.screenWidth,
              color: ColorUtil.theme,
              alignment: Alignment.centerLeft,
              padding:EdgeInsets.only(right: 15,left: 15),
              child: Row(
                children: [
                  GestureDetector(
                      onTap: (){
                        widget.voidCallback();
                      },
                      child: Container(
                          width: 40,
                          height: 40,
                          alignment: Alignment.center,
                          color: Colors.transparent,
                          child: Image.asset('assets/anandham/Icons/menu-left.png'))),
                  SizedBox(width: 10,),
                  Text('MY ID Card',style: ts20(ColorUtil.themeBlack,fontfamily: 'SB',fontsize: 18),),
                ],
              ),
            ),
            ShimmerLoader(),
          ],
        ),
      ),
    );
  }

  @override
  void assignWidgets() async{
    setState(() {});
    // await parseJson(widgets, General.donateIdentifier);
  }
}



void showHideDotsPopup(images,BuildContext context) {
  /* Get.defaultDialog(
        title: "Hii"
    );*/

  PopupBanner(
      context: context,
      images: images,
      useDots: true,
      autoSlide: false,
      onClick: (index) {},
      fit: BoxFit.contain,
      isLocal: true,
      dotsColorActive: ColorUtil.primary
  ).show();
}