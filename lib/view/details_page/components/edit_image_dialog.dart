import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meta/meta.dart';

import '../../../presenter/presenter.dart';

Future editImageTitleDialog({
  @required BuildContext context,
  @required GetXHomePresenter presenter,
}) {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _titleTextController = TextEditingController();
  return Future.delayed(
    Duration(milliseconds: 300),
    () => showDialog(
      context: context,
      builder: (_) {
        presenter.makeValidateNameFalse();
        return Form(
          key: _formKey,
          child: Obx(
            () => AlertDialog(
              title: Text('Editar'),
              content: TextFormField(
                controller: _titleTextController,
                decoration: InputDecoration(
                  errorText: presenter.errorTextDialogStream,
                  labelText: 'Novo título',
                  hintText: presenter.imageDetailsStream.title,
                ),
                onChanged: (newValue) {
                  presenter.validateName(newValue);
                },
              ),
              actions: [
                ElevatedButton(
                  onPressed: presenter.isValidNameStream
                      ? () async {
                          Navigator.pop(context);
                          presenter.saveImage(
                            id: presenter.imageDetailsStream.id,
                            title: _titleTextController.text,
                            url: presenter.imageDetailsStream.url,
                          );
                        }
                      : null,
                  child: Text('Salvar'),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('Cancelar'),
                )
              ],
            ),
          ),
        );
      },
    ),
  );
}
