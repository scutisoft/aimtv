import 'dart:convert';

import 'package:aimtv/anandhamPages/loginpage/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import '../../helper/appVersionController.dart';
import '../../helper/language.dart';
import '../../utils/sizeLocal.dart';
import '../../widgets/circle.dart';
import '../../widgets/customAppBar.dart';
import '../../widgets/loader.dart';
import '../../api/ApiManager.dart';
import '../../api/sp.dart';
import '../../model/parameterMode.dart';
import '../../notifier/configuration.dart';
import '../../utils/colorUtil.dart';
import '../../utils/constants.dart';
import '../../utils/utils.dart';
import '../../widgets/alertDialog.dart';
import '../../widgets/searchDropdown/search2.dart';

import '../navHomeScreen.dart';
import 'pinScreenLogin.dart';
import 'pinScreenSettings.dart';




class LoginOrSignup extends StatefulWidget {
  const LoginOrSignup({Key? key}) : super(key: key);

  @override
  State<LoginOrSignup> createState() => _LoginOrSignupState();
}

class _LoginOrSignupState extends State<LoginOrSignup> {

  @override
  void initState(){
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }
  late  double width,height,width2,height2;
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image:DecorationImage(fit:BoxFit.cover,image:AssetImage('assets/anandham/bg-img.jpg'),colorFilter: ColorFilter.mode(ColorUtil.primary.withOpacity(0.5), BlendMode.dstATop)),
            color: ColorUtil.primary
        ),
        child: SafeArea(
          child: SizedBox(
            width: SizeConfig.screenWidth,
            height: SizeConfig.screenHeight,
            child: Column(
              //mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 100,
                  width: 100,
                  margin: const EdgeInsets.only(bottom: 20),
                  alignment: Alignment.center,
                  child: Image.asset("assets/anandham/logo.png",fit: BoxFit.cover,),
                  /*decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xff4fc68e)
                  ),*/
                ),
                Container(
                  height: 60,
                  width: SizeConfig.screenWidth,
                  margin: const EdgeInsets.only(left: 40,right: 40),
                  alignment: Alignment.center,
                  child: Text('ANANDHAM',style: ts20(ColorUtil.themeWhite,fontsize: 38,fontfamily: 'KR',fontWeight:FontWeight.w600)),
                  decoration:BoxDecoration(
                      borderRadius:BorderRadius.circular(2),
                      color: ColorUtil.themeWhite.withOpacity(0.6)
                  ),
                ),
                Visibility(
                visible: true,
                  child: Container(
                  //color: Colors.white,
                  width: SizeConfig.screenWidth,
                    margin: const EdgeInsets.only(left: 25,right: 25,top: 25),
                    child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text('Refresher'.toUpperCase(),style: ts20(Colors.white,fontsize: 34,fontfamily: 'KR',fontWeight:FontWeight.w600)),
                        Text('training class'.toUpperCase(),style: ts20(Colors.white,fontsize: 34,fontfamily: 'KR',fontWeight:FontWeight.w600)),
                        Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('0n'.toUpperCase(),style: ts20(Colors.white,fontsize: 34,fontfamily: 'KR',fontWeight:FontWeight.w600)),
                          SizedBox(width: 5,),
                          Text('Work Life Balance',style: ts20(Colors.white,fontsize: 28,fontfamily: 'KR',fontWeight:FontWeight.w400)),
                        ],
                        ),
                        Text('For comprehensive development of women police personnel',style: ts20(Colors.white,fontsize: 18,fontfamily: 'KR',fontWeight:FontWeight.w400)),

                      ],
                    ),
                  ),
                ),
                SizedBox(height: 25,),
                GestureDetector(
                  onTap:(){
                    fadeRoute(LoginV2());
                  },
                  child: Container(
                    height: 50,
                    width: SizeConfig.screenWidth!,
                    margin: const EdgeInsets.only(left: 25,right: 25,top: 25),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: ColorUtil.primary,
                    ),
                    alignment: Alignment.center,
                    child: Text('LOGIN'.toUpperCase(),style: ts20(Colors.white,fontsize: 20,fontfamily: 'KR',fontWeight:FontWeight.w400),textAlign: TextAlign.center,),
                  ),
                ),
                GestureDetector(
              onTap:(){
                // fadeRoute(signUp());
              },
              child: Container(
                height: 50,
                width: SizeConfig.screenWidth!,
                margin: const EdgeInsets.only(left: 25,right: 25,top: 25),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: ColorUtil.themeWhite,
                ),
                alignment: Alignment.center,
                child: Text('SIGNUP'.toUpperCase(),style: ts20(ColorUtil.primary,fontsize: 20,fontfamily: 'KR',fontWeight:FontWeight.w400),textAlign: TextAlign.center),
              ),
            ),
                const SizedBox(height: 50,),
                Text("v- ${MyConstants.appVersion}",style: ts20(ColorUtil.themeWhite,fontfamily: 'KR',fontsize: 14),)
              ],
            ),
          ),
        ),
      ),
    );
  }

}

class LoginBackBtn extends StatelessWidget {
  VoidCallback ontap;
  LoginBackBtn({required this.ontap});
  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap:ontap,
      child: CustomCircle(
        hei: 50,
        color: Color(0xff135c31),
        margin: const EdgeInsets.only(left: 10),
        widget: Icon(Icons.arrow_back_rounded,color: Colors.white,size: 30,),
      ),
    );
  }
}



