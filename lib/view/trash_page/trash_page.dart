import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gifs_to_win/presenter/getx_trash_presenter.dart';

import '../view.dart';

class TrashPage extends StatelessWidget {
  final GetXTrashPresenter presenter;
  TrashPage({@required this.presenter});
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: buildAppBar(
        context: context,
        scaffoldKey: _scaffoldKey,
        initialValue: 1,
        buttonCallback: presenter.changeViewMode,
        title: 'Lixeira',
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
              () => Column(
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
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
