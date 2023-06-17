import 'dart:io';
import 'package:aimtv/anandhamPages/Notification.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../HappyExtension/extensionHelper.dart';
import '../../utils/colorUtil.dart';
import '../../utils/constants.dart';
import '../../utils/sizeLocal.dart';
import '../../utils/utils.dart';
import '../../widgets/innerShadowTBContainer.dart';
import '../../widgets/listView/HE_ListView.dart';
import '../../widgets/loader.dart';
import '../../widgets/popupBanner/popup.dart';

class NewsFeed extends StatefulWidget {
  VoidCallback voidCallback;
  NewsFeed({required this.voidCallback});
  @override
  _NewsFeedState createState() => _NewsFeedState();
}

class _NewsFeedState extends State<NewsFeed> with HappyExtensionHelper,TickerProviderStateMixin  implements HappyExtensionHelperCallback {
  
  List<dynamic> NewsFeed=[
    {
      "SNO": 9,
      "NFID": 3,
      "NFNAME": "Maheshwari. N",
      "NFDATE": "12-03-2023",
      "NFTime": "10 mint Ago",
      "NFDescription": "CONSERVE NATURE  is going to plant 500000 plants on March 11, 2023, 08:30 AM in CHENNAI District",
      "NFImageFile": "assets/anandham/NewsFeed1.png,assets/anandham/newsfeed3.png",
      "NFApproved": "2023-03-12T18:31:49.027",
      "NFType": "Police",
      "NFApprovedDate": "March 12, 2023",
      "NFLocation":"Thiruverkadu",
      "NFProfileImage": "assets/anandham/Icons/avatar.png",
      "IsInterested": 0
    },
    {
      "SNO":1,
      "NFID":27,
      "NFNAME":"Vijayalakshmi.M",
      "NFDATE":"02-02-2023",
      "NFTime":"10 mint Ago",
      "NFDescription":"5 Hectares land has been added to Our Eco Green Foundation Project",
      "NFLocation":"MAYILADUDURAI, Agaraelathur",
      "NFImageFile":"assets/anandham/NewsFeed1.png",
      "NFType":"SI",
      "NFApprovedDate":"March 15, 2023",
      "NFLocation":"Chennai",
      "NFProfileImage":"assets/anandham/Icons/avatar.png",
      "IsInterested":0
    },
    {
      "SNO":2,
      "NFID":26,
      "NFNAME":"Saranya.S",
      "NFDATE":"02-02-2023",
      "NFTime":"10 mint Ago",
      "NFDescription":"5 Hectares land has been added to Our Eco Green Foundation Project",
      "NFLocation":"MAYILADUDURAI, Agaraelathur",
      "NFImageFile":"assets/anandham/NewsFeed1.png",
      "NFType":"SI",
      "NFApprovedDate":"March 15, 2023",
      "NFLocation":"Chennai",
      "NFProfileImage":"assets/anandham/Icons/avatar.png",
      "IsInterested":0
    },
    // {"SNO":2,"NFID":33,"NFNAME":"இளவரசன் சோலைவனம் ","NFDATE":"14-03-2023","NFTime":"11:00 AM","NFDescription":"23E தவுத்தாய்குளம் Donated 50000 seeds.","NFLocation":"ARIYALUR, Kodukkur","NFImageFile":"Seeding/scaled_IMG-20230308-WA0029.jpg","NFApproved":"2023-03-14T19:51:55.557","NFType":"Seeding","NFApprovedDate":"March 14, 2023","NFProfileImage":"Image/IMG_20230305_194612.jpg","IsInterested":0},
    // {"SNO":3,"NFID":34,"NFNAME":"இளவரசன் சோலைவனம் ","NFDATE":"14-03-2023","NFTime":"11:02 AM","NFDescription":"இளவரசன் சோலைவனம்  Donated 50000 seeds.","NFLocation":"ARIYALUR, Kodukkur","NFImageFile":"Seeding/scaled_IMG-20230307-WA0037.jpg","NFApproved":"2023-03-14T19:51:52.960","NFType":"Seeding","NFApprovedDate":"March 14, 2023","NFProfileImage":"Image/IMG_20230305_194612.jpg","IsInterested":0},
    // {"SNO":4,"NFID":35,"NFNAME":"இளவரசன் சோலைவனம் ","NFDATE":"14-03-2023","NFTime":"11:04 AM","NFDescription":"இளவரசன் சோலைவனம்  Donated 50000 seeds.","NFLocation":"ARIYALUR, Kodukkur","NFImageFile":"Seeding/scaled_IMG-20230308-WA0037.jpeg","NFApproved":"2023-03-14T19:51:49.513","NFType":"Seeding","NFApprovedDate":"March 14, 2023","NFProfileImage":"Image/IMG_20230305_194612.jpg","IsInterested":0},
    // {"SNO":5,"NFID":36,"NFNAME":"இளவரசன் சோலைவனம் ","NFDATE":"14-03-2023","NFTime":"11:08 AM","NFDescription":"இளவரசன் சோலைவனம்  Donated 50000 seeds.","NFLocation":"ARIYALUR, Kodukkur","NFImageFile":"Seeding/scaled_IMG-20230308-WA0031.jpg","NFApproved":"2023-03-14T19:51:45.713","NFType":"Seeding","NFApprovedDate":"March 14, 2023","NFProfileImage":"Image/IMG_20230305_194612.jpg","IsInterested":0}
  ];
  Directory? imgPath;

  List<Widget> widgets=[];
  int _current = 0;
  final CarouselController _controller = CarouselController();
  late HE_ListViewBody he_listViewBody;



  late TabController _tabController;

  double cardWidth=SizeConfig.screenWidth!;


  @override
  void initState(){
    _tabController = TabController(length: 3,  vsync: this);
    he_listViewBody=HE_ListViewBody(
        data: [],
        getWidget: (e) {
          return HE_ViewNewsGridContent(
            data: e,
            cardWidth: cardWidth,
            globalKey: GlobalKey(),
            imgPath:imgPath==null ?"": imgPath!.path,
          );
        }
    );
    assignWidgets();
    super.initState();
  }

  var node;


  @override
  Widget build(BuildContext context) {
    node=FocusScope.of(context);
    return Scaffold(
      backgroundColor: ColorUtil.theme,
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              child: Column(
              mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(height: 60,),
                  Flexible(child: he_listViewBody),

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
                  GestureDetector(
                      onTap: (){
                        widget.voidCallback();
                      },
                      child: Container(
                          width: 40,
                          height: 40,
                          alignment: Alignment.center,
                          color: Colors.transparent,
                          child: Image.asset('assets/anandham/Icons/menu-left.png'))),
                  SizedBox(width: 10,),
                  Text('NewsFeed',style: ts20(ColorUtil.themeBlack,fontfamily: 'SB',fontsize: 18),),
                  Spacer(),
                  Image.asset('assets/anandham/Icons/cached.png'),
                  SizedBox(width: 15,),
                  GestureDetector(
                  onTap: (){
                    fadeRoute(NotificationBar());
                  },
                    child: Container(
                        height: 35,
                        width: 35,
                        alignment: Alignment.center,
                        child: Stack(
                          children: [
                            Image.asset('assets/anandham/Icons/bell.png',height: 35,),
                            Positioned(
                              top: 0,
                              right: 0,
                              child: Container(
                                width: 18,
                                height: 18,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: ColorUtil.primary
                                ),
                                child: Text('12',style: ts20(ColorUtil.themeWhite,fontsize: 12, fontfamily: 'MM',),),
                              ),
                            ),
                          ],
                        )),
                  )
                ],
              ),
            ),
               // Positioned(
            //     bottom: 25,
            //     right: 20,
            //     child: GestureDetector(
            //       onTap:(){
            //         //fadeRoute(UploadPostPage());
            //       },
            //       child: Container(
            //           width: 80,
            //           height: 80,
            //           alignment: Alignment.center,
            //           clipBehavior: Clip.antiAlias,
            //           decoration: BoxDecoration(
            //             color: ColorUtil.primary,
            //             shape: BoxShape.circle,
            //             boxShadow: [
            //               BoxShadow(
            //                 color: ColorUtil.primary.withOpacity(0.4),
            //                 spreadRadius: 2,
            //                 blurRadius: 15,
            //                 offset: Offset(1, 8), // changes position of shadow
            //               ),
            //             ],
            //           ),
            //           child: Icon(Icons.add,color: ColorUtil.themeWhite,size: 25,)
            //       ),
            //     )
            // ),
            ShimmerLoader(),
          ],
        ),
      ),
    );
  }

  @override
  void assignWidgets() async{
    widgets.clear();
    imgPath=await getApplicationPath();
    he_listViewBody.assignWidget(NewsFeed);

    setState(() {});
    // await parseJson(widgets, General.donateIdentifier);
  }
}

class HE_ViewNewsGridContent extends StatelessWidget implements HE_ListViewContentExtension {
  double cardWidth;
  Map data;
  Function(Map)? onEdit;
  Function(String)? onDelete;
  GlobalKey globalKey;
  String imgPath;
  HE_ViewNewsGridContent({Key? key, required this.data,required this.cardWidth,this.onDelete,required this.globalKey,
    required this.imgPath}): super(key: key){
    dataListener.value=data;
    imgList=data['NFImageFile'].split(",");
    for(int i=0;i<imgList.length;i++){
      imgListUrl.add('${imgList[i]}');
    }
  }
  var dataListener={}.obs;

  List<dynamic> imgList=[];
  List<String> imgListUrl=[];


  @override
  Widget build(BuildContext context) {
    return Container(
      width: SizeConfig.screenWidth,
      clipBehavior: Clip.antiAlias,
      margin: const EdgeInsets.only(left: 15,right: 15,bottom: 20),
      padding: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: ColorUtil.themeWhite,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Container(
                  width: 40,
                  height: 40,
                  alignment: Alignment.center,
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    color: ColorUtil.primary,
                    shape: BoxShape.circle,
                  ),
                  child: getProfile(dataListener['NFProfileImage'],imgPath)
              ),
              const SizedBox(width: 5,),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Flexible(
                      flex:2,
                      child: Text("${dataListener['NFNAME']}",style:  TextStyle(fontFamily: 'MR',fontSize: 14,color: ColorUtil.themeBlack,fontWeight: FontWeight.w600),)
                  ),
                  Text("${dataListener['NFType']}",style:  TextStyle(fontFamily: 'MR',fontSize: 13,color: ColorUtil.themeBlack,fontWeight: FontWeight.w500),),
                ],
              ),
              Spacer(),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text("${dataListener['NFTime']}",style:  TextStyle(fontFamily: 'MR',fontSize: 13,color: ColorUtil.text4,fontWeight: FontWeight.w500),),
                  // Text("${dataListener['NFDATE']}",style:  TextStyle(fontFamily: 'RR',fontSize: 12,color: ColorUtil.themeBlack),),
                ],
              ),
            ],
          ),
          const SizedBox(height: 10,),
          GestureDetector(
              onTap: (){
                showHideDotsPopup(imgListUrl,context);
                //fadeRoute(NewsFeedsView());
              },
              child: getImgByCount(imgList.length,imgList,imgPath)),
          const SizedBox(height: 20,),
          Padding(
            padding: const EdgeInsets.only(left: 5.0,right: 8.0),
            child: Text("${dataListener['NFDescription']}",style:  TextStyle(fontFamily: 'MM',fontSize: 14,color: ColorUtil.themeBlack,),),
          ),
          const SizedBox(height: 15,),
          Row(
          crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(Icons.location_on,color: ColorUtil.text4,),
                  const SizedBox(width: 5,),
                  Text("${dataListener['NFLocation']}",style:  TextStyle(fontFamily: 'MR',fontSize: 14,color: ColorUtil.text4,fontWeight: FontWeight.w400,),)
                ],
              ),
              Container(
                // padding: const EdgeInsets.fromLTRB(8,0,8,0),
                child: Row(
                  children: [
                    Icon(Icons.thumb_up_alt_outlined,color: ColorUtil.themeBlack,size: 20,),
                    const SizedBox(width: 15,),
                    Icon(Icons.share,color: ColorUtil.themeBlack,size: 20,),
                    const SizedBox(width: 15,),
                    Icon(Icons.messenger_outline,color: ColorUtil.themeBlack,size: 20,),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 5,),
        ],
      ),
    );
  }

  @override
  updateDataListener(Map data) {

  }
}

Widget getImgContainer(path,imgPath){
  return Image.asset('assets/anandham/NewsFeed1.png',fit: BoxFit.cover);
  return Image.file(File('$imgPath/$path'),fit: BoxFit.cover,errorBuilder: (a,b,c){
    return Image.asset('assets/logo.png',fit: BoxFit.cover);
  });
}

Widget getProfile(path,imgPath){
  return Image.asset(path,fit: BoxFit.cover);
  return Image.file(File('$imgPath/$path'),fit: BoxFit.cover,errorBuilder: (a,b,c){
    return Icon(Icons.person_outline_outlined,color: ColorUtil.themeWhite,);
  },);
}

Widget getImgByCount(cunt,imgList,imgPath) {
  if(cunt==1){
    return  Container(
        width:SizeConfig.screenWidth,
        height: 200,
        clipBehavior: Clip.antiAlias,
        decoration:BoxDecoration(
        borderRadius: BorderRadius.circular(10)
        ),
        child: getImgContainer(imgList[0],imgPath)
    );
  }
  else if(cunt==2){
    return Container(
      height: 200,
      clipBehavior: Clip.antiAlias,
      decoration:BoxDecoration(
          borderRadius: BorderRadius.circular(10)
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
              width:SizeConfig.screenWidth!*0.50,
              height: 200,
              child:getImgContainer(imgList[0],imgPath)
          ),
          const SizedBox(width: 1,),
          SizedBox(
              width:(SizeConfig.screenWidth!*0.5)-51,
              height: 200,
              child:getImgContainer(imgList[1],imgPath)
          )
        ],
      ),
    );
  }
  else if(cunt>=3){
    return Container(
      height: 200,
      clipBehavior: Clip.antiAlias,
      decoration:BoxDecoration(
          borderRadius: BorderRadius.circular(10)
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
              width:SizeConfig.screenWidth!*0.5,
              height: 200,
              child:getImgContainer(imgList[0],imgPath)
          ),
          const SizedBox(width: 1,),
          SizedBox(
            width:(SizeConfig.screenWidth!*0.5)-51,
            height: 200,
            child: Column(
              children: [
                SizedBox(
                    width:SizeConfig.screenWidth,
                    height: 99.5,
                    child:getImgContainer(imgList[1],imgPath)
                ),
                const SizedBox(height: 1,),
                SizedBox(
                    width:SizeConfig.screenWidth,
                    height: 99.5,
                    child:getImgContainer(imgList[2],imgPath)
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
  return Container(height: 200,);
}

void showHideDotsPopup(images,BuildContext context) {
  /* Get.defaultDialog(
        title: "Hii"
    );*/

  PopupBanner(
      context: context,
      images: images,
      useDots: true,
      autoSlide: false,
      onClick: (index) {},
      fit: BoxFit.contain,
      isLocal: true,
      dotsColorActive: ColorUtil.primary
  ).show();
}