import 'package:flutter/material.dart';
import 'package:projeto_home_service/src/pages/home/home_page.dart';
import 'package:projeto_home_service/src/pages/login/login_page.dart';
import 'package:projeto_home_service/src/pages/onboarding/onboard_controller.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const OnboardController(),
      routes: {
        '/login': (context) => const LoginPage(),
        '/home_page': (context) => const HomePage(),
      },
    );
  }
}
