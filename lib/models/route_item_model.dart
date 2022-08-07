import 'package:flutter/material.dart' show Widget, IconData;

class RouteItem {
  final String route;
  final IconData icon;
  final String name;
  final Widget widget;
  final bool hidden;

  RouteItem({
    required this.route,
    required this.icon,
    required this.name,
    required this.widget,
    bool? hidden,
  }) : hidden = hidden ?? false;
}
