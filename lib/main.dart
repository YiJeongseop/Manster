import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jikan_api/jikan_api.dart';

import 'screens/intro_screen.dart';
import 'screens/home_screen.dart';

final jikan = Jikan();

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Manster',
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: () => const IntroScreen()),
        GetPage(name: '/home', page: () => const HomeScreen(), transition: Transition.downToUp)
      ],
    );
  }
}