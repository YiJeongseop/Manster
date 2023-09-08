import 'package:get/get.dart';

class TitleSearchController extends GetxController{
  var searchTitle = ''.obs;

  void updateSearchText(String title){
    searchTitle.value = title;
  }
}