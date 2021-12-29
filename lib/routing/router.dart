import 'package:flutter/material.dart';
import 'package:flutter_web_dashboard/pages/404/error_page.dart';
import 'package:flutter_web_dashboard/pages/authentication/authentication.dart';
import 'package:flutter_web_dashboard/pages/clients/clients.dart';
import 'package:flutter_web_dashboard/pages/drivers/drivers.dart';
import 'package:flutter_web_dashboard/pages/overview/overview.dart';
import 'package:flutter_web_dashboard/routing/routes.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    // case rootRoute
    //     return _getPageRoute()
    case overViewPageRoute:
      return _getPageRoute(OverviewPage());
    case driverPageRoute:
      return _getPageRoute(DriversPage());
    case clientsPageRoute:
      return _getPageRoute(ClientsPage());
    case authenticationPagePageRoute:
      return _getPageRoute(AuthenticationPage());
    default:
      return _getPageRoute(PageNotFound());
  }
}

PageRoute _getPageRoute(Widget child) {
  return MaterialPageRoute(builder: (context) => child);
}
