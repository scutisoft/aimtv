import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '/helper/language.dart';
import '/widgets/calculation.dart';
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
import '/widgets/searchDropdown/dropdown_search.dart';


class WorkAssignPage extends StatefulWidget {
  bool isEdit;
  String dataJson;
  Function? closeCb;
  WorkAssignPage({this.closeCb,this.dataJson="",this.isEdit=false});

  @override
  _WorkAssignPageState createState() => _WorkAssignPageState();
}

class _WorkAssignPageState extends State<WorkAssignPage> with HappyExtensionHelper  implements HappyExtensionHelperCallback{
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
              height: SizeConfig.screenHeight,
              child:  ListView(
                shrinkWrap: true,
                //  physics: const NeverScrollableScrollPhysics(),
                children: [
                  const SizedBox(height: 70,),
                  Padding(
                    padding: const EdgeInsets.only(left: 15.0),
                    child: Text('Selected Location',style: ts20(ColorUtil.themeBlack,fontfamily: 'SB',fontsize: 16),),
                  ),
                  const SizedBox(height: 10,),
                  Container(
                  // margin: EdgeInsets.only(left: 10),
                    child: Row(
                      children: [
                        Container(
                            width: 50,
                            height: 50,
                            child: Icon(Icons.location_on_outlined,size: 35,color: ColorUtil.primary,)
                        ),
                        Container(
                          width: SizeConfig.screenWidth!-70,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Porur R9 Police Station',style: ts20(ColorUtil.themeBlack,fontfamily: 'SB',fontsize: 14),),
                              const SizedBox(height: 5,),
                              Text('78, 3rd Main Rd, Lakshmi Nagar, Porur, Chennai, Tamil Nadu 600116',style: ts20(ColorUtil.themeBlack,fontfamily: 'MM',fontsize: 14),),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                  width: SizeConfig.screenWidth,
                  height: 1,
                  margin: EdgeInsets.only(left: 15,right: 15,top: 10,bottom: 10),
                  color: ColorUtil.themeBlack.withOpacity(0.2),
                  ),
                  const SizedBox(height: 5,),
                   widgets[0],
                   widgets[1],
                   widgets[2],
                   widgets[3],
                  const SizedBox(height: 80,),
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
                  SizedBox(width: 10,),
                  Text('Mapping System',style: ts20(ColorUtil.themeBlack,fontfamily: 'SB',fontsize: 18),),
                ],
              ),
            ),
            Positioned(
              bottom: 0,
              child: Obx(() => Container(
                margin: const EdgeInsets.only(top: 0,bottom: 0),
                height: isKeyboardVisible.value?0:70,
                width: SizeConfig.screenWidth,
                color: Colors.white,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    GestureDetector(
                      onTap: (){
                        Get.back();
                      },
                      child: Container(
                        width: SizeConfig.screenWidth!*0.4,
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(3),
                          border: Border.all(color: ColorUtil.primary),
                          color: ColorUtil.primary.withOpacity(0.3),
                        ),
                        child:Center(child: Text(Language.cancel,style: ts16(ColorUtil.primary,), )) ,
                      ),
                    ),
                    GestureDetector(
                      onTap: (){
                        sysSubmit(widgets,
                            isEdit: widget.isEdit,
                            successCallback: (e){
                              console("sysSubmit $e");
                              if(widget.closeCb!=null){
                                widget.closeCb!(e);
                              }
                            }
                        );
                      },
                      child: Container(
                        width: SizeConfig.screenWidth!*0.4,
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(3),
                          color: ColorUtil.primary,
                        ),
                        child:Center(child: Text("Assign duty",style: ts16(ColorUtil.themeWhite,), )) ,
                      ),
                    ),
                  ],
                ),
              )),
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
    widgets.add(SearchDrp2(map:  {"dataName":"EventTypeId","hintText":'Select Station',"labelText":'Select Station'},hasInput: true,required: true,));//0
    widgets.add(SearchDrp2(map:  {"dataName":"EventTypeId","hintText":'Select Cop',"labelText":'Select Cop'},hasInput: true,required: true,));//1
    widgets.add(AddNewLabelTextField(
      dataname: 'Enter Bill Amount',
      hasInput: true,
      required: true,
      labelText: 'Enter name  of the duty',
      scrollPadding: scrollPadding,
      regExp: null,
      onChange: (v){},
      onEditComplete: (){
        node.unfocus();
      },
    ));//3
    widgets.add(AddNewLabelTextField(
      dataname: 'Description (Mandatory)',
      hasInput: true,
      required: true,
      labelText: 'Description',
      scrollPadding: scrollPadding,
      regExp: null,
      onChange: (v){},
      onEditComplete: (){
        node.unfocus();
      },
    ));//4/2
    widgets.add(HiddenController(dataname: "LandParcelId"));


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
