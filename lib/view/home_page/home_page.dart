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
    double _edge = MediaQuery.of(context).size.width;
    return buildCustomDrawer(
      key: _innerDrawerKey,
      scaffold: buildScaffold(context),
      rightChild: buildRightChildHomeDrawer(
        callback: presenter.filterCallback,
        context: context,
        reverse: false,
        edge: _edge,
      ),
      leftChild: buildLeftChildDrawer(
        edge: _edge,
        routePageCallBack: presenter.jumpToPage,
        context: context,
        reverse: true,
      ),
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
                                    appsInstalleds:
                                        presenter.appInstalledMapOut,
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
                                    shareByFacebook: (imageMap) =>
                                        presenter.shareByFacebook(imageMap),
                                    shareByInstagram: (imageMap) =>
                                        presenter.shareByInstagram(imageMap),
                                    shareByMessenger: (imageMap) =>
                                        presenter.shareByMessenger(imageMap),
                                    shareByTwitter: (imageMap) =>
                                        presenter.shareByTwitter(imageMap),
                                    shareByWhatsApp: (imageMap) =>
                                        presenter.shareByWhatsApp(imageMap),
                                  ),
                                ))
                              : Expanded(
                                  child: buildImageListView(
                                    appsInstalleds:
                                        presenter.appInstalledMapOut,
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
                                    shareByFacebook: (imageMap) =>
                                        presenter.shareByFacebook(imageMap),
                                    shareByInstagram: (imageMap) =>
                                        presenter.shareByInstagram(imageMap),
                                    shareByMessenger: (imageMap) =>
                                        presenter.shareByMessenger(imageMap),
                                    shareByTwitter: (imageMap) =>
                                        presenter.shareByTwitter(imageMap),
                                    shareByWhatsApp: (imageMap) =>
                                        presenter.shareByWhatsApp(imageMap),
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
                                  appsInstalleds: presenter.appInstalledMapOut,
                                  deleteImage:
                                      (Map<dynamic, dynamic> imageMap) {},
                                  saveImage: (imageMap) =>
                                      presenter.saveImage(imageMap),
                                  shareImage:
                                      (Map<dynamic, dynamic> imageMap) {},
                                  shareByFacebook: (imageMap) =>
                                      presenter.shareByFacebook(imageMap),
                                  shareByInstagram: (imageMap) =>
                                      presenter.shareByInstagram(imageMap),
                                  shareByMessenger: (imageMap) =>
                                      presenter.shareByMessenger(imageMap),
                                  shareByTwitter: (imageMap) =>
                                      presenter.shareByTwitter(imageMap),
                                  shareByWhatsApp: (imageMap) =>
                                      presenter.shareByWhatsApp(imageMap),
                                  moveToBlakiList: presenter.moveToBlakiList,
                                  editImageTitleDialog:
                                      presenter.showEditDialog,
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
                                  appsInstalleds: presenter.appInstalledMapOut,
                                  deleteImage:
                                      (Map<dynamic, dynamic> imageMap) {},
                                  saveImage: (imageMap) =>
                                      presenter.saveImage(imageMap),
                                  shareImage:
                                      (Map<dynamic, dynamic> imageMap) {},
                                  shareByFacebook: (imageMap) =>
                                      presenter.shareByFacebook(imageMap),
                                  shareByInstagram: (imageMap) =>
                                      presenter.shareByInstagram(imageMap),
                                  shareByMessenger: (imageMap) =>
                                      presenter.shareByMessenger(imageMap),
                                  shareByTwitter: (imageMap) =>
                                      presenter.shareByTwitter(imageMap),
                                  shareByWhatsApp: (imageMap) =>
                                      presenter.shareByWhatsApp(imageMap),
                                  moveToBlakiList: presenter.moveToBlakiList,
                                  editImageTitleDialog:
                                      presenter.showEditDialog,
                                ),
                    ],
                  ),
          );
        },
      ),
    );
  }
}
