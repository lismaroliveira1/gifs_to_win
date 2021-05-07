import 'package:flutter/material.dart';
import 'package:flutter_inner_drawer/inner_drawer.dart';
import 'package:get/get.dart';
import 'package:gifs_to_win/presenter/getx_trash_presenter.dart';

import '../view.dart';

class TrashPage extends StatelessWidget {
  final GetXTrashPresenter presenter;
  TrashPage({@required this.presenter});
  final TextEditingController _controller = TextEditingController();
  final GlobalKey<InnerDrawerState> _innerDrawerKey =
      GlobalKey<InnerDrawerState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(
        context: context,
        innerDrawerKey: _innerDrawerKey,
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
