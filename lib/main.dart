import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'app/modules/intro/intro_page.dart';
import 'app/modules/home/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Manster',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: () => const IntroPage()),
        GetPage(name: '/home', page: () => const HomePage(), transition: Transition.size)
      ],
    );
  }
}