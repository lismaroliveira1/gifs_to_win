import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

import '../../../presenter/presenter.dart';

Future editImageTitleDialog({
  @required BuildContext context,
  @required String title,
  @required String id,
  @required String url,
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
                hintText: title,
              )),
          actions: [
            ElevatedButton(
              onPressed: () async {
                await presenter.saveImage(
                  id: id,
                  title: title,
                  url: url,
                );
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
