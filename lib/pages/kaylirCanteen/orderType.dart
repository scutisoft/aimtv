import '/utils/sizeLocal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../utils/colorUtil.dart';
import '../../utils/constants.dart';
import 'homePage.dart';




/*
class KaylirWebView extends StatefulWidget {
  const KaylirWebView({Key? key}) : super(key: key);

  @override
  State<KaylirWebView> createState() => _KaylirWebViewState();
}

class _KaylirWebViewState extends State<KaylirWebView> {
  late final WebViewController _controller;

@override
void initState(){
  _controller = WebViewController()
    ..setJavaScriptMode(JavaScriptMode.unrestricted)
    ..setBackgroundColor(const Color(0x00000000))
    ..setNavigationDelegate(
      NavigationDelegate(
        onProgress: (int progress) {
          // Update loading bar.
        },
        onPageStarted: (String url) {},
        onPageFinished: (String url) {},
        onWebResourceError: (WebResourceError error) {},
        onNavigationRequest: (NavigationRequest request) {
          if (request.url.startsWith('https://www.youtube.com/')) {
            return NavigationDecision.prevent;
          }
          return NavigationDecision.navigate;
        },
      ),
    )
    ..loadRequest(Uri.parse('https://restapos.in/billing/Billing/QRMENUPAGE?a=NDJfMV8yX251bGw='));
super.initState();
}

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child:  Scaffold(
      body: Container(
        height: SizeConfig.screenHeight,
        width: SizeConfig.screenWidth,
      child:  WebViewWidget(controller: _controller),),
      ),
    );
  }
}
*/


class OrderTypePage extends StatefulWidget {
  const OrderTypePage({Key? key}) : super(key: key);

  @override
  State<OrderTypePage> createState() => _OrderTypePageState();
}

class _OrderTypePageState extends State<OrderTypePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: MyConstants.bottomSafeArea,
    child: Scaffold(
      backgroundColor: ColorUtil.themeWhite,
      body: SizedBox(
      width: SizeConfig.screenWidth,
      height: SizeConfig.screenHeight,
      child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
          SizedBox(height: 30,),
          Image.asset('assets/Kaylir/logo.png',width: 200,),
          SizedBox(height: 120,),
          GestureDetector(
          onTap: (){
              fadeRoute(HomePage());
          },
          child: OrdertypeSelect(SvgPicture.asset('assets/Kaylir/Kaylir-Dinein.svg',) ,'Dine-in')
          ),
          SizedBox(height: 80,),
          GestureDetector(
          onTap: (){
            // fadeRoute(widget)
          },
          child: OrdertypeSelect(SvgPicture.asset('assets/Kaylir/Kaylir-Takeaway.svg',) ,'Takeaway')
          ),
      ],
      ),
      ),
    ),
    );
  }
  Widget OrdertypeSelect(Widget OrdTypeImg , String OrdType){
  return Column(
    children: [
      Container(
        width: 100,
        height: 100,
        padding: EdgeInsets.all(22),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color:ColorUtil.primary,
        ),
        child:OrdTypeImg ,
      ),
      SizedBox(
        height: 10,),
      Text(OrdType,style: ts20(ColorUtil.text1,fontfamily: 'RM',fontsize: 26))
    ],
  );
  }
}
