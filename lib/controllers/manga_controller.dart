import 'package:get/get.dart';
import 'package:jikan_api/jikan_api.dart';

class MangaController extends GetxController {
  Rx<BuiltList<Manga>> mangaList = BuiltList<Manga>([]).obs;

  int _size = 3;

  get size => _size;

  int _selectedIndex = -1;

  get selectedIndex => _selectedIndex;

  List<String?> _gridImages = List.generate(9, (_) => null);

  get gridImages => _gridImages;

  void setSize(int size) {
    if (_size == size) return;
    _size = size;
    List<String?> temp = _gridImages;
    _gridImages = List.generate(_size * _size, (int index) {
      if (size == 4) {
        if (index < temp.length) {
          return temp[index];
        } else {
          return null;
        }
      } else if (size == 3) {
        if (temp.length == 4) {
          if (index < 4) {
            return temp[index];
          } else {
            return null;
          }
        } else {
          return temp[index];
        }
      } else {
        return temp[index];
      }
    });
    update();
  }

  void setSelectedIndex(int index) {
    _selectedIndex = index;
    update();
  }

  void setGridImages(int index, String? data) {
    _gridImages[index] = data;
    update();
  }
}
