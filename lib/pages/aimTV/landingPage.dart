import 'package:aimtv/utils/colorUtil.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import '../../HappyExtension/extensionHelper.dart';
import '../../utils/constants.dart';
import '../../utils/sizeLocal.dart';
import '../../widgets/companySettingsTextField.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  int selectTopSale = 0;

    List<dynamic> TrendingVideo = [
      {
        "Img": "assets/aimTV/maxresdefault.jpg",
        "title": "The fun never stops with",
        "Subtitle": "South Park"
      },
      {
        "Img": "assets/aimTV/tvimages.jpg",
        "title": "The fun never stops with",
        "Subtitle": "South Park"
      },
    ];
  List<dynamic> Category = [
    {
      "CatgName": "All",
    },
    {
      "CatgName": "Sports",
    },
    {
      "CatgName": "News",
    },
    {
      "CatgName": "Entertainment",
    },
    {
      "CatgName": "kids",
    }
  ];
  List<dynamic> TVChannelList = [
    {
      "ChannelLogo": "assets/aimTV/channel-1.png",
      "ChannelName": "Kalaingar TV",
      "ChannelId": "BLc2T0041kM"
    },
    {
      "ChannelLogo": "assets/aimTV/channel-2.png",
      "ChannelName": "Zee TV",
      "ChannelId": "fRT6ts5tqAA"
    },
    {
      "ChannelLogo": "assets/aimTV/channel-3.png",
      "ChannelName": "Jaya TV",
      "ChannelId": "sOiY8VEvtEM"
    },
    {
      "ChannelLogo": "assets/aimTV/channel-4.png",
      "ChannelName": "Sun TV",
      "ChannelId": "790xivlRc2c"
    },
    {
      "ChannelLogo": "assets/aimTV/channel-5.png",
      "ChannelName": "Polimer TV",
      "ChannelId": "sI04ltoUYhY"
    },
    {
      "ChannelLogo": "assets/aimTV/channel-6.png",
      "ChannelName": "Chutti TV",
      "ChannelId": "egtOu111ixU"
    },
    {
      "ChannelLogo": "assets/aimTV/channel-7.png",
      "ChannelName": "SunNews TV",
      "ChannelId": "2ywxK3HC4iA"
    },
    {
      "ChannelLogo": "assets/aimTV/channel-8.png",
      "ChannelName": "Captain TV",
      "ChannelId": "83TXhc0b4Hg"
    },
    {
      "ChannelLogo": "assets/aimTV/channel-9.png",
      "ChannelName": "Sun Music TV"
    },
    {"ChannelLogo": "assets/aimTV/channel-10.png", "ChannelName": "News 7 TV"},
  ];
  Widget build(BuildContext context) {
    return SafeArea(
        bottom: MyConstants.bottomSafeArea,
        child: Scaffold(
          backgroundColor: ColorUtil.themeBlack,
          body: Padding(
            padding: const EdgeInsets.only(left: 15.0, right: 15.0),
            child: Column(
              children: [
                Container(
                  height: 60,
                  alignment: Alignment.center,
                  child: Text(
                    'AIM TV',
                    style: ts18(ColorUtil.themeWhite,
                        fontfamily: 'RB', fontsize: 24),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  width: SizeConfig.screenWidth,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: SizeConfig.screenWidth! * 0.75,
                        height: 50,
                        child: TextField(
                          onChanged: (value) {
                            //Do something with the user input.
                          },
                          decoration: InputDecoration(
                            suffixIcon: Container(
                              margin: EdgeInsets.only(top: 5, bottom: 5),
                              width: 50,
                              height: 50,
                              decoration: BoxDecoration(
                                color: Colors.green,
                                shape: BoxShape.circle,
                              ),
                              child: Icon(Icons.search,
                                  color: ColorUtil.themeWhite),
                            ),
                            fillColor: ColorUtil.themeWhite,
                            filled: true,
                            hintText: 'What is your favorite tv ?.',
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 10.0, horizontal: 20.0),
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(32.0)),
                                borderSide:
                                    BorderSide(color: ColorUtil.themeWhite)),
                            enabled: true,
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.green, width: 2.0),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(32.0)),
                            ),
                          ),
                        ),
                      ),
                      Spacer(),
                      Container(
                        height: 45,
                        width: 45,
                        decoration: BoxDecoration(
                          color: Colors.green,
                          shape: BoxShape.circle,
                        ),
                        child: Icon(Icons.filter_alt_outlined,
                            color: ColorUtil.themeWhite),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                    // margin: EdgeInsets.only(left: 15.0, right: 15.0),
                    // color: Color(0XFFF7F7FF),
                    child: CarouselSlider(
                  options: CarouselOptions(
                    // aspectRatio: 16 / 9,
                    height: 200,
                    viewportFraction: 1,
                    initialPage: 0,
                    enableInfiniteScroll: true,
                    reverse: false,
                    autoPlay: true,
                    autoPlayInterval: Duration(seconds: 3),
                    autoPlayAnimationDuration: Duration(milliseconds: 800),
                    autoPlayCurve: Curves.fastOutSlowIn,
                    enlargeCenterPage: false,
                    scrollDirection: Axis.horizontal,
                    pageSnapping: true,
                    // enlargeCenterPage: false,
                  ),
                  items: TrendingVideo.map((item) => Container(
                        //  margin: EdgeInsets.only(right: 20),
                        width: SizeConfig.screenWidth,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        clipBehavior: Clip.antiAlias,
                        child: Container(
                          width: SizeConfig.screenWidth,
                          child: Stack(
                            children: [
                              Image.asset(
                                item['Img'],
                                fit: BoxFit.fill,
                                width: SizeConfig.screenWidth,
                              ),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Container(
                                  width: SizeConfig.screenWidth,
                                  height: SizeConfig.screenHeight,
                                  padding: EdgeInsets.only(left: 20.0),
                                  color: ColorUtil.themeBlack.withOpacity(0.4),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        item['title'],
                                        style: TextStyle(
                                          fontFamily: 'RB',
                                          fontSize: 18,
                                          color: ColorUtil.themeWhite,
                                        ),
                                      ),
                                      Text(
                                        item['Subtitle'],
                                        style: TextStyle(
                                          fontFamily: 'RB',
                                          fontSize: 18,
                                          color: ColorUtil.partiallyPaidClr,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Align(
                                  alignment: Alignment.topRight,
                                  child: Container(
                                    margin: EdgeInsets.only(right: 5, top: 5),
                                    child: Image.asset(
                                      'assets/aimTV/tvlogo.png',
                                      width: 80,
                                    ),
                                  ))
                            ],
                          ),
                        ),
                      )).toList(),
                )),
                const SizedBox(
                  height: 10,
                ),
                Container(
                    width: SizeConfig.screenWidth,
                    height: 70,
                    //  padding: EdgeInsets.only(bottom: 10),
                    alignment: Alignment.centerLeft,
                    child: ListView.builder(
                      physics: BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemCount: Category.length,
                      shrinkWrap: true,
                      itemBuilder: (ctx, i) {
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              selectTopSale = i;
                            });
                          },
                          child: AnimatedContainer(
                            duration: Duration(milliseconds: 400),
                            curve: Curves.easeIn,
                            decoration: i == selectTopSale
                                ? BoxDecoration(
                                    borderRadius: BorderRadius.circular(20.0),
                                    // boxShadow: [
                                    //   BoxShadow(
                                    //     color:tn.primaryColor.withOpacity(0.5),
                                    //     blurRadius: 5.0, // soften the shadow
                                    //     spreadRadius: 2, //extend the shadow
                                    //     offset: Offset(
                                    //       2.0, // Move to right 10  horizontally
                                    //       2.0, // Move to bottom 10 Vertically
                                    //     ),
                                    //   )
                                    // ],
                                    color: Color(0xff10852C),
                                  )
                                : BoxDecoration(
                                    borderRadius: BorderRadius.circular(20.0),
                                    border: Border.all(
                                        color: Color(0xff10852C),
                                        style: BorderStyle.solid,
                                        width: 2),
                                    // color: Color(0xffF8F8FA),
                                  ),
                            margin: EdgeInsets.only(
                                right: 10,
                                top: 10,
                                bottom: 10,
                                left: i == 0 ? 0 : 0),
                            padding: EdgeInsets.only(
                                left: 15, right: 15, top: 10, bottom: 10),
                            height: 45,
                            alignment: Alignment.center,
                            child: Text(Category[i]['CatgName'],
                                style: TextStyle(
                                    fontFamily: 'RR',
                                    fontSize: 15,
                                    color: i == selectTopSale
                                        ? Colors.white
                                        : Colors.white)),
                          ),
                        );
                      },
                    )),
                const SizedBox(
                  height: 10,
                ),
                Expanded(
                  child: Container(
                    width: SizeConfig.screenWidth,
                    child: SingleChildScrollView(
                      child: Wrap(
                        spacing: 10,
                        runSpacing: 10,
                        alignment: WrapAlignment.center,
                        // runAlignment: WrapAlignment.start,
                        // crossAxisAlignment: WrapCrossAlignment.start,
                        children: [
                          for (int i = 0; i < TVChannelList.length; i++)
                            GestureDetector(
                              onTap: () {
                                showProductVideo(TVChannelList[i]['ChannelId']);
                              },
                              child: Container(
                                height: 140,
                                width: (SizeConfig.screenWidth! - 30) * 0.3,
                                alignment: Alignment.center,
                                color: Colors.transparent,
                                child: Column(
                                  children: [
                                    Container(
                                      width: 100,
                                      height: 100,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: Colors.white,
                                      ),
                                      alignment: Alignment.center,
                                      child: Image.asset(
                                        TVChannelList[i]['ChannelLogo'],
                                        width: 70,
                                        fit: BoxFit.contain,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      TVChannelList[i]['ChannelName'],
                                      style: ts16(ColorUtil.themeWhite,
                                          fontfamily: 'RM'),
                                    )
                                  ],
                                ),
                              ),
                            ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ));
  }

  void showProductVideo(id) {
    YoutubePlayerController controller = YoutubePlayerController(
      initialVideoId: id,
      flags: YoutubePlayerFlags(
        autoPlay: false,
        mute: false,
      ),
    );

    Get.dialog(Dialog(
      //shape: alertRadius,
      backgroundColor: Colors.black,
      clipBehavior: Clip.antiAlias,
      insetPadding: EdgeInsets.fromLTRB(15, 0, 15, 0),
      child: Container(
          height: 230,
          width: SizeConfig.screenWidth,
          decoration: const BoxDecoration(
            color: Colors.black,
          ),
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            YoutubePlayer(
              controller: controller,
              showVideoProgressIndicator: true,
              //videoProgressIndicatorColor: Colors.amber,
              /*progressColors: ProgressColors(
                    playedColor: Colors.amber,
                    handleColor: Colors.amberAccent,
                  ),*/
              /*onReady () {
                _controller.addListener(listener);
                },*/
            ),
            /*Container(
                  //margin: EdgeInsets.only(left: 20,right: 20,top: 15),
                  child: FlickVideoPlayer(
                      flickManager: flickManager
                  ),
                )*/
          ])),
    )).then((value) {
      //flickManager.dispose();
      //SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

      controller.dispose();
      setState(() {
        SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
      });
    });
  }
}
