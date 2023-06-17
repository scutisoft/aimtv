import 'package:aimtv/anandhamPages/capacityBuilding/Mapping/workAssign.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '/helper/language.dart';
import '/widgets/loader.dart';
import '/widgets/logoPicker.dart';
import '/HappyExtension/extensionHelper.dart';
import '/HappyExtension/utilWidgets.dart';
import '/utils/colorUtil.dart';
import '/utils/constants.dart';
import '/utils/general.dart';
import '/utils/sizeLocal.dart';
import '/widgets/customWidgetsForDynamicParser/searchDrp2.dart';
import '/utils/utils.dart';
import '/widgets/customAppBar.dart';

class MappingPage extends StatefulWidget {
  bool isEdit;
  String dataJson;
  Function? closeCb;
  MappingPage({this.closeCb,this.dataJson="",this.isEdit=false});

  @override
  _MappingPageState createState() => _MappingPageState();
}

class _MappingPageState extends State<MappingPage> with HappyExtensionHelper  implements HappyExtensionHelperCallback{
  List<Widget> widgets=[];
  ScrollController? silverController;

  @override
  void initState(){
    silverController= ScrollController();
    assignWidgets();
    super.initState();
  }
  String page="LandDetails";
  var node;
  var isKeyboardVisible=false.obs;

  @override
  Widget build(BuildContext context) {
    node=FocusScope.of(context);
    isKeyboardVisible.value = MediaQuery.of(context).viewInsets.bottom != 0;
    return Scaffold(
      backgroundColor:  ColorUtil.theme,
      resizeToAvoidBottomInset: true,
      body:SafeArea(
        child: Stack(
          children: [
            Container(
            width: SizeConfig.screenWidth,
            height: SizeConfig.screenHeight,
            child: Image.asset('assets/anandham/capBuildIcon/Map.png',fit: BoxFit.contain,)),
            Container(
              height:60,
              width: SizeConfig.screenWidth,
              color: Colors.transparent,
              alignment: Alignment.centerLeft,
              padding:EdgeInsets.only(right: 15,left: 15),
              child: Row(
                children: [
                  ArrowBack(
                    iconColor:ColorUtil.themeWhite,
                    onTap: () {
                      Get.back();
                    },),
                  SizedBox(width: 10,),
                  Text('Mapping System',style: ts20(ColorUtil.themeBlack,fontfamily: 'SB',fontsize: 18),),
                ],
              ),
            ),
            Positioned(
              bottom: 0,
              child: Container(
                margin: const EdgeInsets.only(top: 0,bottom: 0),
                height: isKeyboardVisible.value?0:70,
                width: SizeConfig.screenWidth,
                color: Colors.white,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                   Container(
                   width: SizeConfig.screenWidth!*0.5,
                   child: Text('Porur R9 Police Station 1KM away',style: ts20(ColorUtil.themeBlack,fontfamily: 'SB',fontsize: 14),),
                   ),
                    Container(
                    width: 50,
                    height: 50,
                      child: Icon(Icons.send_outlined,size: 25,)
                    )
                  ],
                ),
              ),
            ),
            Positioned(
                bottom: 65,
                right: 20,
                child: GestureDetector(
                  onTap:(){
                  fadeRoute(WorkAssignPage());
                  },
                  child: Container(
                      height: 100,
                      child:Image.asset('assets/anandham/capBuildIcon/workassign.png',fit: BoxFit.cover,height: 100,)/*Icon(.add,color: ColorUtil.themeWhite,size: 25,)*/
                  ),
                )
            ),
            ShimmerLoader()
          ],
        ),
      ),
    );
  }

  double scrollPadding=10;

  @override
  void assignWidgets() async{


    setState(() {});
    await parseJson(widgets, getPageIdentifier(),dataJson: widget.dataJson);
    console(valueArray);
  }

  @override
  String getPageIdentifier(){
    return General.addLandParcelIdentifier;
  }

  @override
  void dispose(){
    widgets.clear();
    super.dispose();
  }
}
