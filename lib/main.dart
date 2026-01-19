import 'package:demo/core/theme/app_theme.dart';
import 'package:demo/shared/di/app_module.dart';
import 'package:demo/shared/router.dart';
import 'package:flutter/material.dart';

void main() {
  configureDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: appRouter,
      debugShowCheckedModeBanner: false,
      title: "Monkey",
      theme: AppTheme.light,
    );
  }
}
