import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

import '../../../presenter/presenter.dart';

Future editImageTitleDialog({
  @required BuildContext context,
  @required GetXHomePresenter presenter,
}) {
  TextEditingController _titleTextController = TextEditingController();
  return Future.delayed(
    Duration(milliseconds: 300),
    () => showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          title: Text('Editar'),
          content: TextField(
              controller: _titleTextController,
              decoration: InputDecoration(
                labelText: 'Novo título',
                hintText: presenter.imageDetailsStream.title,
              )),
          actions: [
            ElevatedButton(
              onPressed: () async {
                Navigator.pop(context);
              },
              child: Text('Salvar'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Cancelar'),
            )
          ],
        );
      },
    ),
  );
}
