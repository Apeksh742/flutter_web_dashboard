import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_web_dashboard/constants/controller.dart';
import 'package:flutter_web_dashboard/constants/style.dart';
import 'package:flutter_web_dashboard/helpers/responsiveness.dart';
import 'package:flutter_web_dashboard/pages/authentication/authentication.dart';
import 'package:flutter_web_dashboard/routing/routes.dart';
import 'package:flutter_web_dashboard/widgets/custom_text.dart';
import 'package:flutter_web_dashboard/widgets/side_menu_item.dart';
import 'package:get/get.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double _width = MediaQuery.of(context).size.width;
    return Container(
      color: light,
      child: ListView(
        children: [
          if (ResponsiveWidget.isSmallScreen(context))
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(
                  height: 40,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: _width / 48,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 12),
                      child: Image.asset(
                        "icons/logo.png",
                      ),
                    ),
                    Flexible(
                        child: CustomText(
                            text: "Dash",
                            size: 20,
                            weight: FontWeight.bold,
                            color: active)),
                    SizedBox(
                      width: _width / 48,
                    ),
                  ],
                ),
              ],
            ),
          const SizedBox(
            height: 40,
          ),
          Divider(
            color: lightGrey.withOpacity(.1),
          ),
          Column(
              mainAxisSize: MainAxisSize.min,
              children: sideMenuItems
                  .map((MenuItem menuItem) => SideMenuItem(
                        itemName: menuItem.name,
                        onTap: () {
                          if (menuItem.route == authenticationPagePageRoute) {
                            menuController
                                .changeActiveItemto(overViewPageDisplayName);
                            
                            Get.offAllNamed(authenticationPagePageRoute);
                          }
                          if (!menuController.isActive(menuItem.name)) {
                            if(menuItem.name!=authenticationPageDisplayName)
                            {menuController.changeActiveItemto(menuItem.name);}
                            if (ResponsiveWidget.isSmallScreen(context)) {
                              Get.back();
                            }
                            navigationController.navigateTo(menuItem.route);
                          }
                        },
                      ))
                  .toList())
        ],
      ),
    );
  }
}
