import 'package:flutter/material.dart';
import 'package:flutter_web_dashboard/constants/style.dart';
import 'package:flutter_web_dashboard/routing/routes.dart';
import 'package:get/get.dart';

class MenuController extends GetxController{
  static MenuController instance = Get.find();
  var activeItem =  overViewPageRoute.obs;
  var hoverItem = "".obs;

  changeActiveItemto(String itemName){
    activeItem.value=itemName;
  }

  bool isActive(String itemName) => itemName == activeItem.value;

  onHover(String itemName){
    if (!isActive(itemName)) hoverItem.value = itemName;
  }

  bool isHovering(String itemName) => itemName == hoverItem.value;

  Widget returnIconFor(String itemName){
    switch (itemName) {
      case overViewPageRoute:
         return _customIcon(Icons.trending_up, itemName);
      case driverPagePageRoute:
        return _customIcon(Icons.drive_eta, itemName);
      case clientsPageRoute:
        return _customIcon(Icons.people_alt_outlined,itemName);
      case authenticationPagePageRoute:
        return _customIcon(Icons.exit_to_app, itemName); 
      default:
        return _customIcon(Icons.exit_to_app, itemName);
    }
  }

  Widget _customIcon(IconData icon, String itemName){
    if(isActive(itemName)) { return Icon(icon, size: 22, color: dark,);}
    return Icon(icon, color: isHovering(itemName)?dark:lightGrey,);
  }
}