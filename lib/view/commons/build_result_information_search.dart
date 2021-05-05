import 'package:flutter/material.dart';

Widget builResultInformationSearch(String searchName, Function closeCallback) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 18.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text("Resultados da pesquisa... $searchName"),
        IconButton(
          icon: Icon(Icons.close),
          onPressed: () {
            closeCallback();
          },
        )
      ],
    ),
  );
}
