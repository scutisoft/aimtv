
import 'dart:async';

import 'package:aimtv/anandhamPages/loginpage/login.dart';
import 'package:aimtv/anandhamPages/timeManagement/timeManagement.dart';
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
import '../../widgets/customAppBar.dart';

class TimeManagemantAdd extends StatefulWidget {
  const TimeManagemantAdd({Key? key}) : super(key: key);

  @override
  State<TimeManagemantAdd> createState() => _TimeManagemantAddState();
}

class _TimeManagemantAddState extends State<TimeManagemantAdd>  with SingleTickerProviderStateMixin,HappyExtensionHelper implements HappyExtensionHelperCallback{

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
                    const SizedBox(height: 80,),
                    widgets[0],
                    widgets[1],
                    const SizedBox(height: 30,),
                    Padding(
                      padding: const EdgeInsets.only(left: 15.0,right: 15.0),
                      child: Row(
                      children: [
                        Reminder(Icon(Icons.calendar_today,color: Color(0XFF969696),size: 25,)),
                        SizedBox(width: 12),
                        Reminder(Icon(Icons.access_time,color: Color(0XFF969696),size: 25,)),
                        SizedBox(width: 12),
                        Reminder(Icon(Icons.star_border_purple500_outlined,color: Color(0XFF969696),size: 25,)),
                        SizedBox(width: 12),
                        Reminder(Icon(Icons.alarm,color: Color(0XFF969696),size: 25,)),
                      ],
                      ),
                    ),
                    const SizedBox(height: 50,),
                    GestureDetector(
                      onTap: (){
                       Get.back();
                      },
                      child: Container(
                        height: 50,
                        width: SizeConfig.screenWidth!*0.5,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          color: ColorUtil.primary,
                        ),
                        alignment: Alignment.center,
                        child: Text("Set Reminder",style: TextStyle(color: Colors.white),),
                      ),
                    ),
                    const SizedBox(height: 20,),
                  ],
                ),
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
                  Text('Time Management',style: ts20(ColorUtil.themeBlack,fontfamily: 'SB',fontsize: 18),),
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
    widgets.add(HE_AddNewLabelTextField(
      dataname: 'Reminder',
      hasInput: true,
      required: true,
      labelText: "Name the reminder",
      scrollPadding: scrollPadding,
      regExp: null,
      onChange: (v){},
      onEditComplete: (){
        node.unfocus();
      },
    ));//0
    widgets.add(HE_AddNewLabelTextField(
      dataname: 'Note',
      hasInput: true,
      required: true,
      labelText: "Note",
      scrollPadding: scrollPadding,
      textLength: null,
      //maxlines: null,
      regExp: null,
      onChange: (v){},
      onEditComplete: (){
        node.unfocus();
      },
    ));//1
    setState(() {});

    // await parseJson(widgets, getPageIdentifier(),dataJson: widget.dataJson);
  }

Widget Reminder(Widget ReminderIcon){
    return Container(
        height: 50,
        width: 50,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: const Color(0XFFD9D9D9),
        ),
        alignment: Alignment.center,
        child: ReminderIcon,
    );
}

}

