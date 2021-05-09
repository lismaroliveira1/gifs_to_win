import 'package:flutter/material.dart';
import 'package:flutter_inner_drawer/inner_drawer.dart';

import 'package:get/get.dart';
import 'package:gifs_to_win/i18n/i18n.dart';

import '../../presenter/presenter.dart';
import '../view.dart';

class TrashPage extends StatelessWidget {
  final GetXTrashPresenter presenter;
  TrashPage({@required this.presenter});
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
        initialValue: 1,
        buttonCallback: presenter.changeViewMode,
        title: R.translations.trash,
      ),
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
              () => Column(
                children: [
                  buildForm(
                    onChanged: presenter.validateSearchName,
                    errorText: presenter.errorTextDialogStream,
                    controller: _controller,
                    onSubmited: presenter.onSubmited,
                    labelText: R.translations.search,
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
