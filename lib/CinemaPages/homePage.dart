import 'package:aimtv/utils/constants.dart';
import 'package:aimtv/utils/sizeLocal.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../utils/colorUtil.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<dynamic> TrendingVideo = [
    {
      "Img": "assets/cinema/Maveeran-Movie-Ticket.webp",
    },
    {
      "Img": "assets/cinema/home_header.png",
    },
  ];
  List<dynamic> Category = [
    {
      "CatgImg": "assets/cinema/0.png",
      "CatgName": "Star Wars",
      "Catgtitle": "Rise of SkyWiker",
    },
    {
      "CatgImg": "assets/cinema/1.png",
      "CatgName": "Star Wars",
      "Catgtitle": "Rise of SkyWiker",
    },
    {
      "CatgImg": "assets/cinema/2.png",
      "CatgName": "Star Wars",
      "Catgtitle": "Rise of SkyWiker",
    },
    {
      "CatgImg": "assets/cinema/3.png",
      "CatgName": "Star Wars",
      "Catgtitle": "Rise of SkyWiker",
    },
    {
      "CatgImg": "assets/cinema/4.png",
      "CatgName": "Star Wars",
      "Catgtitle": "Rise of SkyWiker",
    },
  ];
  List<dynamic> Category1 = [
    {
      "CatgImg": "assets/cinema/top_movies/0.png",
      "CatgName": "Star Wars",
      "Catgtitle": "Rise of SkyWiker",
    },
    {
      "CatgImg": "assets/cinema/top_movies/1.png",
      "CatgName": "Star Wars",
      "Catgtitle": "Rise of SkyWiker",
    },
    {
      "CatgImg": "assets/cinema/top_movies/2.png",
      "CatgName": "Star Wars",
      "Catgtitle": "Rise of SkyWiker",
    },
    {
      "CatgImg": "assets/cinema/top_movies/3.png",
      "CatgName": "Star Wars",
      "Catgtitle": "Rise of SkyWiker",
    },
    {
      "CatgImg": "assets/cinema/top_movies/4.png",
      "CatgName": "Star Wars",
      "Catgtitle": "Rise of SkyWiker",
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    backgroundColor: ColorUtil.themeWhite,
      body: Container(
      child: SafeArea(
        child:  Column(
          children: [
            Container(
            height: SizeConfig.screenHeight!-83,
              child: ListView(
                 physics: BouncingScrollPhysics(),
                 shrinkWrap: true,
                children: [
                   Padding(
                     padding: const EdgeInsets.only(top: 15.0,left: 15.0,right: 20.0),
                     child: Row(
                     crossAxisAlignment: CrossAxisAlignment.start,
                       children: [
                         Column(
                           crossAxisAlignment: CrossAxisAlignment.start,
                           children: [
                             Text('Book ticket for you',style: ts20(ColorUtil.themeBlack.withOpacity(0.8),fontfamily: 'RM',fontsize: 16),),
                             Padding(
                               padding: const EdgeInsets.only(top: 5.0,),
                               child: Row(
                                 crossAxisAlignment: CrossAxisAlignment.end,
                                 children: [
                                   Text('Entertaiment',style: ts20(ColorUtil.themeBlack,fontfamily: 'RB',fontsize: 16),),
                                   SizedBox(width: 5,),
                                   Image.asset('assets/cinema/popcorn.png',width: 20,)
                                 ],
                               ),
                             ),
                           ],
                         ),
                         Spacer(),
                         Column(
                         crossAxisAlignment: CrossAxisAlignment.start,
                           children: [
                             Row(
                               children: [
                                 Container(
                                     decoration: BoxDecoration(
                                     shape: BoxShape.circle,
                                       color: ColorUtil.primary,
                                     ),
                                     padding: EdgeInsets.all( 2),
                                     child: Icon(Icons.location_on_outlined,color:ColorUtil.themeWhite ,size: 14,)
                                 ),
                                 SizedBox(width: 5,),
                                 Text('Chennai',style: ts20(ColorUtil.primary.withOpacity(0.8),fontfamily: 'RM',fontsize: 15),),
                               ],
                             ),
                             SizedBox(height: 10,),
                             Container(
                                 decoration: BoxDecoration(
                                   borderRadius: BorderRadius.circular(2.0),
                                   color: Color(0XffEEEEEE),
                                 ),
                                 width: 80,
                                 alignment: Alignment.center,
                                 padding: EdgeInsets.fromLTRB( 10,3,10,3),
                             child: Text('change',style: ts20(ColorUtil.themeBlack.withOpacity(0.8),fontfamily: 'RM',fontsize: 14),)
                             ),
                           ],
                         ),
                       ],
                     ),
                   ),
                   SizedBox(height: 20,),
                  Container(
                      width: SizeConfig.screenWidth,
                      height: SizeConfig.screenHeight!*0.3,
                      child: CarouselSlider(
                        options: CarouselOptions(
                          // aspectRatio: 16 / 9,
                          height: SizeConfig.screenHeight,
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
                        items: TrendingVideo.map((item) => GestureDetector(
                          onTap: (){
                          },
                          child: Image.asset(
                            item['Img'],
                            fit: BoxFit.cover,
                            width: SizeConfig.screenWidth,
                          ),
                        )).toList(),
                      )),
                       SizedBox(height: 20,),
                      Padding(
                        padding: const EdgeInsets.only(left: 15.0,right: 15.0),
                        child: Row(
                        children: [
                          Text('Selected for you',style: ts20(ColorUtil.themeBlack.withOpacity(0.8),fontfamily: 'RM',fontsize: 14),),
                          Spacer(),
                          Text('32 Movies',style: ts20(ColorUtil.primary.withOpacity(0.8),fontfamily: 'RM',fontsize: 14),),
                        ],
                        ),
                      ),

                      Container(
                      width: SizeConfig.screenWidth,
                      height: 250,
                      //  padding: EdgeInsets.only(bottom: 10),
                      alignment: Alignment.centerLeft,
                      child: ListView.builder(
                        physics: BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        itemCount: Category.length,
                        shrinkWrap: true,
                        itemBuilder: (ctx, i) {
                          return GestureDetector(
                            // onTap: () {
                            //   setState(() {
                            //     selectTopSale = i;
                            //   });
                            // },
                            child: Container(
                              decoration:BoxDecoration(
                                borderRadius:
                                BorderRadius.circular(5.0),
                              ),
                              margin: EdgeInsets.only(right: 10, top: 5,bottom: 5,left: i == 0 ? 15 : 0),
                              width: SizeConfig.screenWidth! * 0.33,
                              clipBehavior: Clip.antiAlias,
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Image.asset(
                                    Category[i]['CatgImg'],
                                    fit: BoxFit.contain,
                                  ),
                                  SizedBox(height: 5,),
                                  Text(
                                    Category[i]['CatgName'],
                                    style: TextStyle(
                                        color: ColorUtil.themeBlack,
                                        fontSize: 14,
                                        fontFamily: 'RB'),
                                  ),
                                  SizedBox(height: 5,),
                                  Text(
                                    Category[i]['Catgtitle'],
                                    style: TextStyle(
                                        color: ColorUtil.themeBlack,
                                        fontSize: 14,
                                        fontFamily: 'RB'),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      )),
                      SizedBox(height: 20,),
                      Padding(
                    padding: const EdgeInsets.only(left: 15.0,right: 15.0),
                    child: Row(
                      children: [
                        Text('Hollywood',style: ts20(ColorUtil.themeBlack.withOpacity(0.8),fontfamily: 'RM',fontsize: 14),),
                        Spacer(),
                        Text('16 Movies',style: ts20(ColorUtil.primary.withOpacity(0.8),fontfamily: 'RM',fontsize: 14),),
                      ],
                    ),
                  ),
                      Container(
                      width: SizeConfig.screenWidth,
                      height: 250,
                      //  padding: EdgeInsets.only(bottom: 10),
                      alignment: Alignment.centerLeft,
                      child: ListView.builder(
                        physics: BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        itemCount: Category1.length,
                        shrinkWrap: true,
                        itemBuilder: (ctx, i) {
                          return GestureDetector(
                            // onTap: () {
                            //   setState(() {
                            //     selectTopSale = i;
                            //   });
                            // },
                            child: Container(
                              decoration:BoxDecoration(
                                borderRadius:
                                BorderRadius.circular(5.0),
                              ),
                              margin: EdgeInsets.only(right: 10, top: 5,bottom: 5,left: i == 0 ? 15 : 0),
                              width: SizeConfig.screenWidth! * 0.33,
                              clipBehavior: Clip.antiAlias,
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Image.asset(
                                    Category1[i]['CatgImg'],
                                    fit: BoxFit.contain,
                                  ),
                                  SizedBox(height: 5,),
                                  Text(
                                    Category1[i]['CatgName'],
                                    style: TextStyle(
                                        color: ColorUtil.themeBlack,
                                        fontSize: 14,
                                        fontFamily: 'RB'),
                                  ),
                                  SizedBox(height: 5,),
                                  Text(
                                    Category1[i]['Catgtitle'],
                                    style: TextStyle(
                                        color: ColorUtil.themeBlack,
                                        fontSize: 14,
                                        fontFamily: 'RB'),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      )),
                ],
              ),
            ),
            Container(
              child: Image.asset('assets/cinema/ft.png',width: SizeConfig.screenWidth, fit: BoxFit.cover,),
            )
          ],
        ),
        ),
      ),
    ) ;
  }
}
