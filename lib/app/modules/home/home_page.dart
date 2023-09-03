import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
                  Text(
                    "Manster",
                    style: GoogleFonts.comingSoon(
                        fontSize: screenSize.height * 0.08,
                        fontWeight: FontWeight.w600),
                  ),
                  Image.asset(
                    'assets/images/rest.png',
                    height: screenSize.height * 0.06,
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
