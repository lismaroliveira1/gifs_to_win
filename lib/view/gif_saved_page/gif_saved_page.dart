import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:gifs_to_win/presenter/getx_saved_presenter.dart';

import '../view.dart';

class GifSavedPage extends StatelessWidget {
  final GetXSavedPresenter presenter;
  GifSavedPage({@required this.presenter});

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        key: _scaffoldKey,
        appBar: buildAppBar(
          context: context,
          scaffoldKey: _scaffoldKey,
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
                  Get.offAllNamed(page);
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
                              getMoreImages: () async {
                                print('ok');
                              },
                              imageList: presenter.imageListSearchedMapOut,
                              isSearch: false,
                              searchName: '',
                              closeCallback: () {},
                              moveToBlakiList: presenter.moveToBlakiList,
                              editImageTitleDialog: presenter.showEditDialog,
                            ),
                          ),
                        ],
                      ),
              );
            },
          ),
        ),
      ),
    );
  }
}
