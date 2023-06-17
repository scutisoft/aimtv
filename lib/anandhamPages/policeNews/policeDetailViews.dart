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


class PoliceNewsDetailPage extends StatefulWidget {
  @override
  _PoliceNewsDetailPageState createState() => _PoliceNewsDetailPageState();
}

class _PoliceNewsDetailPageState extends State<PoliceNewsDetailPage> with HappyExtensionHelper  implements HappyExtensionHelperCallback{


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
  List<dynamic> OurTreeList=[];
  List<dynamic> NewsFeed=[
    {
      "NFDescription1": "Lorem ipsum dolor sit amet consectetur. Egestas risus dui lacus curabitur auctor amet. Risus nibh quam nisl varius. In feugiat non enim adipiscing ac lobortis.",
      "NFDescription": "Lorem ipsum dolor sit ametconsectetur.",
      "NFImageFile": "assets/anandham/NewsFeed1.png",
      "NFApprovedDate": "March 12, 2023",
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
                    Text('Police News',style: ts20(ColorUtil.themeBlack,fontfamily: 'SB',fontsize: 18),),
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
            child:Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                    width: cardWidth!*0.6,
                    child: Text("${dataListener['NFDescription']}",style: TextStyle(color: ColorUtil.themeBlack,fontSize: 14,fontFamily: 'SB'),)),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text("${dataListener['NFApprovedDate']}",style: TextStyle(color: ColorUtil.themeBlack.withOpacity(0.5),fontSize: 12,fontFamily: 'MR'),),
                        SizedBox(height: 5,),
                        Icon(Icons.share_outlined,color: ColorUtil.themeBlack.withOpacity(0.5),),
                      ],
                    ),
                  ],
                ),
                Container(
                margin: EdgeInsets.only(top: 10,bottom: 10),
                width: SizeConfig.screenWidth,
                height: 1,
                color: ColorUtil.themeBlack.withOpacity(0.1),
                ),
                Container(
                    width: SizeConfig.screenWidth,
                    child: Text("${dataListener['NFDescription1']}",style: TextStyle(color: ColorUtil.themeBlack,fontSize: 14,fontFamily: 'MR'),)),
                const SizedBox(height: 5,),
                Container(
                    width: SizeConfig.screenWidth,
                    //  padding: const EdgeInsets.only(top: 10.0,bottom: 10.0),
                    // child: CachedNetworkImage(
                    //   imageUrl: "${GetImageBaseUrl()}${dataListener['NFImageFile']}",
                    //   fit: BoxFit.contain,
                    //   height: 100,
                    //   placeholder: (a,b){
                    //     return Container(height:30,width:30,alignment:Alignment.center,
                    //         child: CircularProgressIndicator(color: ColorUtil.primary,));
                    //     return Image.asset("assets/splash.jpg",fit:BoxFit.contain,height: 80,);
                    //   },
                    //   errorWidget: (a,b,c){
                    //     return Image.asset("assets/splash.jpg",fit:BoxFit.contain,height: 80,);
                    //   },
                    // ),
                    child: Image.asset("${dataListener['NFImageFile']}",fit: BoxFit.cover,height: 200,errorBuilder: (a,b,c){
                      return Image.asset("assets/splash.jpg",fit:BoxFit.contain,height: 80,);
                    },)
                ),
                const SizedBox(height: 5,),
                Container(
                    width: SizeConfig.screenWidth,
                    child: Text("${dataListener['NFDescription1']}",style: TextStyle(color: ColorUtil.themeBlack,fontSize: 14,fontFamily: 'MR'),)),
                const SizedBox(height: 5,),
                Container(
                    width: SizeConfig.screenWidth,
                    child: Text("${dataListener['NFDescription1']}",style: TextStyle(color: ColorUtil.themeBlack,fontSize: 14,fontFamily: 'MR'),)),
                const SizedBox(height: 5,),
                Container(
                    width: SizeConfig.screenWidth,
                    child: Text("${dataListener['NFDescription1']}",style: TextStyle(color: ColorUtil.themeBlack,fontSize: 14,fontFamily: 'MR'),)),
                const SizedBox(height: 5,),
                Container(
                    width: SizeConfig.screenWidth,
                    child: Text("${dataListener['NFDescription1']}",style: TextStyle(color: ColorUtil.themeBlack,fontSize: 14,fontFamily: 'MR'),)),
                const SizedBox(height: 5,),

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