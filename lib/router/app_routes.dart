import 'package:components_app/views/slider_screen.dart';
import 'package:flutter/material.dart';

import 'package:components_app/models/models.dart';
import 'package:components_app/views/views.dart';

abstract class RouteKeys {
  static const home = 'home';
  static const listViewBasic = 'listViewBasic';
  static const listViewSeparated = 'listViewSeparated';
  static const card = 'card';
  static const alert = 'alert';
  static const avatar = 'avatar';
  static const animated = 'animated';
  static const inputs = 'inputs';
  static const slider = 'slider';
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
    ),
    RouteItem(
      route: RouteKeys.avatar,
      icon: Icons.account_circle_outlined,
      name: 'Avatar',
      widget: const AvatarView(),
    ),
    RouteItem(
      route: RouteKeys.animated,
      icon: Icons.play_circle_outline,
      name: 'Animated container',
      widget: const AnimatedView(),
    ),
    RouteItem(
      route: RouteKeys.inputs,
      icon: Icons.input_outlined,
      name: 'Inputs',
      widget: const InputsView(),
    ),
    RouteItem(
      route: RouteKeys.slider,
      icon: Icons.tune_outlined,
      name: 'Slider & Checks',
      widget: const SliderView(),
    ),
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
