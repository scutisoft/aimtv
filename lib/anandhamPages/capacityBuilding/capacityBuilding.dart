import 'dart:io';
import 'package:aimtv/anandhamPages/Notification.dart';
import 'package:aimtv/anandhamPages/capacityBuilding/Mapping/mapping.dart';
import 'package:aimtv/anandhamPages/capacityBuilding/paying/paying.dart';
import 'package:aimtv/anandhamPages/policeNews/policeNews.dart';
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
import 'Yoga/yogaPage.dart';


class CapacityBuildingSessions extends StatefulWidget {
  VoidCallback voidCallback;
  CapacityBuildingSessions({required this.voidCallback});
  @override
  _CapacityBuildingSessionsState createState() => _CapacityBuildingSessionsState();
}

class _CapacityBuildingSessionsState extends State<CapacityBuildingSessions> with HappyExtensionHelper,TickerProviderStateMixin  implements HappyExtensionHelperCallback {
  late  double width,height,width2,height2, gridWidth;
  List<dynamic> GalleryImg=[
    {"FavImg":"assets/anandham/capBuildIcon/Family-Features.png","Title":"Family","Subtitle":"Features"},
    {"FavImg":"assets/anandham/capBuildIcon/Paying-Bills.png","Title":"Paying","Subtitle":"Bills"},
    {"FavImg":"assets/anandham/capBuildIcon/Hospital.png","Title":"Hospital","Subtitle":""},
    {"FavImg":"assets/anandham/capBuildIcon/Mapping-System.png","Title":"Mapping","Subtitle":"System"},
    {"FavImg":"assets/anandham/capBuildIcon/Music.png","Title":"Music","Subtitle":""},
    {"FavImg":"assets/anandham/capBuildIcon/Yoga.png","Title":"Yoga","Subtitle":"Music Therapy"},
    {"FavImg":"assets/anandham/capBuildIcon/Fitness.png","Title":"Calories","Subtitle":"Burning"},
    {"FavImg":"assets/anandham/capBuildIcon/Fitness.png","Title":"Fitness","Subtitle":""},
    {"FavImg":"assets/anandham/family-hug.png","Title":"Birthday","Subtitle":"Wishes"},
    {"FavImg":"assets/anandham/capBuildIcon/Herbal.png","Title":"Herbal","Subtitle":""},
    {"FavImg":"assets/anandham/capBuildIcon/Cooling-Tips.png","Title":"Cooling","Subtitle":"Tips"},
    {"FavImg":"assets/anandham/capBuildIcon/Police-News.png","Title":"Police","Subtitle":"News"},
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
              physics: BouncingScrollPhysics(),
              shrinkWrap: true,
                children: [
                  const SizedBox(height: 60,),
                  Align(
                    alignment: Alignment.center,
                    child: Wrap(
                      spacing: 15,
                      runSpacing: 15,
                      children: GalleryImg.asMap().map((key, value) => MapEntry(key, Container(
                        height: 210,
                        width: gridWidth*0.45,
                        decoration: BoxDecoration(
                          color: ColorUtil.primarylite,
                          borderRadius: BorderRadius.circular(8.0),
                          border: Border.all(color: ColorUtil.primary)
                        ),
                        //  margin: EdgeInsets.fromLTRB(0, 5, width*0.01, 5),
                        child: GestureDetector(
                          onTap:(){
                            if(key==0){
                              fadeRoute(widget);
                            }
                            else if(key==1){
                              fadeRoute(PayingPage());
                            }
                            else if(key==3){
                              fadeRoute(MappingPage());
                            }
                            else if(key==5){
                              fadeRoute(YogaPage());
                            }
                            else if(key==11){
                              fadeRoute(PoliceNewsPage());
                            }
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                            Image.asset(value['FavImg'],width: 100,fit: BoxFit.contain,),
                            SizedBox(height: 10,),
                            Text(value['Title'].toString().toUpperCase(),style: TextStyle(color:ColorUtil.primary,fontSize: 18,fontFamily: 'RB'),),
                            Text(value['Subtitle'],style: TextStyle(color:Color(0XFF2F2F2F),fontSize: 12,fontFamily: 'MM'),),
                              // Text(value['SubTitle'],style: TextStyle(color:Colors.white,fontSize: 14,fontFamily: 'RB'),),
                            ],
                          ),
                        ),
                      ))).values.toList(),
                    ),
                  ),
                  const SizedBox(height: 20,),
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
                  Text('Capacity Building Sessions',style: ts20(ColorUtil.themeBlack,fontfamily: 'SB',fontsize: 18),),
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