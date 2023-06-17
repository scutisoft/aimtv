import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import '../../helper/appVersionController.dart';
import '../../helper/language.dart';
import '../../utils/sizeLocal.dart';
import '../../widgets/circle.dart';
import '../../widgets/customAppBar.dart';
import '../../widgets/customCheckBox.dart';
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
import 'signup.dart';




class LoginV2 extends StatefulWidget {
  const LoginV2({Key? key}) : super(key: key);

  @override
  State<LoginV2> createState() => _LoginV2State();
}

class _LoginV2State extends State<LoginV2> {
  final _text = TextEditingController();
  final _text1 = TextEditingController();
  bool obsureText = true;

  @override
  void initState(){
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      AppVersionController().checkVersion();
      //menuSel.value=13;
      loadCredentials();
      allowAccess();
    });
/*    search2.selectedValueFunc=(e){
      console(e);
      _text.text=e['Text'];
      _text1.text=e['Id'];
      login();
    };*/
    super.initState();
  }

  @override
  void dispose() {
    _text.dispose();
    _text1.dispose();
    super.dispose();
  }

  allowAccess() async{
    //  final PermissionHandler _permissionHandler = PermissionHandler();
    var result = await Permission.storage.request();
    console("result ${result.isGranted}");
    if(result == PermissionStatus.granted) {

    }
  }

  void loadCredentials() async{
    _text.text=await getSharedPrefString(SP_USEREMAIL);
    _text1.text=await getSharedPrefString(SP_USERPASSWORD);
  }

  late  double width,height,width2,height2;
  var isKeyboardVisible=false.obs;



  Search2 search2=Search2(
    dialogWidth: 300,
    dataName: "",
    width: 300,
    margin: EdgeInsets.all(0),
    dialogMargin: EdgeInsets.all(0),
    showSearch: false,
    scrollTap: (){},
    selectedValueFunc: (e){  },
    selectWidgetHeight: 50,
    isToJson: false,
    data: [
      {"Id":"123","Text":"ecogreenadmin@gmail.com"},
      {"Id":"123","Text":"gov@gmail.com"},
      {"Id":"123","Text":"ecogreenmadhan@gmail.com"},//Mayiladurai Cod
      {"Id":"123","Text":"ecogreenmuthu@gmail.com"},//Theni Cod
      {"Id":"123","Text":"ecogreenjawahar@gmail.com"},//Chennai Cod
      {"Id":"Ecogreen@7603855071","Text":"muthu1@gmail.com"},
      {"Id":"Ecogreen@7603855072","Text":"muthu2@gmail.com"},
      {"Id":"Ecogreen@7603855073","Text":"muthu3@gmail.com"},
    ],
    selectedValue: "",
    hinttext: "Select User",
    hasInput: false,
    onitemTap: (i){},
  );

  double redHei=100+70+70+70+100;

  var isLogin=false.obs;

  Color textFieldFill=Color(0xffffffff);
  Color textFieldText=Color(0xff388961);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: Container(
        color: ColorUtil.primary2,
        child: SafeArea(
          child: SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.only(top: 20,bottom: 0),
              width: SizeConfig.screenWidth,
              height: SizeConfig.screenHeight,
              child:Stack(
              alignment: Alignment.topCenter,
              children: [
                 Image.asset('assets/anandham/anandhamPcImg.png'),
                 Align(
                 alignment: Alignment.bottomCenter,
                   child: Container(
                     width: SizeConfig.screenWidth,
                     height: SizeConfig.screenHeight!*0.5,
                     decoration: BoxDecoration(
                     color: Colors.white),
                   ),
                 ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    width: SizeConfig.screenWidth,
                   //+ height: SizeConfig.screenHeight!*0.60   ,
                    margin: EdgeInsets.only(left: 25,right: 25,bottom: SizeConfig.screenHeight!*0.15 ),
                    padding: EdgeInsets.only(left: 25,right: 25,top: 25),
                    decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30.0),
                      boxShadow: [
                        BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                          blurRadius: 15.0, // soften the shadow
                          spreadRadius: 5.0, //extend the shadow
                          offset: Offset(
                            0.0, // Move to right 10  horizontally
                            15.0, // Move to bottom 10 Vertically
                          ),
                        )
                      ],
                      color: Colors.white,
                    ),
                    child: Column(
                    mainAxisSize: MainAxisSize.min,
                      children: [
                          Row(
                          mainAxisAlignment:MainAxisAlignment.spaceEvenly,
                          children: [
                          Container(
                           width:80,
                          alignment: Alignment.center,
                          height: 50,
                          decoration:BoxDecoration(
                           border: Border(
                             bottom: BorderSide(width: 4.0, color:ColorUtil.primary2),
                           ),
                          ),
                          child: Text('Sign in'.toUpperCase(),style: ts20(ColorUtil.primary2,fontsize: 20, fontfamily: 'KR',fontWeight:FontWeight.w600),),
                          ),
                          //SizedBox(width: 100,),
                            GestureDetector(
                              onTap: (){
                                fadeRoute(SignUp());
                              },
                              child: Container(
                                width:80,
                                alignment: Alignment.center,
                                height: 50,
                                child: Text('Sign up'.toUpperCase(),style: ts20(ColorUtil.themeBlack ,fontsize: 20, fontfamily: 'KR',fontWeight:FontWeight.w600),),
                              ),
                            ),
                          ],
                          ),
                        const SizedBox(height: 40,),
                        LoginTextField(
                          hintText: "User Name",
                          textEditingController: _text,
                          onEditCom: (){},
                        ),
                        const SizedBox(height: 10,),
                        LoginTextField(
                          hintText: "Password",
                          obscure: true,
                          textEditingController: _text1,
                          onEditCom: (){
                            FocusScope.of(context).unfocus();
                            login();
                          },
                        ),
                        const SizedBox(height: 30,),
                        LoginBtn(ontap: login, title: "Sign in".toUpperCase()),
                        const SizedBox(height: 5,),
                        Text("v- ${MyConstants.appVersion}",style: ts20(ColorUtil.text4,fontfamily: 'KR',fontsize: 14),),
                        const SizedBox(height: 10,),
                      ],
                    ),
                  ),
                ),
              ],
              )
            ),
          ),
        ),
      ),
    );
  }

  login() async{
    // Get.to(PinScreenSettings(fromLogin: false,));
    Get.to(Masterpage());
    return;
    if(_text.text.isEmpty){
      CustomAlert().cupertinoAlert("${Language.enterEmail}....");
      return;
    }
    if(_text1.text.isEmpty){
      CustomAlert().cupertinoAlert("${Language.enterPassword}....");
      return;
    }
    List<ParameterModel> params=[];
    params.add(ParameterModel(Key: "SpName", Type: "String", Value: Sp.loginSp));
    params.add(ParameterModel(Key: "UserName", Type: "String", Value: _text.text));
    params.add(ParameterModel(Key: "Password", Type: "String", Value: _text1.text));
    params.add(ParameterModel(Key: "DeviceId", Type: "String", Value: getDeviceId()));
    ApiManager().GetInvoke(params).then((value){
      if(value[0]){
        console(value);
        var parsed=json.decode(value[1]);
        try{
          setUserSessionDetail(parsed["Table"][0]);
          accessData=parsed['Table1'];
          //Get.close(2);
          Get.to(PinScreenSettings(fromLogin: true,));
          //Get.to(MyHomePage());
        }catch(e){}
        //print(parsed);
      }
    });
  }
}

class LoginBtn extends StatelessWidget {
  VoidCallback ontap;
  String title;
  LoginBtn({required this.ontap,required this.title,});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:ontap,
      child: Container(
        height: 50,
        width: SizeConfig.screenWidth!*0.5,
        margin: const EdgeInsets.only(left: 25,right: 25,top: 25),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: ColorUtil.primary,
            boxShadow: [
              BoxShadow(
                  offset: Offset(0, 8),
                  color: ColorUtil.primary.withOpacity(0.2),
                  spreadRadius: 5,
                  blurRadius: 20
              )
            ]
        ),
        alignment: Alignment.center,
        child: Text(title,style: ts20(Colors.white,fontsize: 20,fontfamily: 'KR',fontWeight: FontWeight.w600),textAlign: TextAlign.center,),
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

class LoginTextField extends StatelessWidget {
  String hintText;
  bool obscure;
  TextEditingController textEditingController;
  VoidCallback onEditCom;
  LoginTextField({Key? key,required this.hintText,this.obscure=false,required this.textEditingController,required this.onEditCom}) : super(key: key){
    textEditingController.addListener(() {
      isFilled.value=textEditingController.text.isNotEmpty;
    });

  }

  var isFilled=false.obs;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: SizeConfig.screenWidth,
      color: Colors.white,
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: textEditingController,
              obscureText: obscure,
              textAlignVertical: TextAlignVertical.center,
              textAlign: TextAlign.left,
              maxLines: 1,
              style: TextStyle(fontSize: 18,fontFamily:'KR',color:ColorUtil.primary2,fontWeight: FontWeight.w600,),
              scrollPadding: EdgeInsets.only(bottom: 270),
              decoration: InputDecoration(
                fillColor: Colors.white,
                filled: true,
                enabledBorder: UnderlineInputBorder(borderSide:BorderSide(color: Colors.grey.shade300)),
                border: InputBorder.none,
                focusedBorder: UnderlineInputBorder(borderSide:BorderSide(color: ColorUtil.primary2)),
                errorBorder: InputBorder.none,
                // prefixIcon: Container(width:30,alignment:Alignment.center,child: SvgPicture.asset("assets/login/person.svg",height: 25,)),
                labelText: hintText,
                //errorStyle: TextStyle(fontSize: 14,fontFamily:Language.regularFF,color:Color(0XFFBCBBCD),),
                labelStyle:TextStyle(fontSize: 18,fontFamily:'KR',color:ColorUtil.themeBlack,fontWeight: FontWeight.w100),
                suffixIcon: Obx(() => CustomCheckBox(
                  isSelect: isFilled.value,
                  onlyCheckbox: true,
                  height: 25,br: 35,
                  selectColor: ColorUtil.primary2,
                  icnSize: 16,
                  unSelIcon: const Icon(Icons.done,color:Colors.white,size: 16,),
                )
                ),
                suffixIconConstraints: BoxConstraints(
                maxHeight: 25
                ),
              ),
              cursorColor: ColorUtil.cursorColor,
              keyboardType: TextInputType.emailAddress,
              onChanged: (v){
                //  isFilled.value=v.isNotEmpty;
              },
              onEditingComplete: onEditCom,
            ),
          ),

          const SizedBox(width: 10,)
        ],
      ),
    );
  }


}

