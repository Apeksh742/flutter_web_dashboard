import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_web_dashboard/constants/controller.dart';
import 'package:flutter_web_dashboard/constants/style.dart';
import 'package:flutter_web_dashboard/helpers/responsiveness.dart';
import 'package:get/get.dart';

import 'custom_text.dart';

AppBar topNavigationBar(BuildContext ctx, GlobalKey<ScaffoldState> key) {
  return AppBar(
    elevation: 0,
    leading: !ResponsiveWidget.isSmallScreen(ctx)
        ? Row(
            children: [
              Container(
                padding: const EdgeInsets.only(left: 14),
                child: Image.asset(
                  "icons/logo.png",
                  width: 28,
                ),
              ),
            ],
          )
        : IconButton(
            onPressed: () => key.currentState?.openDrawer(),
            icon: const Icon(Icons.menu)),
    title: Row(
      children: [
        Visibility(
            child: CustomText(
          text: "Dash",
          color: lightGrey,
          size: 20,
          weight: FontWeight.bold,
        )),
        Expanded(child: SizedBox()),
        IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.settings,
              color: dark.withOpacity(.7),
            )),
        Stack(children: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.notifications,
                color: dark.withOpacity(.7),
              )),
          Positioned(
              top: 7,
              right: 7,
              child: Container(
                padding: const EdgeInsets.all(4),
                width: 12,
                height: 12,
                decoration: BoxDecoration(
                    color: active,
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(color: light, width: 2)),
              ))
        ]),
        Container(
          width: 1,
          height: 22,
          color: lightGrey,
        ),
        const SizedBox(
          width: 24,
        ),
        Obx(() {
          return CustomText(
            text: userController.user.value.email,
            color: lightGrey,
          );
        }),
        const SizedBox(
          width: 16,
        ),
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(30),
          ),
          child: Container(
            padding: const EdgeInsets.all(2),
            margin: const EdgeInsets.all(2),
            child: CircleAvatar(
              backgroundColor: light,
              child: Icon(
                Icons.person_outline,
                color: dark,
              ),
            ),
          ),
        )
      ],
    ),
    iconTheme: IconThemeData(
      color: dark,
    ),
    backgroundColor: Colors.transparent,
  );
}
