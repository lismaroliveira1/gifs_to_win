import 'package:get/get.dart';
import 'package:meta/meta.dart';
import '../model/model.dart';

class GetXTrashPresenter extends GetxController {
  final ImageResults result;
  GetXTrashPresenter({@required this.result});

  var _blackList = <ImageModel>[].obs;
  var _jumpTo = RxString('/');

  List<ImageModel> get imageDeletedListStream => _blackList.toList();
  Stream<String> get jumpToStream => _jumpTo.stream;
  @override
  void onInit() async {
    _blackList.clear();
    _blackList.value = await result.cache.readData('deleted');
    super.onInit();
  }

  void jumpToPage(String page) {
    _jumpTo.value = page;
  }
}
