import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../presenter/presenter.dart';
import '../view.dart';

class HomePage extends StatelessWidget {
  final GetXHomePresenter presenter;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final TextEditingController _controller = TextEditingController();

  HomePage({
    @required this.presenter,
  });
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        key: _scaffoldKey,
        appBar: buildAppBar(
          context: context,
          scaffoldKey: _scaffoldKey,
          initialValue: presenter.wayViewModeOut,
          buttonCallback: (value) => presenter.changeWayViewMode(value),
        ),
        drawer: CurstomDrawer(presenter.jumpToPage),
        body: Builder(
          builder: (context) {
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
              child: Column(
                children: [
                  BuildForm(
                    onChanged: presenter.validateSearchName,
                    errorText: presenter.errorTextDialogStream,
                    controller: _controller,
                    onSubmited: presenter.onSubmited,
                  ),
                  presenter.wayViewModeOut == 1
                      ? Expanded(
                          child: presenter.imageListSearchedOut.length == 0
                              ? buildImageListView(
                                  presenter.imageListModelOut,
                                )
                              : buildImageListView(
                                  presenter.imageListSearchedMapOut,
                                ),
                        )
                      : presenter.imageListSearchedOut.length == 0
                          ? buildGridImages(
                              showGifDetails: presenter.showGifDetails,
                              imageList: presenter.imageListMapOut,
                              getMoreImages: presenter.getMoreImages,
                            )
                          : buildGridImages(
                              showGifDetails: presenter.showGifDetails,
                              imageList: presenter.imageListSearchedMapOut,
                              getMoreImages: presenter.getMoreImages,
                            ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
