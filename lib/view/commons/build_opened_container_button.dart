import 'package:flutter/material.dart';

Widget buildOpenedContainerButton({
  @required Function(Map imageMap) callback,
  @required Map imageGif,
  @required String iconAsset,
}) {
  return Card(
    child: TextButton(
      onPressed: () => callback(imageGif),
      child: Container(
        height: 45,
        width: 45,
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(iconAsset),
          ),
        ),
      ),
    ),
  );
}
