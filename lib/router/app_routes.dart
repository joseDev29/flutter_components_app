import 'package:flutter/material.dart';

import 'package:components_app/models/models.dart';
import 'package:components_app/views/views.dart';

abstract class RouteKeys {
  static const home = 'home';
  static const listViewBasic = 'listViewBasic';
  static const listViewSeparated = 'listViewSeparated';
  static const card = 'card';
  static const alert = 'alert';
}

abstract class AppRouter {
  static const initialRoute = RouteKeys.home;

  static final List<RouteItem> routes = [
    RouteItem(
        route: RouteKeys.home,
        icon: Icons.home,
        name: 'Home',
        hidden: true,
        widget: const HomeView()),
    RouteItem(
        route: RouteKeys.listViewBasic,
        icon: Icons.list,
        name: 'List view basic',
        widget: ListViewBasicView()),
    RouteItem(
        route: RouteKeys.listViewSeparated,
        icon: Icons.list_alt,
        name: 'List view separated',
        widget: ListViewSeparatedView()),
    RouteItem(
        route: RouteKeys.card,
        icon: Icons.credit_card,
        name: 'Card',
        widget: const CardView()),
    RouteItem(
      route: RouteKeys.alert,
      icon: Icons.notifications_outlined,
      name: "Alert",
      widget: const AlertView(),
    )
  ];

  static List<RouteItem> getMenuRoutes() {
    return routes.where((routeItem) => !routeItem.hidden).toList();
  }

  static RouteItem? getRouteByKey(String routeKey) {
    return routes.singleWhere((routeItem) => routeItem.route == routeKey);
  }

  static Map<String, Widget Function(BuildContext)> getAppRoutes() {
    final entries = routes.map((routeItem) {
      return MapEntry(routeItem.route, (context) => routeItem.widget);
    });
    return Map.fromEntries(entries);
  }

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    final appRoutes = getAppRoutes();
    return MaterialPageRoute(builder: appRoutes[RouteKeys.home]!);
  }
}
