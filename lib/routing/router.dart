import 'package:flutter/material.dart';
import 'package:flutter_web_dashboard/pages/authentication/authentication.dart';
import 'package:flutter_web_dashboard/pages/clients/clients.dart';
import 'package:flutter_web_dashboard/pages/drivers/drivers.dart';
import 'package:flutter_web_dashboard/pages/overview/overview.dart';
import 'package:flutter_web_dashboard/routing/routes.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case overViewPageRoute:
      return _getPageRoute(OverviewPage());
    case driverPagePageRoute:
      return _getPageRoute(DriversPage());
    case clientsPageRoute:
      return _getPageRoute(ClientsPage());
    case authenticationPagePageRoute:
      return _getPageRoute(AuthenticationPage());
    default:
      return _getPageRoute(OverviewPage());
  }
}

PageRoute _getPageRoute(Widget child) {
  return MaterialPageRoute(builder: (context) => child);
}
