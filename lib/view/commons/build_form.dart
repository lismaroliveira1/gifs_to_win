import 'package:flutter/material.dart';

Widget buildForm({
  @required Function(String) onChanged,
  @required String errorText,
  @required TextEditingController controller,
  @required Function(String) onSubmited,
  @required String labelText,
  @required String hintText,
  @required IconData icon,
}) {
  return Container(
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        controller: controller,
        textInputAction: TextInputAction.search,
        decoration: InputDecoration(
          suffixIcon: IconButton(
            icon: Icon(icon),
            onPressed: () {
              onSubmited(controller.text);
              controller.clear();
            },
          ),
          labelText: labelText,
          errorText: errorText,
          hintText: hintText,
          labelStyle: TextStyle(
            fontSize: 16,
          ),
        ),
        onChanged: onChanged,
        onFieldSubmitted: (value) {
          onSubmited(controller.text);
          controller.clear();
        },
      ),
    ),
  );
}
