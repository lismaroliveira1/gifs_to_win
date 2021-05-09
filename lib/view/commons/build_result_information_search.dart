import 'package:flutter/material.dart';

import '../../i18n/i18n.dart';

Widget builResultInformationSearch(String searchName, Function closeCallback) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 18.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(R.translations.searchResult + "... $searchName"),
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
