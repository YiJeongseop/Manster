import 'dart:async';

import 'package:get/get.dart';

class TitleSearchController extends GetxController {
  var searchTitle = ''.obs;

  bool _canSubmit = true;

  get canSubmit => _canSubmit;

  void updateSearchText(String title) {
    searchTitle.value = title;
  }

  void changeCanSubmit() {
    if (_canSubmit) {
      _canSubmit = false;
      Timer(const Duration(seconds: 3), () {
        _canSubmit = true;
      });
    }
  }
}
