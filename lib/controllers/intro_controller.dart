import 'dart:async';
import 'package:get/get.dart';

class IntroController extends GetxController {
  var textProgress = 0.0.obs;
  var imageNumber = 1.obs;

  void startTextAnimation() {
    Timer.periodic(
      const Duration(milliseconds: 12),
      (timer) {
        if (textProgress.value > 7) {
          timer.cancel();
          Future.delayed(const Duration(milliseconds: 500), () {
            Get.offNamed("/home");
          });
        } else {
          textProgress.value += 0.07;
        }
      },
    );
  }

  void startRunning() {
    Timer.periodic(
      const Duration(milliseconds: 40),
      (timer) {
        if (imageNumber.value == 5) {
          imageNumber.value = 1;
        } else {
          imageNumber.value++;
        }
      },
    );
  }
}
