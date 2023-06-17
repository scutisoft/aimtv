import 'package:aimtv/anandhamPages/capacityBuilding/capacityBuilding.dart';
import 'package:aimtv/anandhamPages/idCard/idcard.dart';
import 'package:aimtv/anandhamPages/loginpage/login.dart';
import 'package:aimtv/anandhamPages/newsFeeds.dart';
import 'package:aimtv/anandhamPages/timeManagement/timeManagement.dart';
import 'package:aimtv/utils/colorUtil.dart';
import 'package:aimtv/utils/constants.dart';
import 'package:flutter/material.dart';
import '../utils/sizeLocal.dart';
import 'gallery/gallery.dart';
import 'homePage.dart';
import 'policeNews/policeNews.dart';

class Masterpage extends StatefulWidget {
  const Masterpage({Key? key}) : super(key: key);

  @override
  _MasterpageState createState() => _MasterpageState();
}
class _MasterpageState extends State<Masterpage> {
  @override
  GlobalKey <ScaffoldState> scaffoldkey=new GlobalKey<ScaffoldState>();
  int menuSel=3;
  late  double width,height,width2;
  Widget build(BuildContext context) {
    width=MediaQuery.of(context).size.width;
    height=MediaQuery.of(context).size.height;
    width2=width-16;
    SizeConfig().init(context);
    return Scaffold(
    
      key: scaffoldkey,
      drawer: Container(
        height: height,
        width: width!*0.75,
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          color:ColorUtil.themeWhite,
          //    borderRadius: BorderRadius.only(topRight: Radius.circular(15),bottomRight: Radius.circular(15))
        ),

        child:SafeArea(
          child: Column(
            children: [
              SizedBox(height: 5,),
              Container(
                child: Padding(
                  padding: const EdgeInsets.only(left: 18.0,right: 8.0,),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        height: 35,
                        width: 35,
                        // alignment: Alignment.centerLeft,
                        // margin: EdgeInsets.only(left: 30,top: 30),
                        // decoration: BoxDecoration(
                        //     color: Colors.white,
                        //     borderRadius: BorderRadius.circular(5)
                        // ),
                        child: IconButton(onPressed: (){
                          scaffoldkey.currentState!.openEndDrawer();
                          // Navigator.push(context, MaterialPageRoute(builder: (ctx)=>ThemeSettings()));
                        }, icon: Icon(Icons.close,color:ColorUtil.themeBlack,size: 25,),),
                      ),
                      Container(
                          height: 50,
                          width: 50,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: ColorUtil.primary2,
                              shape: BoxShape.circle
                          ),
                          child: GestureDetector(
                            onTap: (){
                              //Navigator.push(context, MaterialPageRoute(builder: (context)=>ViewProfile(),));
                            },
                            child: Container(
                                height: 40,
                                width: 40,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    shape: BoxShape.circle
                                ),
                                clipBehavior: Clip.antiAlias,
                                child: Image.asset("assets/anandham/Icons/avatar.png")
                            ),
                          )
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 5,),
              DrawerContent(
                title: 'Dashboard',
                iconImg: 'assets/anandham/Icons/dashboard.png',
                ontap: (){
                  setState(() {
                    menuSel=1;
                  });
                  scaffoldkey.currentState!.openEndDrawer();
                },
              ),
              DrawerContent(
                title: 'News feed',
                iconImg: 'assets/anandham/Icons/Vector.png',
                ontap: (){
                  setState(() {
                    menuSel=3;
                  });
                  scaffoldkey.currentState!.openEndDrawer();
                },
              ),
              DrawerContent(
                title: 'My ID',
                iconImg: 'assets/anandham/Icons/badge.png',
                ontap: (){
                  setState(() {
                    menuSel=4;
                  });
                  scaffoldkey.currentState!.openEndDrawer();
                },
              ),
              DrawerContent(
                title: 'Capacity Building',
                iconImg: 'assets/anandham/Icons/Vector (1).png',
                ontap: (){
                  setState(() {
                    menuSel=5;
                  });
                  scaffoldkey.currentState!.openEndDrawer();
                },
              ),
              DrawerContent(
                title: 'Time management',
                iconImg: 'assets/anandham/Icons/schedule.png',
                ontap: (){
                  setState(() {
                    menuSel=6;
                  });
                  scaffoldkey.currentState!.openEndDrawer();
                },
              ),
              DrawerContent(
                title: 'Photo Gallery',
                iconImg: 'assets/anandham/Icons/gallery_thumbnail.png',
                ontap: (){
                  setState(() {
                    menuSel=7;
                  });
                  scaffoldkey.currentState!.openEndDrawer();
                },
              ),
              DrawerContent(
                title: 'Meeting',
                iconImg: 'assets/anandham/Icons/groups_2.png',
                ontap: (){
                  setState(() {
                    menuSel=8;
                  });
                  scaffoldkey.currentState!.openEndDrawer();
                },
              ),
              DrawerContent(
                title: 'Doctor',
                iconImg: 'assets/anandham/Icons/ecg_heart.png',
                ontap: (){
                  setState(() {
                    menuSel=9;
                  });
                  scaffoldkey.currentState!.openEndDrawer();
                },
              ),
              Spacer(),
              DrawerContent(
                title: 'LogOut',
                iconImg: 'assets/anandham/Icons/logout.png',
                ontap: (){
                  fadeRoute(LoginV2());
                },
              ),
              // Divider(color: Color(0xff099FAF),thickness: 0.1,),
            ],
          ),
        ),
      ),
      body:menuSel==7?GalleryPage(
        voidCallback:(){
          scaffoldkey.currentState!.openDrawer();
        },
      ) :menuSel==3?NewsFeed(
        voidCallback:(){
          scaffoldkey.currentState!.openDrawer();
        },
      ):menuSel==4?MyIdCard(
        voidCallback:(){
          scaffoldkey.currentState!.openDrawer();
        },
      ) :menuSel==5?CapacityBuildingSessions(
        voidCallback:(){
          scaffoldkey.currentState!.openDrawer();
        },
      ) :menuSel==6?TimeManagement(
        voidCallback:(){
          scaffoldkey.currentState!.openDrawer();
        },
      ) :Container(
      width: SizeConfig.screenWidth,
      height: SizeConfig.screenHeight,
      child: Center(child: Text('Work in Progress.....',style: ts20(ColorUtil.primary,fontfamily: 'SB',fontsize: 18),)),
      ),
    );
  }
}

class DrawerContent extends StatelessWidget {
  String title;
  VoidCallback ontap;
  String  iconImg;
  DrawerContent({required this.title,required this.ontap,required this.iconImg,});
  late double width;

  @override
  Widget build(BuildContext context) {
    width=MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: ontap,
      child: Container(
        height: 50,
        width: width,
        color: Colors.transparent,
        margin: EdgeInsets.only(top: 5,bottom: 5,left:20.0 ),
        child: Row(
          children: [
            Container(
              height: 40,
              width: 40,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: ColorUtil.primary,
                  shape: BoxShape.circle,
              ),
              child: Image.asset('$iconImg')
            ),
            SizedBox(width: 20,),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("$title",
                  style: TextStyle(fontFamily: 'MR',fontSize: 16,color: ColorUtil.themeBlack,letterSpacing: 0.2,fontWeight: FontWeight.w500),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

