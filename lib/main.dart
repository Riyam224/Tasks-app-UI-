import 'package:flutter/material.dart';
import 'package:notes/core/routing/routes_generated.dart';
import 'package:notes/core/styling/themes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Daily Task',
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      themeMode: ThemeMode.system, // auto switch with device setting
      routerConfig: RouteGenerator.mainRoutingInOurApp,
    );
  }
}
