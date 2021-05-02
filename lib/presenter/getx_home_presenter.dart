import 'package:get/get.dart';
import 'package:meta/meta.dart';

import '../models/model.dart';

class HomePresenter extends GetxController {
  final ImageRepository repository;
  HomePresenter({
    @required this.repository,
  });

  var _imageList = <ImageModel>[].obs;
  var _defaultLimit = 15.obs;
  var _defaultOffset = 1.obs;
  List<ImageModel> get imageListStream => _imageList.toList();
  int get limitImageView => _defaultLimit.toInt();
  @override
  void onInit() async {
    _imageList.value =
        await repository.getAll(limit: _defaultLimit.value, offset: 1);
    super.onInit();
  }

  void changeTotalPerPage({@required int limit}) async {
    _defaultLimit.value = limit;
    _imageList.value =
        await repository.getAll(limit: _defaultLimit.value, offset: 1);
  }

  void getMoreImages() async {
    var newList = await repository.getAll(
        limit: _defaultLimit.value, offset: _defaultOffset.value++);
    newList.forEach((element) {
      _imageList.add(element);
    });
  }

  void editImage({@required String id, @required String title}) {
    _imageList.forEach((image) {
      if (image.id == id) {
        image.title = title;
      }
    });
  }
}
