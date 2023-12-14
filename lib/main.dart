import 'package:flutter/material.dart';
import 'package:projeto_home_service/src/pages/account/account_page.dart';
import 'package:projeto_home_service/src/pages/home/home_page.dart';
import 'package:projeto_home_service/src/pages/login/login_page.dart';
import 'package:projeto_home_service/src/pages/main/main_page.dart';
import 'package:projeto_home_service/src/pages/onboarding/onboard_controller.dart';
import 'package:projeto_home_service/src/pages/registry/registry_page.dart';
import 'package:projeto_home_service/src/pages/config/config_page.dart';
import 'package:projeto_home_service/src/provider/professional_provider.dart';
import 'package:projeto_home_service/src/provider/user_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UserProvider()),
        ChangeNotifierProvider(create: (_) => ProfessionalProvider())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        routes: {
          '/': (context) => const OnboardController(),
          '/registry': (context) => const RegistryPage(),
          '/main_page': (context) => const MainPage(),
          '/login': (context) => const LoginPage(),
          '/home_page': (context) => const HomePage(),
          '/search_page': (context) => const ConfigurationPage(),
          '/account_page': (context) => const AccountPage(),
        },
      ),
    );
  }
}
