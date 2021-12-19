import 'package:flutter/material.dart';
import 'package:flutter_web_dashboard/controllers/menu_controller.dart';
import 'package:flutter_web_dashboard/controllers/navigation_controller.dart';
import 'package:flutter_web_dashboard/layout.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

void main(List<String> args) {
  
  runApp(
    const MyApp(),);
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(MenuController());
    Get.put(NavigationController());
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Dash',
      theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
          textTheme: GoogleFonts.mulishTextTheme(Theme.of(context).textTheme)
              .apply(bodyColor: Colors.black),
              pageTransitionsTheme:const PageTransitionsTheme(
                builders: {
                  TargetPlatform.iOS :  FadeUpwardsPageTransitionsBuilder(),
                  TargetPlatform.android:  FadeUpwardsPageTransitionsBuilder(),
                }
              ),
              primaryColor: Colors.blue,
              ),
      home: SiteLayout(),
    );
  }
}
