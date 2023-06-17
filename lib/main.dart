import 'package:aimtv/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'maOrganicsPages/splashScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: MyConstants.appName,
      //Aim TV
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
     // home: const SplashScreen(),
     // home: const AnandhamSplashScreen(),
      //home: const SirpiSplashScreen(),
      home: const MaOrganicsSplashScreen(),
    );
  }
}
