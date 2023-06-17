import 'package:aimtv/widgets/customCheckBox.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../widgets/customAppBar.dart';
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
import 'timeMngmtAdd.dart';


class TimeManagement extends StatefulWidget {
  VoidCallback voidCallback;
  TimeManagement({required this.voidCallback});
  @override
  _TimeManagementState createState() => _TimeManagementState();
}

class _TimeManagementState extends State<TimeManagement> with HappyExtensionHelper  implements HappyExtensionHelperCallback{


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
  List<dynamic> TimeManagement=[
    {
      "MeetTime": "Meeting at 11 AM",
      "Etime": "Event time : 11:00",
      "Rtime": "Remind time 10:45",
      "Date": "March 12, 2023",
    },
  ];
  var node;

  double cardWidth=SizeConfig.screenWidth!-(30+15+25);
  var treeCount=0.obs;

  @override
  Widget build(BuildContext context) {
    node=FocusScope.of(context);
    // cardWidth=SizeConfig.screenWidth!-(20+15+25);
    return Scaffold(
      backgroundColor: ColorUtil.theme,
      resizeToAvoidBottomInset: true,
      body: Container(
      height: SizeConfig.screenHeight,
      color: ColorUtil.theme,
      width: SizeConfig.screenWidth,
        child: SafeArea(
          child: Stack(
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                 SizedBox(height: 70,),
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
                    GestureDetector(
                        onTap: (){
                          widget.voidCallback();
                        },
                        child: Container(
                            width: 40,
                            height: 40,
                            alignment: Alignment.center,
                            color: Colors.transparent,
                            child: Image.asset('assets/anandham/Icons/menu-left.png'))
                            ),
                    SizedBox(width: 15,),
                    Text('Time Management',style: ts20(ColorUtil.themeBlack,fontfamily: 'SB',fontsize: 18),),
                  ],
                ),
              ),
              Positioned(
                  bottom: 25,
                  right: 20,
                  child: GestureDetector(
                    onTap:(){
                      fadeRoute(TimeManagemantAdd());
                    },
                    child: Container(
                        width: 80,
                        height: 80,
                        alignment: Alignment.center,
                        clipBehavior: Clip.antiAlias,
                        decoration: BoxDecoration(
                          color: ColorUtil.primary,
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: ColorUtil.primary.withOpacity(0.4),
                              spreadRadius: 2,
                              blurRadius: 15,
                              offset: Offset(1, 8), // changes position of shadow
                            ),
                          ],
                        ),
                        child: Icon(Icons.add,color: ColorUtil.themeWhite,size: 25,)
                    ),
                  )
              ),
              ShimmerLoader(),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void assignWidgets() async{
    // await parseJson(widgets, getPageIdentifier());

    try{
    //  List<dynamic >ourTreeGird=valueArray.where((element) => element['key']=="NewsFeed").toList()[0]['value'];
      he_listViewBody.assignWidget(TimeManagement);
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
            // padding: const EdgeInsets.only(left: 15.0,right: 15.0),
            width: SizeConfig.screenWidth!*1,
            height: 120,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color:  ColorUtil.themeWhite,
              border: Border.all(color: ColorUtil.greyBorder.withOpacity(0.3))
            ),
            clipBehavior:Clip.antiAlias,
            child:Stack(
              children: [
                Row(
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                       alignment: Alignment.center,
                      width: cardWidth*0.3,
                      child: CustomCheckBox(
                      height: 20,
                      selectColor: ColorUtil.primary,
                      unSelectColor:ColorUtil.themeWhite,
                      icnSize: 20,
                      unSelIcon:null ,
                     onlyCheckbox: true,
                     ontap: (){

                     },
                     br: 5,
                     isSelect: true,
                      ),
                    ),
                    Container(
                      width: cardWidth*0.6,
                      padding: const EdgeInsets.only(top: 10.0,bottom: 10.0,left: 15),
                      child: Column(
                        crossAxisAlignment:CrossAxisAlignment.start ,
                        mainAxisAlignment: MainAxisAlignment.center,
                        // mainAxisSize: MainAxisSize.min,
                        children: [
                          Text("${dataListener['MeetTime']}",style: TextStyle(color: ColorUtil.themeBlack,fontSize: 16,fontFamily: 'MM',fontWeight: FontWeight.w800),),
                          SizedBox(height: 2,),
                          Text("${dataListener['Date']}",style: TextStyle(color: ColorUtil.themeBlack,fontSize: 14,fontFamily: 'MR',fontWeight: FontWeight.w600),),
                          Text("${dataListener['Etime']}",style: TextStyle(color: ColorUtil.themeBlack,fontSize: 14,fontFamily: 'MR',fontWeight: FontWeight.w600),),
                          Text("${dataListener['Rtime']}",style: TextStyle(color: ColorUtil.themeBlack,fontSize: 14,fontFamily: 'MR',fontWeight: FontWeight.w600),),
                        ],
                      ),
                    ),
                  ],
                ),
                Positioned(
                top: 15,
                right: 15,
                  child:   Container(
                    height: 25,
                    width: 25,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color:ColorUtil.primary,
                    ),
                    child:Icon(Icons.star,color:Colors.white,size: 20,),
                  )
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                child:  Container(
                  width: 56,
                  height: 30,
                  decoration: BoxDecoration(
                      color: ColorUtil.primary,
                      borderRadius:
                      BorderRadius.only(
                        topLeft:
                        Radius.circular(20),
                      )),
                  child: Center(
                    child: Icon(Icons.delete,color:Colors.white,size: 20,),
                  ),
                ),)
              ],
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