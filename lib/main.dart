import 'package:demo/presentation/academy_record/academy_record_screen.dart';
import 'package:demo/presentation/login/login_screen.dart';
import 'package:demo/shared/di/app_module.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

void main() {
  configureDependencies(); //?
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _router,
      debugShowCheckedModeBanner: false,
      title: "Monkey",
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF3B5BDB)),
        useMaterial3: true,
      ),
    );
  }
}

final GoRouter _router = GoRouter(
  initialLocation: '/login',
  routes: [
    GoRoute(path: '/login', builder: (context, state) => const LoginScreen()),
    GoRoute(
      path: '/academyrecord',
      builder: (context, state) => const AcademyRecordScreen(),
    ),
  ],
);
