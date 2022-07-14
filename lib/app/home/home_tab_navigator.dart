// package imports
import 'package:flutter/material.dart';

// application imports
import 'home_tab_item.dart';
import 'pages/blue/blue_list_page.dart';
import 'pages/green/green_list_page.dart';
import 'pages/red/red_list_page.dart';
import 'pages/colour/colour_list_page.dart';

// define navigator routes
class HomeTabNavigatorRoutes {
  static const String root = '/';
  static const String detail = '/detail';
}

// handle navigator routes
class HomeTabNavigator extends StatelessWidget {
  const HomeTabNavigator({required this.navigatorKey, required this.tabItem});
  final GlobalKey<NavigatorState>? navigatorKey;
  final TabItem tabItem;

  // define where each route takes you
  Map<String, WidgetBuilder> _routeBuilders(BuildContext context) {
    if (tabItem == TabItem.red) {
      return {
        HomeTabNavigatorRoutes.root: (context) => RedListPage(),
      };
    } else if (tabItem == TabItem.green) {
      return {
        HomeTabNavigatorRoutes.root: (context) => GreenListPage(),
      };
    } else if (tabItem == TabItem.blue) {
      return {
        HomeTabNavigatorRoutes.root: (context) => BlueListPage(),
      };
    } else if (tabItem == TabItem.colour) {
      return {
        HomeTabNavigatorRoutes.root: (context) => ColourListPage(),
      };
    } else {
      return {
        HomeTabNavigatorRoutes.root: (context) => RedListPage(),
      };
    }
  }

  @override
  Widget build(BuildContext context) {
    final routeBuilders = _routeBuilders(context);
    // build the navigator for each tab
    // initial root is the root of each tab
    return Navigator(
      key: navigatorKey,
      initialRoute: HomeTabNavigatorRoutes.root,
      onGenerateRoute: (routeSettings) {
        return MaterialPageRoute(
          builder: (context) => routeBuilders[routeSettings.name!]!(context),
        );
      },
    );
  }
}