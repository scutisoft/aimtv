
import 'dart:async';

import 'package:aimtv/anandhamPages/capacityBuilding/Yoga/yogaHolistic.dart';
import 'package:aimtv/anandhamPages/capacityBuilding/Yoga/yogaInstruction.dart';
import 'package:aimtv/anandhamPages/loginpage/login.dart';
import 'package:aimtv/anandhamPages/timeManagement/timeManagement.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../HappyExtension/extensionHelper.dart';
import '../../../HappyExtension/utilWidgets.dart';
import '../../../api/ApiManager.dart';
import '../../../api/sp.dart';
import '../../../model/parameterMode.dart';
import '../../../notifier/configuration.dart';
import '../../../utils/colorUtil.dart';
import '../../../utils/constants.dart';
import '../../../utils/sizeLocal.dart';
import '../../../utils/utils.dart';
import '../../../utils/utilsWidgets.dart';
import '../../../widgets/alertDialog.dart';
import '../../../widgets/customAppBar.dart';

class YogaPage extends StatefulWidget {
  const YogaPage({Key? key}) : super(key: key);

  @override
  State<YogaPage> createState() => _YogaPageState();
}

class _YogaPageState extends State<YogaPage>  with SingleTickerProviderStateMixin,HappyExtensionHelper implements HappyExtensionHelperCallback{

  double _currentSliderValue = 60.0;

  @override
  void initState() {
    assignWidgets();
    super.initState();
  }

  var node;
  @override
  Widget build(BuildContext context) {
    node=FocusScope.of(context);
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor:ColorUtil.theme,
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              alignment: Alignment.topCenter,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const SizedBox(height: 330,),
                    Container(
                       width:SizeConfig.screenWidth ,
                       padding: EdgeInsets.all(15),
                       margin: EdgeInsets.only(left: 15.0,right: 15.0),
                       decoration: BoxDecoration(
                       color: Color(0XFFF4EAFF),
                       borderRadius: BorderRadius.circular(8)
                       ),
                       child: Column(
                         children: [
                            Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                              Text('Set your yoga timing',style: ts20(ColorUtil.themeBlack,fontWeight: FontWeight.w700,fontsize: 16,fontfamily: 'SB'),),
                              Container(
                              width:70,
                              height: 40,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  color: Color(0XFFBA68C8),
                                  borderRadius: BorderRadius.circular(25)
                              ),
                              child: Text('Set',style: ts20(ColorUtil.themeWhite,fontWeight: FontWeight.w800,fontsize: 16,fontfamily: 'MR'),),
                              ),
                              ],
                            ),
                           const SizedBox(height: 20,),
                           Container(
                           width: SizeConfig.screenWidth,
                             child: Slider(
                             activeColor: Color(0XFFD0A9FF),
                             inactiveColor: Color(0XFFD0A9FF),
                               min: 0,
                               max: 100,
                               divisions:6,
                               value: _currentSliderValue,
                               label: _currentSliderValue.round().toString(),
                               onChanged: (value) {
                                 setState(() {
                                   _currentSliderValue = value;
                                 });
                               },
                             ),
                           ),
                         ],
                       ),
                    ),
                    const SizedBox(height: 20,),
                    Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 15.0),
                      child: Text('Yoga Music Therapy',style: ts20(ColorUtil.themeBlack,fontWeight: FontWeight.w700,fontsize: 16,fontfamily: 'SB'),),
                    )),
                    const SizedBox(height: 20,),
                    Container(
                      width:SizeConfig.screenWidth ,
                      padding: EdgeInsets.all(15),
                      margin: EdgeInsets.only(left: 15.0,right: 15.0),
                      decoration: BoxDecoration(
                          color: Color(0XFFF4EAFF),
                          borderRadius: BorderRadius.circular(8)
                      ),
                      child:  Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                          width:SizeConfig.screenWidth!*0.6,
                          child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Instruction',style: ts20(ColorUtil.themeBlack,fontWeight: FontWeight.w700,fontsize: 16,fontfamily: 'SB'),),
                              const SizedBox(height: 5,),
                              Text('Guide provides step-by-step instructions and doctor-recommended tips for a daily yoga practice.',style: ts20(Color(0XFF595959),fontWeight: FontWeight.w700,fontsize: 12,fontfamily: 'SB'),),
                            ],
                          )),
                          GestureDetector(
                          onTap: (){
                            fadeRoute(YogaInstruction());
                          },
                          child: Image.asset('assets/anandham/capBuildIcon/Menu.png',fit: BoxFit.cover,height: 80,))
                        ],
                      ),
                    ),
                    const SizedBox(height: 20,),
                    Container(
                      width:SizeConfig.screenWidth ,
                      padding: EdgeInsets.all(15),
                      margin: EdgeInsets.only(left: 15.0,right: 15.0),
                      decoration: BoxDecoration(
                          color: Color(0XFFF4EAFF),
                          borderRadius: BorderRadius.circular(8)
                      ),
                      child:  Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                              width:SizeConfig.screenWidth!*0.6,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Yoga Holistic Living',style: ts20(ColorUtil.themeBlack,fontWeight: FontWeight.w700,fontsize: 16,fontfamily: 'SB'),),
                                  const SizedBox(height: 5,),
                                  Text('Article by DR. N. Bhuvaneswari about this session and the Importance of Yoga',style: ts20(Color(0XFF595959),fontWeight: FontWeight.w700,fontsize: 12,fontfamily: 'SB'),),
                                ],
                              )),
                          GestureDetector(
                              onTap: (){
                                fadeRoute(YogaHolisticLiving());
                              },
                          child: Image.asset('assets/anandham/capBuildIcon/Menu.png',fit: BoxFit.contain,height: 80,))
                        ],
                      ),
                    ),
                    const SizedBox(height: 20,),
                  ],
                ),
              ),
            ),
            Container(
              height:320,
              width: SizeConfig.screenWidth,
              decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage('assets/anandham/capBuildIcon/yoga-bg.png'),fit: BoxFit.fill)
              ),
              alignment: Alignment.topLeft,
              padding:EdgeInsets.only(right: 10,left: 10,top: 10),
              child: Stack(
                children: [
                  Row(
                    children: [
                      ArrowBack(
                        iconColor:ColorUtil.themeWhite,
                        onTap: () {
                          Get.back();
                        },),
                      SizedBox(width: 15,),
                      Text('Yoga',style: ts20(ColorUtil.themeBlack,fontfamily: 'SB',fontsize: 18),),
                    ],
                  ),
                  Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                  margin: EdgeInsets.only(left: 12,bottom: 45),
                  child: Image.asset('assets/anandham/capBuildIcon/yoga-girl.png',fit: BoxFit.contain,))),
                  Positioned(
                  bottom: 20,
                  right: 0,
                  child: Image.asset('assets/anandham/capBuildIcon/Music1.png',fit: BoxFit.contain,height: 140,))
                ],
              ),
            ),
            //Loader(value: isLoading,)
          ],
        ),
      ),
    );
  }
  double scrollPadding=10;

  @override
  void assignWidgets() async{
    setState(() {});

    // await parseJson(widgets, getPageIdentifier(),dataJson: widget.dataJson);
  }

}

