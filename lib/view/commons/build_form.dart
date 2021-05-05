import 'package:flutter/material.dart';

Widget buildForm({
  @required Function(String) onChanged,
  @required errorText,
}) {
  return Container(
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        decoration: InputDecoration(
          labelText: 'Pesquisar',
          errorText: errorText,
          labelStyle: TextStyle(
            fontSize: 16,
          ),
          border: OutlineInputBorder(),
        ),
        onChanged: onChanged,
      ),
    ),
  );
}
