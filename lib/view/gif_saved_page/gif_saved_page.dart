import 'package:flutter/material.dart';
import 'package:flutter_inner_drawer/inner_drawer.dart';
import 'package:get/get.dart';

import 'package:gifs_to_win/presenter/getx_saved_presenter.dart';

import '../view.dart';

class GifSavedPage extends StatelessWidget {
  final GetXSavedPresenter presenter;
  GifSavedPage({@required this.presenter});

  final TextEditingController _controller = TextEditingController();
  final GlobalKey<InnerDrawerState> _innerDrawerKey =
      GlobalKey<InnerDrawerState>();
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
      appBar: buildAppBar(
        context: context,
        innerDrawerKey: _innerDrawerKey,
        initialValue: presenter.wayViewModeOut,
        buttonCallback: presenter.changeWayViewMode,
        title: 'GifsSalvos',
      ),
      drawer: CurstomDrawer(presenter.jumpToPage),
      body: GestureDetector(
        onTap: () => hideKeyboard(context: context),
        child: Builder(
          builder: (context) {
            presenter.jumpToStream.listen((page) {
              if (page?.isNotEmpty == true) {
                Get.offNamed(page);
              }
            });
            return Obx(
              () => presenter.isLoadingOut
                  ? Container(
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    )
                  : Column(
                      children: [
                        buildForm(
                          onChanged: presenter.validateSearchName,
                          errorText: presenter.errorTextDialogStream,
                          controller: _controller,
                          onSubmited: presenter.onSubmited,
                          labelText: 'Pesquisar',
                          hintText: '',
                          icon: Icons.search,
                        ),
                        Expanded(
                          child: buildImageListView(
                            context: context,
                            getMoreImages: () async {},
                            imageList: presenter.imageSavedLisMapOut,
                            isSearch: false,
                            searchName: '',
                            closeCallback: () {},
                            moveToBlakiList: presenter.moveToBlakiList,
                            editImageTitleDialog: presenter.showEditDialog,
                            deleteImage: (Map<dynamic, dynamic> imageMap) {},
                            saveImage: (Map<dynamic, dynamic> imageMap) {},
                            shareImage: (Map<dynamic, dynamic> imageMap) {},
                          ),
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
