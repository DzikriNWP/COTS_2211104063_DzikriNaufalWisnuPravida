import 'package:cots_dzikrinwp_2211104063/modules/login/login_view.dart';
import 'package:cots_dzikrinwp_2211104063/modules/main/main_navigation.dart';
import 'package:cots_dzikrinwp_2211104063/modules/onboarding/onboarding_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: '/',
      getPages: [
        GetPage(
            name: '/',
            page: () => const OnboardingScreen()), // UNTUK BOARDING PAGE
        GetPage(
            name: '/login',
            page: () => const GojekLoginScreen()), //UNTUK LOGIN PAGE
        GetPage(
            name: '/main',
            page: () => const MainNavigation()), //UNTUK MAIN PAGE
      ],
    );
  }
}
