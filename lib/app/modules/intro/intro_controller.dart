import 'dart:async';
import 'package:get/get.dart';

class IntroController extends GetxController {
  var animationProgress = 0.0.obs;

  void startAnimation() {
    Timer.periodic(
      const Duration(milliseconds: 10),
      (timer) {
        if (animationProgress.value > 7) {
          timer.cancel();
        } else {
          animationProgress.value += 0.07;
        }
      },
    );
  }
}
