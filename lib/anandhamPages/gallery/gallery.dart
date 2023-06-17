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
import 'viewGallery.dart';

class GalleryPage extends StatefulWidget {
  VoidCallback voidCallback;
  GalleryPage({required this.voidCallback});
  @override
  _GalleryPageState createState() => _GalleryPageState();
}

class _GalleryPageState extends State<GalleryPage> with HappyExtensionHelper,TickerProviderStateMixin  implements HappyExtensionHelperCallback {
  late  double width,height,width2,height2, gridWidth;
  List<dynamic> GalleryImg=[
    {"FavImg":"assets/anandham/gallery-1.png","Title":"Events"},
    {"FavImg":"assets/anandham/gallery-2.png","Title":"Services"},
    {"FavImg":"assets/anandham/gallery-3.png","Title":"Awards"},
    {"FavImg":"assets/anandham/gallery-1.png","Title":"Events"},
    {"FavImg":"assets/anandham/gallery-2.png","Title":"Services"},
    {"FavImg":"assets/anandham/gallery-3.png","Title":"Awards"},
  ];

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
              child: ListView(
              shrinkWrap: true,
                children: [
                  const SizedBox(height: 60,),
                  Align(
                    alignment: Alignment.center,
                    child: Wrap(
                      spacing: 5,
                      runSpacing: 5,
                      children: GalleryImg.asMap().map((key, value) => MapEntry(key, Container(
                        height: 165,
                        width: gridWidth*0.50,
                        //  margin: EdgeInsets.fromLTRB(0, 5, width*0.01, 5),
                        child: GestureDetector(
                          onTap:(){
                            fadeRoute(ViewGallery());
                          },
                          child: Container(
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              image: DecorationImage(image: AssetImage(value['FavImg']),
                                fit: BoxFit.fill,),
                            ),
                            child: Stack(
                              children: [
                                Container(
                                  color: Colors.black.withOpacity(0.3),
                                  width: SizeConfig.screenWidth,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(value['Title'],style: TextStyle(color:Colors.white,fontSize: 18,fontFamily: 'RB'),),
                                      // Text(value['SubTitle'],style: TextStyle(color:Colors.white,fontSize: 14,fontFamily: 'RB'),),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ))).values.toList(),
                    ),
                  ),
                  // const SizedBox(height: 30,),
                  // Align(
                  // alignment: Alignment.topLeft,
                  //   child: Container(
                  //    padding: EdgeInsets.all(10),
                  //    margin: EdgeInsets.only(left: 15),
                  //     decoration: BoxDecoration(
                  //     color: ColorUtil.primary,
                  //     borderRadius: BorderRadius.circular(4)
                  //     ),
                  //     child: Text('Events',style: ts20(ColorUtil.themeWhite),),
                  //   ),
                  // ),
                ],
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
                          child: Image.asset('assets/anandham/Icons/menu-left.png'))),
                  SizedBox(width: 10,),
                  Text('Photo Gallery',style: ts20(ColorUtil.themeBlack,fontfamily: 'SB',fontsize: 18),),
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