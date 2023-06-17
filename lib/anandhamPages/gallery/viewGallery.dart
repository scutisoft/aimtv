import 'dart:io';
import 'package:aimtv/anandhamPages/Notification.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../HappyExtension/extensionHelper.dart';
import '../../api/ApiManager.dart';
import '../../utils/colorUtil.dart';
import '../../utils/constants.dart';
import '../../utils/sizeLocal.dart';
import '../../utils/utils.dart';
import '../../widgets/customAppBar.dart';
import '../../widgets/innerShadowTBContainer.dart';
import '../../widgets/listView/HE_ListView.dart';
import '../../widgets/loader.dart';
import '../../widgets/popupBanner/popup.dart';

class ViewGallery extends StatefulWidget {
  @override
  _ViewGalleryState createState() => _ViewGalleryState();
}

class _ViewGalleryState extends State<ViewGallery> with HappyExtensionHelper,TickerProviderStateMixin  implements HappyExtensionHelperCallback {
  late  double width,height,width2,height2, gridWidth;
  List<dynamic> GalleryImg=[
    {"FavImg":"assets/anandham/gallery-1.png",},
    {"FavImg":"assets/anandham/gallery-2.png",},
    {"FavImg":"assets/anandham/gallery-3.png",},
    {"FavImg":"assets/anandham/gallery-1.png",},
    {"FavImg":"assets/anandham/gallery-2.png",},
    {"FavImg":"assets/anandham/gallery-3.png",},
  ];
  List<dynamic> Gallery=[
    {"FavImg":"assets/anandham/gallery-1.png",},
    {"FavImg":"assets/anandham/gallery-2.png",},
    {"FavImg":"assets/anandham/gallery-3.png",},
    {"FavImg":"assets/anandham/gallery-1.png",},
    {"FavImg":"assets/anandham/gallery-2.png",},
    {"FavImg":"assets/anandham/gallery-3.png",},
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
                  const SizedBox(height: 70,),
                  Align(
                    alignment: Alignment.center,
                    child: Wrap(
                      spacing: 2,
                      runSpacing: 2,
                      children: GalleryImg.asMap().map((key, value) => MapEntry(key, Container(
                        height: 80,
                        width: gridWidth*0.2,
                        //  margin: EdgeInsets.fromLTRB(0, 5, width*0.01, 5),
                        child: GestureDetector(
                           onTap: (){
                             List<String> localPath=[];
                             for (var element in Gallery) {
                               localPath.add('${element['FavImg']}');
                             }

                             showLoader.value=false;
                             showHideDotsPopup(localPath,context);
                           // showHideDotsPopup(Gallery, context);
                           },
                          child: Container(
                              clipBehavior: Clip.antiAlias,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(0),
                              ),
                              child: Image.asset(value['FavImg'],fit: BoxFit.cover,)
                          ),
                        ),
                      ))).values.toList(),
                    ),
                  ),
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
                  ArrowBack(
                    iconColor:ColorUtil.themeWhite,
                    onTap: () {
                      Get.back();
                    },),
                  SizedBox(width: 15,),
                  Text('Events',style: ts20(ColorUtil.themeBlack,fontfamily: 'SB',fontsize: 18),),
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