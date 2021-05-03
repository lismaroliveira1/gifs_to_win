import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

Future editImageTitleDialog({
  @required BuildContext context,
  @required String title,
}) {
  return Future.delayed(
    Duration(milliseconds: 300),
    () => showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          title: Text('Editar'),
          content: TextField(
              decoration: InputDecoration(
            labelText: 'Novo título',
            hintText: title,
          )),
          actions: [
            ElevatedButton(
              onPressed: () {},
              child: Text('Salvar'),
            ),
            ElevatedButton(
              onPressed: () {},
              child: Text('Cancelar'),
            )
          ],
        );
      },
    ),
  );
}
