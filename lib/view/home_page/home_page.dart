import 'package:flutter/material.dart';
import 'package:flutter_inner_drawer/inner_drawer.dart';
import 'package:get/get.dart';
import 'package:gifs_to_win/i18n/resources.dart';

import '../../presenter/presenter.dart';
import '../view.dart';

class HomePage extends StatelessWidget {
  final GetXHomePresenter presenter;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final GlobalKey<InnerDrawerState> _innerDrawerKey =
      GlobalKey<InnerDrawerState>();
  final TextEditingController _controller = TextEditingController();

  HomePage({
    @required this.presenter,
  });
  @override
  Widget build(BuildContext context) {
    return buildCustomDrawer(
      routePageCallBack: presenter.jumpToPage,
      context: context,
      key: _innerDrawerKey,
      scaffold: buildScaffold(context),
    );
  }

  Scaffold buildScaffold(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: buildAppBar(
        context: context,
        innerDrawerKey: _innerDrawerKey,
        initialValue: presenter.wayViewModeOut,
        buttonCallback: (value) => presenter.changeWayViewMode(value),
        title: R.translations.home,
      ),
      body: Builder(
        builder: (context) {
          presenter.navigateToStream.listen((page) {
            if (page?.isNotEmpty == true) {
              Get.toNamed(page);
            }
          });
          presenter.jumpToStream.listen((page) {
            if (page != null) {
              Get.offNamed(page);
            }
          });

          return Obx(
            () => presenter.isLoadingStream
                ? Container(
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  )
                : Column(
                    children: [
                      buildForm(
                        onChanged: presenter.validateSearchName,
                        errorText: presenter.errorTextDialogOut,
                        controller: _controller,
                        onSubmited: presenter.onSubmited,
                        icon: Icons.search,
                        hintText: 'Cachorros',
                        labelText: 'Pesquisar',
                      ),
                      presenter.wayViewModeOut == 1
                          ? presenter.imageListSearchedMapOut.length > 0
                              ? Expanded(
                                  child: Obx(
                                  () => buildImageListView(
                                    context: context,
                                    getMoreImages: presenter.getMoreImages,
                                    imageList:
                                        presenter.imageListSearchedMapOut,
                                    isSearch: presenter
                                            .imageListSearchedMapOut.length >
                                        0,
                                    searchName: presenter.searchNameOut,
                                    closeCallback: presenter.closeSearch,
                                    moveToBlakiList: presenter.moveToBlakiList,
                                    editImageTitleDialog:
                                        presenter.showEditDialog,
                                    deleteImage:
                                        (Map<dynamic, dynamic> imageMap) {},
                                    saveImage: (imageMap) =>
                                        presenter.saveImage(imageMap),
                                    shareImage:
                                        (Map<dynamic, dynamic> imageMap) {},
                                  ),
                                ))
                              : Expanded(
                                  child: buildImageListView(
                                    context: context,
                                    getMoreImages: presenter.getMoreImages,
                                    imageList: presenter.imageListMapOut,
                                    isSearch: presenter
                                            .imageListSearchedMapOut.length >
                                        0,
                                    searchName: presenter.searchNameOut,
                                    closeCallback: presenter.closeSearch,
                                    moveToBlakiList: presenter.moveToBlakiList,
                                    editImageTitleDialog:
                                        presenter.showEditDialog,
                                    deleteImage:
                                        (Map<dynamic, dynamic> imageMap) {},
                                    saveImage: (imageMap) =>
                                        presenter.saveImage(imageMap),
                                    shareImage:
                                        (Map<dynamic, dynamic> imageMap) {},
                                  ),
                                )
                          : presenter.imageListSearchedMapOut.length > 0
                              ? buildGridImages(
                                  showGifDetails: (imageMap) =>
                                      presenter.showGifDetails(imageMap),
                                  imageList: presenter.imageListSearchedMapOut,
                                  getMoreImages: presenter.getMoreImages,
                                  isSearch:
                                      presenter.imageListSearchedMapOut.length >
                                          0,
                                  searchName: presenter.searchNameOut,
                                  closeCallback: presenter.closeSearch,
                                )
                              : buildGridImages(
                                  showGifDetails: (imageMap) =>
                                      presenter.showGifDetails(imageMap),
                                  imageList: presenter.imageListMapOut,
                                  getMoreImages: presenter.getMoreImages,
                                  isSearch:
                                      presenter.imageListSearchedMapOut.length >
                                          0,
                                  searchName: presenter.searchNameOut,
                                  closeCallback: presenter.closeSearch,
                                ),
                    ],
                  ),
          );
        },
      ),
    );
  }
}
