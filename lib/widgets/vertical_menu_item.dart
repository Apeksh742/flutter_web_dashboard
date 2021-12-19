import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_web_dashboard/constants/controller.dart';
import 'package:flutter_web_dashboard/constants/style.dart';
import 'package:flutter_web_dashboard/widgets/custom_text.dart';
import 'package:get/state_manager.dart';

class VerticalSideMenu extends StatelessWidget {
  final String? itemName;
  final Function? onTap;
  const VerticalSideMenu({Key? key, this.itemName, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        if(onTap!=null){
          onTap!();
        }
      },
      onHover: (value) {
        value
            ? menuController.onHover(itemName ?? '')
            : menuController.onHover("not hovering");
      },
      child: Obx(() => Container(
            color: menuController.isHovering(itemName ?? '')
                ? lightGrey.withOpacity(.1)
                : Colors.transparent,
            child: Row(
              children: [
                Visibility(
                  visible: menuController.isHovering(itemName ?? '') ||
                      menuController.isActive(itemName ?? ''),
                  child: Container(
                    height: 72,
                    width: 3,
                    color: dark,
                  ),
                ),
                Expanded(
                    child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: menuController.returnIconFor(itemName ?? ''),
                    ),
                    if (!menuController.isActive(itemName ?? ""))
                      Flexible(
                          child: CustomText(
                        text: itemName,
                        color: menuController.isHovering(itemName ?? "")
                            ? dark
                            : lightGrey,
                      ))
                    else
                      Flexible(
                          child: CustomText(
                        text: itemName,
                        color: dark,
                        size: 18,
                        weight: FontWeight.bold,
                      ))
                  ],
                ))
              ],
            ),
          )),
    );
  }
}
