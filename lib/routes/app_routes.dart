import 'package:ambitionguru_task/presentation/hierarchy/hierarchy_screen.dart';
import 'package:ambitionguru_task/presentation/home_screen.dart';
import 'package:ambitionguru_task/presentation/main_screen.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static const String initialRoute = '/initialRoute';
  static const String homeScreen = '/homeScreen';
  static const String hierarchyfinder = '/hierarchyfinder';
  static const String platformchannel = '/platformchannel';

  static Map<String, WidgetBuilder> routes = {
    initialRoute: (context) => const MainScreen(),
    homeScreen: (context) => const HomeScreen(),
    hierarchyfinder: (context) => const HierarchyScreen()
    // platformchannel: (context) => const HomeScreen()
  };
}
