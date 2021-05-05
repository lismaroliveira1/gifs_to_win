import 'package:flutter/material.dart';

Widget buildForm(
    {@required Function(String) onChanged,
    @required String errorText,
    @required TextEditingController controller,
    @required Function(String) onSubmited}) {
  return Container(
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        controller: controller,
        textInputAction: TextInputAction.search,
        decoration: InputDecoration(
          suffixIcon: IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              onSubmited(controller.text);
              controller.clear();
            },
          ),
          labelText: 'Pesquisar',
          errorText: errorText,
          labelStyle: TextStyle(
            fontSize: 16,
          ),
          border: OutlineInputBorder(),
        ),
        onChanged: onChanged,
        onFieldSubmitted: (value) {
          controller.clear();
        },
      ),
    ),
  );
}

class BuildForm extends StatelessWidget {
  final Function(String) onChanged;
  final String errorText;
  final TextEditingController controller;
  final Function(String) onSubmited;
  BuildForm({
    @required this.onChanged,
    @required this.errorText,
    @required this.controller,
    @required this.onSubmited,
  });
  @override
  Widget build(BuildContext context) {
    FocusScopeNode currentFocus = FocusScope.of(context);
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextFormField(
          controller: controller,
          textInputAction: TextInputAction.search,
          decoration: InputDecoration(
            suffixIcon: IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                onSubmited(controller.text);
                controller.clear();
                currentFocus.unfocus();
              },
            ),
            labelText: 'Pesquisar',
            errorText: errorText,
            labelStyle: TextStyle(
              fontSize: 16,
            ),
            border: OutlineInputBorder(),
          ),
          onChanged: onChanged,
          onFieldSubmitted: (value) {
            onSubmited(controller.text);
            controller.clear();
            currentFocus.unfocus();
          },
        ),
      ),
    );
  }
}
