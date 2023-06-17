
import 'dart:async';

import 'package:aimtv/anandhamPages/loginpage/login.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../HappyExtension/extensionHelper.dart';
import '../../HappyExtension/utilWidgets.dart';
import '../../api/ApiManager.dart';
import '../../api/sp.dart';
import '../../model/parameterMode.dart';
import '../../notifier/configuration.dart';
import '../../utils/colorUtil.dart';
import '../../utils/constants.dart';
import '../../utils/sizeLocal.dart';
import '../../utils/utils.dart';
import '../../utils/utilsWidgets.dart';
import '../../widgets/alertDialog.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp>  with SingleTickerProviderStateMixin,HappyExtensionHelper implements HappyExtensionHelperCallback{

  List<dynamic> widgets=[];
  Map widgetsMap={};
  var volunteerType=UserType.customer.index.obs;
  var isAccept=false.obs;
  BorderRadius borderRadius=BorderRadius.circular(10);
  BoxDecoration inActiveDec=BoxDecoration(
    shape:BoxShape.circle,
    color: ColorUtil.primary.withOpacity(0.2),
    border:Border.all(color:Colors.white,width: 3.0),
  );
  BoxDecoration activeDec=BoxDecoration(
    shape:BoxShape.circle,
    color: ColorUtil.primary,
    border:Border.all(color:Colors.white,width: 3.0),
  );


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
    return SafeArea(
      child: Scaffold(
     backgroundColor: Color(0XFFFFFFFF),
        body: Stack(
          children: [
            Container(
              alignment: Alignment.center,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const SizedBox(height: 10,),
                    Container(
                      /*padding:EdgeInsets.only(top:10 ) ,*/
                      child: Image.asset('assets/anandham/logo.png',fit: BoxFit.cover,width:SizeConfig.screenWidth!*0.5,),
                    ),
                    const SizedBox(height: 10,),
                    const Text('Welcome to',style: TextStyle(fontSize: 16,fontFamily: 'RB',color: Color(0XFF000000)),),
                    const SizedBox(height: 10,),
                    const Text('Anandham',style: TextStyle(fontSize: 20,fontFamily: 'RB',color: Color(0XFFFE316C)),),
                    const SizedBox(height: 10,),

                    widgets[0],
                    widgets[1],
                    widgets[2],
                    widgets[3],
                    widgets[4],
                    const SizedBox(height: 10,),
                    Padding(
                      padding: const EdgeInsets.only(left: 15.0,right: 15.0,top: 10,bottom: 10),
                      child: Row(
                        children: [
                          GestureDetector(
                            onTap:(){
                              volunteerType.value=UserType.customer.index;
                            },
                            child: Container(
                              color: Colors.transparent,
                              child: Row(
                                children: [
                                  Container(
                                    width: 20,
                                    height: 20,
                                    decoration: BoxDecoration(
                                        border:Border.all(color: ColorUtil.primary.withOpacity(0.5),width: 1.0),
                                        borderRadius: BorderRadius.circular(50)
                                    ),
                                    child: Obx(() => AnimatedContainer(
                                      duration: MyConstants.animeDuration,
                                      padding: const EdgeInsets.all(10),
                                      width: 10,
                                      height: 10,
                                      decoration: volunteerType.value==UserType.customer.index?activeDec:inActiveDec,
                                    )),
                                  ),
                                  const SizedBox(width: 10,),
                                  Text('Male',style: TextStyle(fontSize: 15,color: ColorUtil.themeBlack,fontFamily: 'RM'),),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(width: 30,),
                          GestureDetector(
                            onTap:(){
                              volunteerType.value=UserType.shopKeeper.index;
                            },
                            child: Container(
                              color: Colors.transparent,
                              child: Row(
                                children: [
                                  Container(
                                    width: 20,
                                    height: 20,
                                    decoration: BoxDecoration(
                                        border:Border.all(color: ColorUtil.primary.withOpacity(0.5),width: 1.0),
                                        borderRadius: BorderRadius.circular(50)
                                    ),
                                    child: Obx(() => AnimatedContainer(
                                      duration: MyConstants.animeDuration,
                                      padding: const EdgeInsets.all(10),
                                      width: 10,
                                      height: 10,
                                      decoration: volunteerType.value==UserType.shopKeeper.index?activeDec:inActiveDec,
                                    )),
                                  ),
                                  const SizedBox(width: 10,),
                                  Text('Female',style: TextStyle(fontSize: 15,color: ColorUtil.themeBlack,fontFamily: 'RM'),),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(height: 10,),
                    Container(
                        alignment: Alignment.center,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GestureDetector(
                              onTap: (){
                               fadeRoute(LoginV2());
                              },
                              child: RichText(
                                text: TextSpan(text: 'Already have an account ? ',style: TextStyle(color:ColorUtil.text1,fontFamily: 'RR',fontSize: 14),
                                  children: <TextSpan>[
                                    TextSpan(text: 'Sign In', style: TextStyle(color:ColorUtil.primary,fontFamily: 'RB',fontSize: 15)),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        )
                    ),
                    const SizedBox(height: 20,),
                    GestureDetector(
                      onTap: (){
                        fadeRoute(LoginV2());
                        //Navigator.push(context, MaterialPageRoute(builder: (context)=>Masterpage()),);
                        // sysSubmit(widgets,
                        //     needCustomValidation: true,
                        //     onCustomValidation: (){
                        //   foundWidgetByKey(widgets, "UserGroupId",needSetValue: true,value: volunteerType.value);
                        //   if(widgets[4].getValue()!=widgets[5].getValue()){
                        //     CustomAlert().cupertinoAlert("Password Doesn't match...");
                        //     return false;
                        //   }
                        //   return true;
                        // },
                        //     traditionalParam: TraditionalParam(getByIdSp: "", insertSp: Sp.signUpSp, updateSp: ""));
                      },
                      child: Container(
                        height: 50,
                        width: SizeConfig.screenWidth!*0.8,
                        decoration: BoxDecoration(
                          borderRadius: borderRadius,
                          color: const Color(0XFFFE316C),
                        ),
                        alignment: Alignment.center,
                        child: Text("Sign Up",style: TextStyle(color: Colors.white),),
                      ),
                    ),
                    const SizedBox(height: 20,),
                  ],
                ),
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
    widgetsMap['UserName']=HE_AddNewLabelTextField(
      dataname: 'UserName',
      hasInput: true,
      required: true,
      labelText: "User Name",
      scrollPadding: scrollPadding,
      regExp: null,
      onChange: (v){},
      onEditComplete: (){
        node.unfocus();
      },
    );
    widgets.add(HE_AddNewLabelTextField(
      dataname: 'UserId',
      hasInput: true,
      required: true,
      labelText: "User Id",
      scrollPadding: scrollPadding,
      regExp: null,
      onChange: (v){},
      onEditComplete: (){
        node.unfocus();
      },
    ));//0
    widgets.add(HE_AddNewLabelTextField(
      dataname: 'UserName',
      hasInput: true,
      required: true,
      labelText: "User Name",
      scrollPadding: scrollPadding,
      regExp: null,
      onChange: (v){},
      onEditComplete: (){
        node.unfocus();
      },
    ));//1
    widgets.add(HE_AddNewLabelTextField(
      dataname: 'Designation',
      hasInput: true,
      required: true,
      labelText: "Designation",
      scrollPadding: scrollPadding,
      regExp: null,
      onChange: (v){},
      onEditComplete: (){
        node.unfocus();
      },
    ));//2
    widgets.add(HE_AddNewLabelTextField(
      dataname: 'Email',
      hasInput: true,
      required: true,
      labelText: "E-mail",
      scrollPadding: scrollPadding,
      regExp: null,
      onChange: (v){},
      onEditComplete: (){
        node.unfocus();
      },
    ));//3
    widgets.add(HE_AddNewLabelTextField(
      dataname: 'ContactNumber',
      hasInput: true,
      required: true,
      labelText: "Mobile Number",
      textInputType: TextInputType.number,
      textLength: 10,
      regExp: MyConstants.digitRegEx,
      onEditComplete: (){
        node.unfocus();
      },
      onChange: (v){
      },
    ));//2

    widgets.add(HiddenController(dataname: "UserGroupId"));

    setState(() {});

    // await parseJson(widgets, getPageIdentifier(),dataJson: widget.dataJson);
  }



}

