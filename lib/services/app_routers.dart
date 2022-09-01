import 'package:flutter/material.dart';
import 'package:task_mobile_application/presentation/bin.dart';
import 'package:task_mobile_application/presentation/task_screen.dart';

class AppRouter {
  Route? onGenerateRoute(RouteSettings) {
    switch (RouteSettings.name) {
      case RecycleBin.id:
        return MaterialPageRoute(
            builder: (_) => const RecycleBin());
      case TasksScreen.id:
        return MaterialPageRoute(
            builder: (_) => TasksScreen());
      default:
        return null;
    }
  }
}
