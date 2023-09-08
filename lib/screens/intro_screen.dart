import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:manster/controllers/intro_controller.dart';
import 'package:google_fonts/google_fonts.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({Key? key}) : super(key: key);

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
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
    final screenWidth = MediaQuery.of(context).size.width;
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
                          fontSize: (screenWidth > 1080) ? screenWidth * 0.03 : 1080 * 0.03,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  Obx(
                    () => Image.asset(
                      'assets/images/run${introController.imageNumber}.png',
                      height: (screenWidth > 1080) ? screenWidth * 0.02 : 1080 * 0.02,
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
