import 'package:get/get.dart';
import 'package:meta/meta.dart';

import '../models/model.dart';

class HomePresenter extends GetxController {
  final ImageRepository repository;
  HomePresenter({
    @required this.repository,
  });

  var _imageList = <ImageModel>[].obs;
  var _atualLimit = 25.obs;
  List<ImageModel> get imageListStream => _imageList.toList();
  @override
  void onInit() async {
    _imageList.value = await repository.getAll(limit: _atualLimit.value);
    super.onInit();
  }

  void changeTotalPerPage() {}
}
