import 'dart:io';

import 'package:flutter_webview_pro/webview_flutter.dart';

import '/utils/sizeLocal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../utils/colorUtil.dart';
import '../../utils/constants.dart';


class SirpiWebView extends StatefulWidget {
  const SirpiWebView({Key? key}) : super(key: key);

  @override
  State<SirpiWebView> createState() => _SirpiWebViewState();
}

class _SirpiWebViewState extends State<SirpiWebView> {

  //Student https://s3.amazonaws.com/student.com/view/Student/login-latest.html
  //Mentor  https://s3.amazonaws.com/sirpimentor.com/view/login-latest.html

  late final WebViewController _controller;
  String url='https://s3.amazonaws.com/student.com/view/Student/login-latest.html';
  @override
  void initState(){
    if (Platform.isAndroid) WebView.platform = AndroidWebView();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
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
    );
  }
}