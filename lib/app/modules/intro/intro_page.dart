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
  void initState(){
    introController.startAnimation();
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
              Obx(
                () => Text(
                  "Manster".substring(
                      0, (introController.animationProgress.value).toInt()),
                  style: GoogleFonts.comingSoon(fontSize: screenSize.height * 0.06, fontWeight: FontWeight.w600),
                ),
              ),
              // Text(
              //   "IntroPage",
              //   style: TextStyle(fontSize: screenSize.height * 0.06),
              // ),
              TextButton(
                onPressed: () {
                  Get.toNamed('home');
                },
                child: Text(
                  "Go HomePage",
                  style: GoogleFonts.comingSoon(fontSize: screenSize.height * 0.06),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
