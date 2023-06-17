import 'dart:io';
import 'package:flutter_webview_pro/webview_flutter.dart';
import '../widgets/alertDialog.dart';
import '/utils/sizeLocal.dart';
import 'package:flutter/material.dart';



class MaOrganicsWebView extends StatefulWidget {
  const MaOrganicsWebView({Key? key}) : super(key: key);

  @override
  State<MaOrganicsWebView> createState() => _MaOrganicsWebViewState();
}

class _MaOrganicsWebViewState extends State<MaOrganicsWebView> {

  //Student https://s3.amazonaws.com/student.com/view/Student/login-latest.html
  //Mentor  https://s3.amazonaws.com/sirpimentor.com/view/login-latest.html

  late final WebViewController _controller;
  String url='http://maorganics.in/Login/SignIn';
  @override
  void initState(){
    if (Platform.isAndroid) WebView.platform = AndroidWebView();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        return CustomAlert(
            cancelCallback: (){},
            callback: (){

            }
        ).exitAppAlert("assets/icons/power-on.png", "Are you sure want to exit the app ?", false);
      },
      child: SafeArea(
        child:  Scaffold(
          body: Container(
            height: SizeConfig.screenHeight,
            width: SizeConfig.screenWidth,
            child:  WebView(
              initialUrl: url,
              javascriptMode: JavascriptMode.unrestricted,
              allowsInlineMediaPlayback: true,
              onWebResourceError: (E){

              },
            )
            ),
        ),
      ),
    );
  }
}