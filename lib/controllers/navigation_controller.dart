import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class NavigationController extends GetxController{
  static NavigationController instance = Get.find();
  final GlobalKey<NavigatorState> navigationKey = GlobalKey();

  Future<Object?>? navigateTo(String routeName, {Object? args}){
    return navigationKey.currentState?.pushNamed(routeName, arguments: args);
  }

  goBack()=> navigationKey.currentState?.pop();
}