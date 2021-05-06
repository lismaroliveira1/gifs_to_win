import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:gifs_to_win/view/commons/build_form.dart';

Future buildShowModalDialog({
  @required BuildContext context,
  @required Map imageMap,
  @required Function onChanged,
  @required String errorText,
  @required TextEditingController controller,
  @required Function(String value) onSubmited,
}) {
  return showModal(
    configuration: FadeScaleTransitionConfiguration(
      transitionDuration: Duration(milliseconds: 500),
      reverseTransitionDuration: Duration(milliseconds: 350),
    ),
    context: context,
    builder: (contextDialog) => AlertDialog(
      content: Container(
        width: MediaQuery.of(context).size.width * 0.8,
        child: buildForm(
          labelText: 'Editar Gif',
          hintText: imageMap['title'],
          onChanged: (value) => onChanged(value),
          errorText: errorText,
          controller: controller,
          onSubmited: (value) => onSubmited(value),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(contextDialog).pop(),
          child: Text('Cancelar'),
        )
      ],
    ),
  );
}
