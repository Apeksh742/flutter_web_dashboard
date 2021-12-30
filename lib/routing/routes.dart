const rootRoute = "/home";
const overViewPageDisplayName = "Overview";
const overViewPageRoute = "/overview";
const driverPageDisplayName = "Drivers";
const driverPageRoute = "/drivers";
const clientsPageDisplayName = "Clients";
const clientsPageRoute = "/clients";
const authenticationPageDisplayName = "Log out";
const authenticationPagePageRoute = "/auth";
const splashScreenRoute = '/splash';
const splashScreenDisplayName = 'splash';

class MenuItem {
  final String name;
  final String route;

  MenuItem(this.name, this.route);
}

List<MenuItem> sideMenuItems = [
  MenuItem(overViewPageDisplayName, overViewPageRoute),
  MenuItem(driverPageDisplayName, driverPageRoute),
  MenuItem(clientsPageDisplayName, clientsPageRoute),
  MenuItem(authenticationPageDisplayName, authenticationPagePageRoute),
];
