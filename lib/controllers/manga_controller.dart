import 'package:get/get.dart';
import 'package:jikan_api/jikan_api.dart';

class MangaController extends GetxController{
  Rx<BuiltList<Manga>> mangaList = BuiltList<Manga>([]).obs;
}