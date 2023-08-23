import 'package:aimtv/utils/constants.dart';
import 'package:aimtv/utils/sizeLocal.dart';
import 'package:aimtv/widgets/customAppBar.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utils/colorUtil.dart';
import '../widgets/calculation.dart';

class KioskOrderType extends StatefulWidget {
  @override
  State<KioskOrderType> createState() => _KioskOrderTypeState();
}

class _KioskOrderTypeState extends State<KioskOrderType> {
  List<dynamic> MenuCategory=[
    {"CatgImg": "assets/kiosk/salad.png","Title": "Veg"},
    {"CatgImg": "assets/kiosk/chicken-leg.png","Title": "Non-Veg"},
    {"CatgImg": "assets/kiosk/drinks.png","Title": "Beverages"},
    {"CatgImg": "assets/kiosk/panna-cotta.png","Title": "Dessert"},
  ];
  List<dynamic> ItemList=[
    {'icons':'assets/kiosk/paneer-tikka.png',"Title":"Paneer Tika","Rate":"250",},
    {'icons':'assets/kiosk/paneer-tikka.png',"Title":"Paneer Tika","Rate":"250"},
    {'icons':'assets/kiosk/paneer-tikka.png',"Title":"Paneer Tika","Rate":"250"},
    {'icons':'assets/kiosk/paneer-tikka.png',"Title":"Paneer Tika","Rate":"250"},
    {'icons':'assets/kiosk/paneer-tikka.png',"Title":"Paneer Tika","Rate":"250"},
    {'icons':'assets/kiosk/paneer-tikka.png',"Title":"Paneer Tika","Rate":"250"},
    {'icons':'assets/kiosk/paneer-tikka.png',"Title":"Paneer Tika","Rate":"250"},
    {'icons':'assets/kiosk/paneer-tikka.png',"Title":"Paneer Tika","Rate":"250"},
    {'icons':'assets/kiosk/paneer-tikka.png',"Title":"Paneer Tika","Rate":"250"},
    {'icons':'assets/kiosk/paneer-tikka.png',"Title":"Paneer Tika","Rate":"250"},
    {'icons':'assets/kiosk/paneer-tikka.png',"Title":"Paneer Tika","Rate":"250"},
    {'icons':'assets/kiosk/paneer-tikka.png',"Title":"Paneer Tika","Rate":"250"},
    {'icons':'assets/kiosk/paneer-tikka.png',"Title":"Paneer Tika","Rate":"250"},
    {'icons':'assets/kiosk/paneer-tikka.png',"Title":"Paneer Tika","Rate":"250"},
    {'icons':'assets/kiosk/paneer-tikka.png',"Title":"Paneer Tika","Rate":"250"},

  ];
  List<dynamic> CartList=[
    {'icons':'assets/kiosk/paneer-tikka.png',"Title":"Paneer Tika","Rate":"250",},
    {'icons':'assets/kiosk/paneer-tikka.png',"Title":"Paneer Tika","Rate":"250",},
  ];

  int selectTopSale=0;
  int selectCart=0;
  int selectNew=0;
  var animStart = false.obs;
  var showSplash = true.obs;
  var isItemAdd = false.obs;
  var isCartOpen = false.obs;
  var isPay = false.obs;
  int totalItem=0;
  double totalAmt=0.0;
  void totalCalc(){
    totalItem=ItemList.where((element) => element['IsAdd']).toList().length;
    totalAmt=0.0;
    ItemList.where((element) => element['IsAdd']).forEach((element) {
      totalAmt=Calculation().add(totalAmt, Calculation().mul(element['Rate'], element['Qty']));
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:SafeArea(
        child:  Container(
          width: SizeConfig.screenWidth,
          height: SizeConfig.screenHeight,
          decoration: BoxDecoration(
          color: ColorUtil.theme
          ),
          child:Row(
            children: [
              Container(
              // color: Colors.red,
                width: SizeConfig.screenWidth!*0.3,
                height: SizeConfig.screenHeight,
                padding: EdgeInsets.all(15.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: SizeConfig.screenWidth,
                      height: 200,
                      alignment: Alignment.center,
                      padding: EdgeInsets.all(15.0),
                      decoration: BoxDecoration(
                         borderRadius: BorderRadius.circular(10),
                         color: ColorUtil.themeWhite
                      ),
                      child: Image.asset('assets/kiosk/Kiosklogo.png',width: SizeConfig.screenWidth,fit: BoxFit.contain,),
                    ),
                    SizedBox(height: 40,),
                    Padding(
                      padding: const EdgeInsets.only(left:10.0),
                      child: Row(
                      children: [
                        Text('Menu',style: ts20(ColorUtil.themeBlack,fontsize: 40,fontfamily: 'RM',fontWeight:FontWeight.w600),),
                        SizedBox(width: 10,),
                        Text('Category',style: ts20(ColorUtil.themeBlack.withOpacity(0.4),fontsize: 40,fontfamily: 'RR',fontWeight:FontWeight.w500),)
                      ],
                      ),
                    ),
                    SizedBox(height: 40,),
                    Container(
                      padding: const EdgeInsets.only(left:10.0),
                      height: SizeConfig.screenHeight!-370,
                      width: 220,
                      child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: MenuCategory.length,
                      itemBuilder: ((ctx,i){
                           return GestureDetector(
                             onTap: (){
                               setState(() {
                                 selectTopSale=i;
                               });
                             },
                             child: AnimatedContainer(
                             width: 100,
                               duration: Duration(milliseconds: 400),
                               curve: Curves.easeIn,
                               decoration:i==selectTopSale? BoxDecoration(
                                 borderRadius: BorderRadius.circular(20.0),
                                 boxShadow: [
                                   BoxShadow(
                                     color:ColorUtil.primary.withOpacity(0.3),
                                     blurRadius: 5.0, // soften the shadow
                                     spreadRadius: 2, //extend the shadow
                                     offset: Offset(
                                       0.0, // Move to right 10  horizontally
                                       5.0, // Move to bottom 10 Vertically
                                     ),
                                   )
                                 ],
                                 color:ColorUtil.primary,
                               ):BoxDecoration(
                                 borderRadius: BorderRadius.circular(20.0),
                                 color:ColorUtil.themeWhite,
                               ) ,
                               margin: EdgeInsets.only(right: 10,top: i==0?0:20,bottom: 10,left:0),
                               padding: EdgeInsets.only(right: 15,top: 15,bottom: 30,left:15),
                               alignment: Alignment.center,
                               child:  Container(
                               width: 200,
                                 child: Column(
                                   children: [
                                     Container(
                                       width: SizeConfig.screenWidth,
                                       height: 180,
                                       alignment: Alignment.center,
                                       padding: EdgeInsets.all(15.0),
                                       decoration: BoxDecoration(
                                           border: Border.all(color: Color(0xffE2E2E2),style:BorderStyle.solid ),
                                           borderRadius: BorderRadius.circular(20),
                                           color: ColorUtil.themeWhite
                                       ),
                                       child: Image.asset(MenuCategory[i]['CatgImg'],width: 100,fit: BoxFit.contain,),
                                     ),
                                     SizedBox(height: 30,),
                                     Text(MenuCategory[i]['Title'],style: TextStyle(fontFamily: 'RR',fontSize: 34,color: i==selectTopSale? Colors.white:Color(0xff959595))),
                                   ],
                                 ),
                               ),
                             ),
                           );
                      })
                      ),
                    ),
                  ],
                ),
              ),
              Stack(
                children: [
                  Container(
                    // color: Colors.blue,
                    width: SizeConfig.screenWidth!*0.7,
                    height: SizeConfig.screenHeight,
                    padding:EdgeInsets.all(15),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                            width: SizeConfig.screenWidth,
                            height: 120,
                            child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Text('Choose',style: ts20(ColorUtil.themeBlack,fontsize: 34,fontfamily: 'RM',fontWeight:FontWeight.w600),),
                                  SizedBox(width: 10,),
                                  Text('Order',style: ts20(ColorUtil.themeBlack.withOpacity(0.4),fontsize: 34,fontfamily: 'RR',fontWeight:FontWeight.w500),)
                                ],
                              ),
                              Row(
                                children: [
                                  Text('Dine-In',style: TextStyle(color:ColorUtil.themeBlack.withOpacity(0.9),fontSize: 34,fontFamily: 'RR'),textAlign: TextAlign.center,maxLines: 1,overflow: TextOverflow.ellipsis,),
                                  SizedBox(width: 5,),
                                  Icon(Icons.arrow_drop_down_sharp,color: ColorUtil.primary,size: 70,)
                                ],
                              ),
                            ],
                            ),
                        ),
                        SizedBox(height: 40,),
                        Container(
                        height: SizeConfig.screenHeight!-320,
                        width: SizeConfig.screenWidth,
                          child: ListView(
                            physics: BouncingScrollPhysics(),
                            shrinkWrap: true,
                            children: [
                              Align(
                                alignment: Alignment.center,
                                child: Visibility(

                                  child: Wrap(
                                    spacing: 20,
                                    runSpacing: 20,
                                    children: ItemList.asMap().map((key, value) => MapEntry(key, Container(
                                      child: GestureDetector(onTap:(){
                                        // if(key==0){
                                        //   fadeRoute(widget);
                                        // }
                                        // else if(key==1){
                                        //   fadeRoute(PayingPage());
                                        // }
                                      },
                                       child: Container(
                                          height: 270,
                                          width: SizeConfig.screenWidth!*0.20,
                                          //color: Colors.red,
                                          decoration: BoxDecoration(
                                            color: ColorUtil.themeWhite,
                                            borderRadius: BorderRadius.circular(8.0),
                                            // border: Border.all(color: value['ColorBox'])
                                          ),
                                          padding: EdgeInsets.only(left: 10,right: 10),
                                          //  margin: EdgeInsets.fromLTRB(0, 5, width*0.01, 5),
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              // Icon(value['icons'],color: value['ColorBox'],size: 50,),
                                              Container(
                                              width: 150,
                                              height: 130,
                                              alignment: Alignment.center,
                                              child:
                                              Stack(
                                                children: [
                                                  Align(
                                                  alignment: Alignment.center,
                                                    child: Container(
                                                    width: 120,
                                                    height: 120,
                                                      decoration: BoxDecoration(
                                                        color: ColorUtil.primary.withOpacity(0.2),
                                                       shape: BoxShape.circle
                                                        // border: Border.all(color: value['ColorBox'])
                                                      ),
                                                    ),
                                                  ),
                                                  Align(
                                                     alignment: Alignment.center,
                                                     child: Image.asset(value['icons'],width: 150,fit: BoxFit.fill,)
                                                     ),
                                                 Positioned(
                                                     right: 0,
                                                     top: 10,
                                                     child: key==1||key==12||key==7?Container(
                                                       width: 70,
                                                       height: 35,
                                                       alignment: Alignment.center,
                                                       decoration: BoxDecoration(
                                                           color: ColorUtil.primary,
                                                           borderRadius: BorderRadius.only(topRight:Radius.circular(25.0),bottomLeft: Radius.circular(25.0))
                                                         // border: Border.all(color: value['ColorBox'])
                                                       ),
                                                       child: Text('New',style: TextStyle(color:ColorUtil.themeWhite,fontSize: 24,fontFamily: 'RR'),textAlign: TextAlign.center,maxLines: 1,overflow: TextOverflow.ellipsis,),
                                                     ):Container(),
                                                   )
                                                ],
                                              )
                                              ),
                                              SizedBox(height: 10,),
                                              Text(value['Title'],style: TextStyle(color:ColorUtil.themeBlack,fontSize: 28,fontFamily: 'RR'),textAlign: TextAlign.center,maxLines: 1,overflow: TextOverflow.ellipsis,),SizedBox(height: 10,),
                                              SizedBox(height: 5,),
                                              Text('${MyConstants.rupeeString} ${value['Rate']}'.toString(),style: TextStyle(color:ColorUtil.themeBlack,fontSize: 28,fontFamily: 'RR'),textAlign: TextAlign.center,maxLines: 1,overflow: TextOverflow.ellipsis,),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ))).values.toList(),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 20,),
                            ],
                          ),
                        ),
                        GestureDetector(
                          onTap: (){
                            isCartOpen.value=true;
                          },
                          child: Container(
                            width: SizeConfig.screenWidth,
                            height: 130,
                            padding: EdgeInsets.only(left: 40,right: 40),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                color: ColorUtil.primary,
                                borderRadius: BorderRadius.circular(25.0)
                            ),
                            child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Text('Items',style: TextStyle(color:ColorUtil.themeWhite,fontSize: 38,fontFamily: 'RR'),textAlign: TextAlign.center,maxLines: 1,overflow: TextOverflow.ellipsis,),
                                    SizedBox(width: 5,),
                                    Text('23',style: TextStyle(color:ColorUtil.themeWhite,fontSize: 38,fontFamily: 'RM'),textAlign: TextAlign.center,maxLines: 1,overflow: TextOverflow.ellipsis,),
                                  ],
                                ),
                                Text('Tab to view full details',style: TextStyle(color:ColorUtil.themeWhite,fontSize: 14,fontFamily: 'RR'),textAlign: TextAlign.center,maxLines: 1,overflow: TextOverflow.ellipsis,),
                              ],
                              ),
                              Row(
                                children: [
                                  Text('Total Amount',style: TextStyle(color:ColorUtil.themeWhite,fontSize: 38,fontFamily: 'RR'),textAlign: TextAlign.center,maxLines: 1,overflow: TextOverflow.ellipsis,),
                                  SizedBox(width: 10,),
                                  Text('${MyConstants.rupeeString}2800.00',style: TextStyle(color:ColorUtil.themeWhite,fontSize: 38,fontFamily: 'RB'),textAlign: TextAlign.center,maxLines: 1,overflow: TextOverflow.ellipsis,),
                                ],
                              ),
                            ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Obx(() =>
                      AnimatedContainer(
                        duration: MyConstants.animeDuration,
                        width: SizeConfig.screenWidth!*0.7,
                        height: SizeConfig.screenHeight,
                        padding:EdgeInsets.all(15),
                        transform: Matrix4.translationValues(0, isCartOpen.value?0:SizeConfig.screenHeight!, 0),
                        color: ColorUtil.theme,
                       child: Column(
                        children: [
                          Container(
                            width: SizeConfig.screenWidth,
                            height: 120,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Text('My Orders',style: ts20(ColorUtil.themeBlack,fontsize: 34,fontfamily: 'RM',fontWeight:FontWeight.w600),),
                                    SizedBox(width: 10,),
                                    Text('Dine-In',style: ts20(ColorUtil.themeBlack.withOpacity(0.4),fontsize: 34,fontfamily: 'RR',fontWeight:FontWeight.w500),)
                                  ],
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Row(
                                      children: [
                                        Text('Order Id',style: TextStyle(color:ColorUtil.themeBlack.withOpacity(0.4),fontSize: 34,fontFamily: 'RR'),textAlign: TextAlign.center,maxLines: 1,overflow: TextOverflow.ellipsis,),
                                        SizedBox(width: 5,),
                                        Text('#5676767',style: TextStyle(color:ColorUtil.primary,fontSize: 34,fontFamily: 'RM'),textAlign: TextAlign.center,maxLines: 1,overflow: TextOverflow.ellipsis,),
                                      ],
                                    ),
                                    Text('06-07-2023 / 06:30 AM',style: TextStyle(color:ColorUtil.themeBlack.withOpacity(0.4),fontSize: 24,fontFamily: 'RR'),textAlign: TextAlign.center,maxLines: 1,overflow: TextOverflow.ellipsis,),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Container(
                            height: SizeConfig.screenHeight!-293,
                            width: SizeConfig.screenWidth,
                            padding: EdgeInsets.all(25.0),
                            margin: EdgeInsets.only(bottom: 13),
                            decoration: BoxDecoration(
                              color: ColorUtil.themeWhite,
                              borderRadius: BorderRadius.only(topLeft: Radius.circular(25),
                                  bottomLeft: Radius.circular(25),bottomRight: Radius.circular(25))
                            ),
                            child: Column(
                             crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    ArrowBack(
                                      onTap: (){
                                        isCartOpen.value=false;
                                      },
                                    ),
                                    SizedBox(width:120 ,),
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Text('We will provide you',style: TextStyle(color:ColorUtil.themeBlack,fontSize: 34,fontFamily: 'RR'),textAlign: TextAlign.center,maxLines: 1,overflow: TextOverflow.ellipsis,),
                                        SizedBox(height: 5,),
                                        Text('Quality Food Soon',style: TextStyle(color:ColorUtil.themeBlack.withOpacity(0.4),fontSize: 24,fontFamily: 'RR'),textAlign: TextAlign.center,maxLines: 1,overflow: TextOverflow.ellipsis,),
                                      ],
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 20,),
                                Container(
                                  padding: const EdgeInsets.only(left:10.0),
                                  height: SizeConfig.screenHeight!-436,
                                  width: SizeConfig.screenWidth,
                                  child: ListView.builder(
                                      scrollDirection: Axis.vertical,
                                      itemCount: CartList.length,
                                      itemBuilder: ((ctx,i){
                                        return GestureDetector(
                                          onTap: (){
                                            setState(() {
                                              selectCart=i;
                                            });
                                          },
                                          child: Container(
                                            width: SizeConfig.screenWidth,
                                            height: 150,
                                            decoration:BoxDecoration(
                                              border: Border(bottom: BorderSide(color: ColorUtil.themeBlack.withOpacity(0.2),style: BorderStyle.solid),),
                                            ) ,
                                            margin: EdgeInsets.only(right: 10,top: i==0?0:20,bottom: 10,left:0),
                                            padding: EdgeInsets.only(right: 15,top: 15,bottom: 30,left:15),
                                            child:  Row(
                                              children: [
                                                Container(
                                                    width: 150,
                                                    height: 130,
                                                    alignment: Alignment.center,
                                                    child:
                                                    Stack(
                                                      children: [
                                                        Align(
                                                          alignment: Alignment.center,
                                                          child: Container(
                                                            width: 120,
                                                            height: 120,
                                                            decoration: BoxDecoration(
                                                                color: ColorUtil.primary.withOpacity(0.2),
                                                                shape: BoxShape.circle
                                                              // border: Border.all(color: value['ColorBox'])
                                                            ),
                                                          ),
                                                        ),
                                                        Align(
                                                            alignment: Alignment.center,
                                                            child: Image.asset(CartList[i]['icons'],width: 150,fit: BoxFit.fill,)
                                                        ),
                                                      ],
                                                    )
                                                ),
                                                SizedBox(width: 30,),
                                                Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    SizedBox(height: 10,),
                                                    Text(CartList[i]['Title'],style: TextStyle(color:ColorUtil.themeBlack,fontSize: 28,fontFamily: 'RR'),textAlign: TextAlign.center,maxLines: 1,overflow: TextOverflow.ellipsis,),SizedBox(height: 10,),
                                                    SizedBox(height: 5,),
                                                    Text('${MyConstants.rupeeString} ${CartList[i]['Rate']}'.toString(),style: TextStyle(color:ColorUtil.themeBlack,fontSize: 28,fontFamily: 'RR'),textAlign: TextAlign.center,maxLines: 1,overflow: TextOverflow.ellipsis,),
                                                  ],
                                                ),
                                                Spacer(),
                                                Container(
                                                  height: 40,
                                                  width: SizeConfig.screenWidth!*0.20,
                                                  child: Row(
                                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                    children: [
                                                      addRemoveBtn(Icon(Icons.remove,color: ColorUtil.themeWhite,size: 30,),),
                                                      Text('1',style: ts20(ColorUtil.themeBlack,fontsize: 34),),
                                                      addRemoveBtn(Icon(Icons.add,color: ColorUtil.themeWhite,size: 30,),)


                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        );
                                      })
                                  ),
                                ),
                              ],
                            ),
                          ),
                          GestureDetector(
                            onTap: (){
                              isCartOpen.value=false;
                              isPay.value=true;
                            },
                            child: Container(
                              width: SizeConfig.screenWidth,
                              height: 130,
                              padding: EdgeInsets.only(left: 40,right: 40),
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  color: ColorUtil.primary,
                                  borderRadius: BorderRadius.circular(25.0)
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Text('Items',style: TextStyle(color:ColorUtil.themeWhite,fontSize: 38,fontFamily: 'RR'),textAlign: TextAlign.center,maxLines: 1,overflow: TextOverflow.ellipsis,),
                                          SizedBox(width: 5,),
                                          Text('23',style: TextStyle(color:ColorUtil.themeWhite,fontSize: 38,fontFamily: 'RM'),textAlign: TextAlign.center,maxLines: 1,overflow: TextOverflow.ellipsis,),
                                        ],
                                      ),
                                      Text('Tab to view full details',style: TextStyle(color:ColorUtil.themeWhite,fontSize: 14,fontFamily: 'RR'),textAlign: TextAlign.center,maxLines: 1,overflow: TextOverflow.ellipsis,),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text('Pay',style: TextStyle(color:ColorUtil.themeWhite,fontSize: 38,fontFamily: 'RR'),textAlign: TextAlign.center,maxLines: 1,overflow: TextOverflow.ellipsis,),
                                      SizedBox(width: 10,),
                                      Text('${MyConstants.rupeeString}2800.00',style: TextStyle(color:ColorUtil.themeWhite,fontSize: 38,fontFamily: 'RB'),textAlign: TextAlign.center,maxLines: 1,overflow: TextOverflow.ellipsis,),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                       ),
                      )
                  ),
                  Obx(() =>
                      AnimatedContainer(
                        duration: MyConstants.animeDuration,
                        width: SizeConfig.screenWidth!*0.7,
                        height: SizeConfig.screenHeight,
                        padding:EdgeInsets.all(15),
                        transform: Matrix4.translationValues(0, isPay.value?0:SizeConfig.screenHeight!, 0),
                        color: ColorUtil.theme,
                        child: Column(
                          children: [
                            Container(
                              width: SizeConfig.screenWidth,
                              height: 120,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Text('Payment',style: ts20(ColorUtil.themeBlack,fontsize: 34,fontfamily: 'RM',fontWeight:FontWeight.w600),),
                                      SizedBox(width: 10,),
                                      Text('Final',style: ts20(ColorUtil.themeBlack.withOpacity(0.4),fontsize: 34,fontfamily: 'RR',fontWeight:FontWeight.w500),)
                                    ],
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Row(
                                        children: [
                                          Text('Order Id',style: TextStyle(color:ColorUtil.themeBlack.withOpacity(0.4),fontSize: 34,fontFamily: 'RR'),textAlign: TextAlign.center,maxLines: 1,overflow: TextOverflow.ellipsis,),
                                          SizedBox(width: 5,),
                                          Text('#5676767',style: TextStyle(color:ColorUtil.primary,fontSize: 34,fontFamily: 'RM'),textAlign: TextAlign.center,maxLines: 1,overflow: TextOverflow.ellipsis,),
                                        ],
                                      ),
                                      Text('06-07-2023 / 06:30 AM',style: TextStyle(color:ColorUtil.themeBlack.withOpacity(0.4),fontSize: 24,fontFamily: 'RR'),textAlign: TextAlign.center,maxLines: 1,overflow: TextOverflow.ellipsis,),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              height: SizeConfig.screenHeight!-293,
                              width: SizeConfig.screenWidth,
                              padding: EdgeInsets.all(25.0),
                              margin: EdgeInsets.only(bottom: 13),
                              decoration: BoxDecoration(
                                  color: ColorUtil.themeWhite,
                                  borderRadius: BorderRadius.only(topLeft: Radius.circular(25),
                                  bottomLeft:Radius.circular(25),bottomRight: Radius.circular(25), )
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      ArrowBack(
                                        onTap: (){
                                          isPay.value=false;
                                        },
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 20,),
                                  Container(
                                    padding: const EdgeInsets.only(left:10.0),
                                    height: SizeConfig.screenHeight!-423,
                                    width: SizeConfig.screenWidth,
                                    child:ListView(
                                    children: [
                                      Container(
                                          height: 500,
                                        child: Image.asset('assets/kiosk/paymnt-img.png',fit: BoxFit.contain,),
                                      ),
                                      const SizedBox(height:30,),
                                      Text('Your payment Amount',style: TextStyle(color:ColorUtil.themeBlack,fontSize: 38,fontFamily: 'RB'),textAlign: TextAlign.center,maxLines: 1,overflow: TextOverflow.ellipsis,),
                                      const SizedBox(height:30,),
                                      Align(
                                         child: Container(
                                          width: 300,
                                          height: 100,
                                          alignment: Alignment.center,
                                          decoration: BoxDecoration(
                                          color: ColorUtil.themeBlack.withOpacity(0.1)
                                          ),
                                          child: Text('${MyConstants.rupeeString}2800.00',style: TextStyle(color:ColorUtil.primary,fontSize: 44,fontFamily: 'RB'),textAlign: TextAlign.center,maxLines: 1,overflow: TextOverflow.ellipsis,),
                                        ),
                                      ),
                                      const SizedBox(height:200,),
                                       Align(
                                        child: Image.asset('assets/kiosk/QRcode.png',fit: BoxFit.contain,width: 250,),
                                      ),
                                      Text('SCAN AND PAY',style: TextStyle(color:ColorUtil.themeBlack,fontSize: 28,fontFamily: 'RM'),textAlign: TextAlign.center,maxLines: 1,overflow: TextOverflow.ellipsis,),
                                    ],
                                    )
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              width: SizeConfig.screenWidth,
                              height: 130,
                              alignment: Alignment.center,
                              clipBehavior: Clip.antiAlias,
                              decoration: BoxDecoration(
                                  color: Color(0XFFF0F0F0),
                                  borderRadius: BorderRadius.circular(25.0)
                              ),
                              child: Row(
                                children: [
                                  Container(
                                  width:SizeConfig.screenWidth!*0.33,
                                  height: 130,
                                      decoration: BoxDecoration(
                                          color: ColorUtil.primary,
                                          borderRadius: BorderRadius.circular(25.0)
                                      ),
                                  alignment: Alignment.center,
                                  child: Text('Pay UPI ',style: TextStyle(color:ColorUtil.themeWhite,fontSize: 38,fontFamily: 'RR'),)
                                  ),
                                  Container(
                                  width:SizeConfig.screenWidth!*0.33,
                                  height: 130,
                                  alignment: Alignment.center,
                                  child: Text('Card',style: TextStyle(color:ColorUtil.themeBlack,fontSize: 38,fontFamily: 'RR'),),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      )
                  )
                ],
              ),
            ],
          ) ,
        ),
      ),
    ) ;
  }
}
addRemoveBtn(Widget icon,{VoidCallback? onTap}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      height: 40,
      width: 50,
      decoration: BoxDecoration(
          color: ColorUtil.primary, borderRadius: BorderRadius.circular(15)),
      child: Center(
        child: icon,
      ),
    ),
  );
}
