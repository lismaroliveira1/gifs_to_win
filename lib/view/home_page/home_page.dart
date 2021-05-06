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
          title: 'Home',
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
            presenter.showEditDialogStream.listen((showEditDialog) {
              buildShowModalDialog(
                context: context,
                imageMap: presenter.imageDetailsMapOut,
                controller: _controller,
                errorText: presenter.errorTextDialogOut,
                onChanged: (value) => presenter.validateDialogName,
                onSubmited: (value) => presenter.onSubmited(value),
              );
            });
            return GestureDetector(
                onTap: () {
                  hideKeyboard(context: context);
                },
                child: Obx(
                  () => presenter.isLoadingStream
                      ? Container(
                          child: Center(
                            child: CircularProgressIndicator(),
                          ),
                        )
                      : Column(
                          children: [
                            BuildForm(
                              onChanged: presenter.validateSearchName,
                              errorText: presenter.errorTextDialogOut,
                              controller: _controller,
                              onSubmited: presenter.onSubmited,
                            ),
                            presenter.wayViewModeOut == 1
                                ? presenter.imageListSearchedMapOut.length > 0
                                    ? Expanded(
                                        child: buildImageListView(
                                          context: context,
                                          getMoreImages:
                                              presenter.getMoreImages,
                                          showGifDetails:
                                              presenter.showGifDetails,
                                          imageList:
                                              presenter.imageListSearchedMapOut,
                                          isSearch: presenter
                                                  .imageListSearchedMapOut
                                                  .length >
                                              0,
                                          searchName: presenter.searchNameOut,
                                          closeCallback: presenter.closeSearch,
                                          moveToBlakiList:
                                              presenter.moveToBlakiList,
                                          editImageTitleDialog:
                                              presenter.showEditDialog,
                                        ),
                                      )
                                    : Expanded(
                                        child: buildImageListView(
                                          context: context,
                                          getMoreImages:
                                              presenter.getMoreImages,
                                          showGifDetails:
                                              presenter.showGifDetails,
                                          imageList: presenter.imageListMapOut,
                                          isSearch: presenter
                                                  .imageListSearchedMapOut
                                                  .length >
                                              0,
                                          searchName: presenter.searchNameOut,
                                          closeCallback: presenter.closeSearch,
                                          moveToBlakiList:
                                              presenter.moveToBlakiList,
                                          editImageTitleDialog:
                                              presenter.showEditDialog,
                                        ),
                                      )
                                : presenter.imageListSearchedMapOut.length > 0
                                    ? buildGridImages(
                                        showGifDetails:
                                            presenter.showGifDetails,
                                        imageList:
                                            presenter.imageListSearchedMapOut,
                                        getMoreImages: presenter.getMoreImages,
                                        isSearch: presenter
                                                .imageListSearchedMapOut
                                                .length >
                                            0,
                                        searchName: presenter.searchNameOut,
                                        closeCallback: presenter.closeSearch,
                                      )
                                    : buildGridImages(
                                        showGifDetails:
                                            presenter.showGifDetails,
                                        imageList: presenter.imageListMapOut,
                                        getMoreImages: presenter.getMoreImages,
                                        isSearch: presenter
                                                .imageListSearchedMapOut
                                                .length >
                                            0,
                                        searchName: presenter.searchNameOut,
                                        closeCallback: presenter.closeSearch,
                                      ),
                          ],
                        ),
                ));
          },
        ),
      ),
    );
  }
}
