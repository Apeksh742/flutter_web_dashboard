import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_web_dashboard/constants/style.dart';
import 'package:flutter_web_dashboard/helpers/shared_preferences.dart';
import 'package:flutter_web_dashboard/routing/routes.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({ Key? key }) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    checkLogInStatus();
  }

  checkLogInStatus()async{
    log("Splash screen callled");
    final bool status = await LocalStorage().getLogInStatus();
    if(status){
      Get.offAllNamed(rootRoute);
    }
    else{
      Get.offAllNamed(authenticationPagePageRoute);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(active),)
    );
  }
}