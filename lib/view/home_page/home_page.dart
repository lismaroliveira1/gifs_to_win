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
    final _formKey = GlobalKey<FormState>();
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
          child: Column(
            children: [
              buildForm(_formKey, context),
              Obx(
                () => buildGridImages(
                  showGifDetails: presenter.showGifDetails,
                  imageList: presenter.imageListMapOut,
                  getMoreImages: presenter.getMoreImages,
                ),
              ),
            ],
          ),
        );
      }),
    );
  }

  Container buildForm(GlobalKey<FormState> _formKey, BuildContext context) {
    final FocusNode _ageFocus = FocusNode();
    final _textEditingController = TextEditingController();
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextFormField(
          focusNode: _ageFocus,
          onTap: () {
            hideKeyboard(context: context);
          },
          controller: _textEditingController,
          decoration: InputDecoration(
            labelText: 'Pesquisar',
            hintText: 'Casa',
            labelStyle: TextStyle(
              fontSize: 16,
            ),
            filled: true,
            border: OutlineInputBorder(),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey.shade300, width: 2),
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(5),
                topLeft: Radius.circular(5),
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey.shade300, width: 2),
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(5),
                topLeft: Radius.circular(5),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
