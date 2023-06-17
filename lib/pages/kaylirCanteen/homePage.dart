import '/utils/sizeLocal.dart';
import 'package:flutter/material.dart';
import '../../utils/colorUtil.dart';
import '../../utils/constants.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: MyConstants.bottomSafeArea,
    child: Scaffold(
      backgroundColor: ColorUtil.themeWhite,
      body: SizedBox(
      width: SizeConfig.screenWidth,
      height: SizeConfig.screenHeight,
      child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
          SizedBox(height: 30,),
          Image.asset('assets/Kaylir/logo.png',width: 200,),
          SizedBox(height: 120,),

      ],
      ),
      ),
    ),
    );
  }
  Widget OrdertypeSelect(Widget OrdTypeImg , String OrdType){
  return Column(
    children: [
      Container(
        width: 100,
        height: 100,
        padding: EdgeInsets.all(22),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color:ColorUtil.primary,
        ),
        child:OrdTypeImg ,
      ),
      SizedBox(
        height: 10,),
      Text(OrdType,style: ts20(ColorUtil.text1,fontfamily: 'RM',fontsize: 26))
    ],
  );
  }
}
