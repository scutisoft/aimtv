import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../widgets/customAppBar.dart';
import '/HappyExtension/extensionUtils.dart';
import '/api/apiUtils.dart';
import '/HappyExtension/extensionHelper.dart';
import '/utils/colorUtil.dart';
import '/utils/constants.dart';
import '/utils/general.dart';
import '/utils/sizeLocal.dart';
import '/helper/language.dart';
import '/utils/utils.dart';
import '/widgets/animatedSearchBar.dart';
import '/widgets/listView/HE_ListView.dart';
import '/widgets/loader.dart';
import '/widgets/navigationBarIcon.dart';


class YogaHolisticLiving extends StatefulWidget {
  @override
  _YogaHolisticLivingState createState() => _YogaHolisticLivingState();
}

class _YogaHolisticLivingState extends State<YogaHolisticLiving> with HappyExtensionHelper  implements HappyExtensionHelperCallback{


  List<dynamic> widgets=[];
  ScrollController? silverController;
  TextEditingController textController = TextEditingController();

  late HE_ListViewBody he_listViewBody;
  RxDouble silverBodyTopMargin=RxDouble(0.0);


  @override
  void initState(){

    he_listViewBody=HE_ListViewBody(
      data: [],
      getWidget: (e){
        return HE_OurTreeViewContent(
          data: e,
          cardWidth: cardWidth,
          globalKey: GlobalKey(),
        );
      },
    );
    assignWidgets();
    super.initState();
  }
  List<dynamic> NewsFeed=[
    {
      "NFDescription": "Yoga with its holistic healing properties has been helping people for generations. Though having originated in the Indian subcontinent, yoga has provided physical, mental and spiritual support throughout the globe across all nations, cultures, genders and ages.",
    },
    {
      "NFDescription": "Studies have revealed that Yoga is one of the most effective practices to cope up with stressful environment. Yoga and meditation practice can provide the tools to Women police officers to cope with stress.",
    },
    {
      "NFDescription": "In many studies, it has been observed that Women police officials have been facing high level of stress as they perform duties at both the workplace and home. This situation has contributed to the stress and anxiety manifold.",
    },
    {
      "NFDescription": "In these sessions, the groups were educated on coordinating Mind, Body and Soul for happy living. As policing mostly deals with negative emotions, the discussions were on positive energy and negative energy management.",
    },
    {
      "NFDescription": "Effects are directed towards managing energy and dynamic holistic living which help the personnel to live a peaceful life naturally and rightfully balancing their work and home.",
    },
  ];
  var node;

  double cardWidth=SizeConfig.screenWidth!-(30+15+25);
  var treeCount=0.obs;

  @override
  Widget build(BuildContext context) {
    node=FocusScope.of(context);
    // cardWidth=SizeConfig.screenWidth!-(20+15+25);
    return SafeArea(
        bottom: MyConstants.bottomSafeArea,
        child: Scaffold(
          backgroundColor: ColorUtil.theme,
          resizeToAvoidBottomInset: true,
          body: Stack(
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                 SizedBox(height: 70,),
                  Container(
                    width:SizeConfig.screenWidth ,
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(20),
                    margin: EdgeInsets.only(left: 15.0,right: 15.0),
                    decoration: BoxDecoration(
                        color: Color(0XFFF4EAFF),
                        borderRadius: BorderRadius.circular(25)
                    ),
                    child:  Text('Yoga Holistic Living',style: ts20(Color(0XFF595959),fontWeight: FontWeight.w700,fontsize: 14,fontfamily: 'SB',),),
                  ),
                  SizedBox(height: 20,),
                  Flexible(child:he_listViewBody),
                ],
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
                    Text('Back',style: ts20(ColorUtil.themeBlack,fontfamily: 'SB',fontsize: 18),),
                  ],
                ),
              ),
              ShimmerLoader(),
            ],
          ),
        )
    );
  }

  @override
  void assignWidgets() async{
    // await parseJson(widgets, getPageIdentifier());

    try{
    //  List<dynamic >ourTreeGird=valueArray.where((element) => element['key']=="NewsFeed").toList()[0]['value'];
      he_listViewBody.assignWidget(NewsFeed);
    }catch(e){}
  }

  @override
  String getPageIdentifier(){
    return General.OurTreePageViewIdentifier;
  }

  @override
  void dispose(){
    widgets.clear();
    // he_listViewBody.clearData();
    textController.dispose();
    // clearOnDispose();
    super.dispose();
  }
}


class HE_OurTreeViewContent extends StatelessWidget implements HE_ListViewContentExtension {

  double cardWidth;
  Map data;
  Function(Map)? onEdit;
  Function(String)? onDelete;
  GlobalKey globalKey;
  HE_OurTreeViewContent({Key? key,required this.data,this.onEdit,required this.cardWidth,this.onDelete,required this.globalKey}) : super(key: key){
    dataListener.value=data;

  }

  var dataListener={}.obs;
  var separatorHeight = 50.0.obs;

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      separatorHeight.value=parseDouble(globalKey.currentContext!.size!.height)-30;
    });

    return Obx(
            ()=> Container(
            key: globalKey,
            margin: const EdgeInsets.only(bottom: 0,left: 15,right: 15),
            padding: const EdgeInsets.only(left: 15.0,right: 15.0),
            width: SizeConfig.screenWidth!*1,
            decoration: BoxDecoration(
              /*borderRadius: BorderRadius.circular(10),*/
              color:  Colors.transparent,
            ),
            clipBehavior:Clip.antiAlias,
            child:SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 5,),
                  Container(
                      width: SizeConfig.screenWidth,
                      child: Text("${dataListener['NFDescription']}",style: TextStyle(color: ColorUtil.themeBlack,fontSize: 14,fontFamily: 'MM'),)),
                  const SizedBox(height: 5,),
                ],
              ),
            )
        )
    );
  }
  @override
  updateDataListener(Map data) {
    data.forEach((key, value) {
      if(dataListener.containsKey(key)){
        dataListener[key]=value;
      }
    });
  }
}