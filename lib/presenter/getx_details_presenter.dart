import 'package:get/get.dart';
import 'package:meta/meta.dart';

import '../models/model.dart';
import './getx_home_presenter.dart';

class GetXDetailsPresenter extends GetxController {
  final ImageRepository repository;
  final GetXHomePresenter homePresenter;
  GetXDetailsPresenter({
    @required this.repository,
    @required this.homePresenter,
  });

  @override
  void onInit() {
    print(homePresenter.imageDetailsStream.id);
    super.onInit();
  }
}
