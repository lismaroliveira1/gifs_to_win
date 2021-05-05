import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../presenter/presenter.dart';
import '../view.dart';

class HomePage extends StatelessWidget {
  final GetXHomePresenter presenter;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  HomePage({
    @required this.presenter,
  });
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: buildAppBar(
        context: context,
        scaffoldKey: _scaffoldKey,
        initialValue: 1,
        buttonCallback: presenter.changeTotalPerPage,
      ),
      drawer: CurstomDrawer(presenter.jumpToPage),
      body: Builder(builder: (context) {
        presenter.navigateToStream.listen((page) {
          if (page?.isNotEmpty == true) {
            Get.toNamed(page);
          }
        });
        presenter.jumpToStream.listen((page) {
          if (page?.isNotEmpty == true) {
            Get.offAllNamed(page);
          }
        });
        return GestureDetector(
          onTap: () {
            hideKeyboard(context: context);
          },
          child: Obx(
            () => Column(
              children: [
                buildForm(
                  onChanged: presenter.validateSearchName,
                  errorText: presenter.errorTextDialogStream,
                ),
                buildGridImages(
                  showGifDetails: presenter.showGifDetails,
                  imageList: presenter.imageListMapOut,
                  getMoreImages: presenter.getMoreImages,
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
