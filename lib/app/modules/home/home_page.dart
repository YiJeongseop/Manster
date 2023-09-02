import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
      backgroundColor: const Color(0xFFD5FFF2),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "HomePage",
                style: TextStyle(fontSize: screenSize.height * 0.06),
              ),
              TextButton(
                onPressed: () {
                  Get.back();
                },
                child: Text(
                  "Go IntroPage",
                  style: TextStyle(fontSize: screenSize.height * 0.06),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
