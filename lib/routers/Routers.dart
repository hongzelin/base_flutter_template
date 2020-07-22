/*
 * Author: lin.zehong 
 * Date: 2020-07-21 21:12:26 
 * Desc: 路由统一处理
 */
import 'package:base_flutter_template/pages/home/add/home_add_view.dart';
import 'package:flutter/material.dart';
import '../tabs/Tabs.dart';

final Map<String, Function> routes = {
  '/': (context) => TabsPage(),
  '/add': (context, {arguments}) => HomeAdd(arguments: arguments),
  // '/registerFirst': (context) => RegisterFirstPage(),
};

// 统一处理
var onGenerateRoute = (RouteSettings settings) {
  final String name = settings.name;
  final Function pageContentBuilder = routes[name];
  if (pageContentBuilder != null) {
    if (settings.arguments != null) {
      final Route route = MaterialPageRoute(
          builder: (context) =>
              pageContentBuilder(context, arguments: settings.arguments));
      return route;
    } else {
      final Route route =
          MaterialPageRoute(builder: (context) => pageContentBuilder(context));
      return route;
    }
  }
};
