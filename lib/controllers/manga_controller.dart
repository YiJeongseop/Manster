import 'package:get/get.dart';
import 'package:jikan_api/jikan_api.dart';

class MangaController extends GetxController{
  Rx<BuiltList<Manga>> mangaList = BuiltList<Manga>([]).obs;

  int _size = 3;
  get size => _size;

  int _selectedIndex = -1;
  get selectedIndex => _selectedIndex;

  List<String?> _gridImages = List.generate(9, (_) => null);
  get gridImages => _gridImages;

  void setSize(int index){
    if(_size == index) return;
    _size = index;
    List<String?> temp = _gridImages;
    _gridImages = List.generate(_size * _size, (int num) {
      if(num < 9){
        return temp[num];
      } else{
        return null;
      }
    });
    update();
  }

  void setSelectedIndex(int index){
    _selectedIndex = index;
    update();
  }

  void setGridImages(int index, String? data){
    _gridImages[index] = data;
    update();
  }
}