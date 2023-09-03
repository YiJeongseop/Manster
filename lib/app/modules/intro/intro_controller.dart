import 'dart:async';
import 'package:get/get.dart';

class IntroController extends GetxController {
  var textProgress = 0.0.obs;
  var imageProgress = 0.0.obs;

  // Finish in 1 second
  void startTextAnimation() {
    Timer.periodic(
      const Duration(milliseconds: 10),
      (timer) {
        if (textProgress.value > 7) {
          timer.cancel();
        } else {
          textProgress.value += 0.07;
        }
      },
    );
  }

  void startImageAnimation() {
    Timer.periodic(
      const Duration(milliseconds: 10),
      (timer) {
        if (imageProgress.value >= 720.0) {
          timer.cancel();
        } else {
          imageProgress.value += 3.6;
        }
      },
    );
  }
}
