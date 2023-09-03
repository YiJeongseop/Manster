import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:manster/app/modules/intro/intro_controller.dart';
import 'package:google_fonts/google_fonts.dart';

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
    introController.startRunning();
    super.initState();
  }

  @override
  void dispose() {
    introController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Obx(
                    () => Text(
                      "Manster".substring(
                          0, (introController.textProgress.value).toInt()),
                      style: GoogleFonts.comingSoon(
                          fontSize: screenSize.height * 0.08,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  Obx(
                    () => Image.asset(
                      'assets/images/run${introController.imageNumber}.png',
                      height: screenSize.height * 0.06,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
