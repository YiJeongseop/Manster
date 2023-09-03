import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:manster/app/modules/intro/intro_controller.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:math' as math;

class IntroPage extends StatefulWidget {
  const IntroPage({Key? key}) : super(key: key);

  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  final IntroController introController = Get.put(IntroController());

  @override
  void initState() {
    introController.startTextAnimation();
    introController.startImageAnimation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Obx(
                    () => Transform.rotate(
                      angle: introController.imageProgress.value *
                          (math.pi / 180.0), // Convert degrees to radians
                      child: Image.asset(
                        'assets/images/icon.png',
                        height: screenSize.height * 0.07,
                      ),
                    ),
                  ),
                  SizedBox(width: screenSize.width * 0.005,),
                  Obx(
                    () => Text(
                      "Manster".substring(
                          0, (introController.textProgress.value).toInt()),
                      style: GoogleFonts.comingSoon(
                          fontSize: screenSize.height * 0.07,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ],
              ),
              TextButton(
                onPressed: () {
                  Get.toNamed('home');
                },
                child: Text(
                  "Go HomePage",
                  style: GoogleFonts.comingSoon(
                      fontSize: screenSize.height * 0.06),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
