import 'package:flutter/material.dart';
import 'package:transactions/common/navigation/app_route_names.dart';
import 'package:transactions/common/theme/app_theme.dart';

import 'common/navigation/app_navigation.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static final appNavigation = AppNavigation();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      routes: appNavigation.routes,
      initialRoute: AppRouteNames.auth,
    );
  }
}