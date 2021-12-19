import 'package:flutter/material.dart';
import 'package:flutter_web_dashboard/constants/controller.dart';
import 'package:flutter_web_dashboard/routing/router.dart';
import 'package:flutter_web_dashboard/routing/routes.dart';

Navigator localNavigator()=> Navigator(
  key: navigationController.navigationKey,
  initialRoute: overViewPageRoute,
  onGenerateRoute: generateRoute,
);