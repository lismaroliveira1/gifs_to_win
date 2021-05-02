import 'package:get/get.dart';
import 'package:meta/meta.dart';

import '../models/model.dart';

class HomePresenter extends GetxController {
  final ImageRepository repository;
  HomePresenter({
    @required this.repository,
  });

  var _imageList = <ImageModel>[].obs;
  List<ImageModel> get imageListStream => _imageList.toList();
  @override
  void onInit() async {
    _imageList.value = await repository.getAll(limit: 25);
    super.onInit();
  }
}
