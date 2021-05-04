import 'package:get/get.dart';
import 'package:meta/meta.dart';
import '../model/model.dart';

class GetXSavedPresenter extends GetxController {
  final ImageResults result;
  GetXSavedPresenter({@required this.result});

  var _imageListSaved = <ImageModel>[].obs;
  var _jumpTo = RxString('/');

  List<ImageModel> get imageSavedListStream => _imageListSaved.toList();
  Stream<String> get jumpToStream => _jumpTo.stream;
  @override
  void onInit() async {
    _imageListSaved.clear();
    _imageListSaved.value = await result.cache.readData('saved');
    super.onInit();
  }

  void jumpToPage(String page) {
    _jumpTo.value = page;
  }

  void getImages() async {
    _imageListSaved.clear();
    _imageListSaved.value = await result.cache.readData('saved');
  }

  void changeViewMode(int limit) async {}
}
