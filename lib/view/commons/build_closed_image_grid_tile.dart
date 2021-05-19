import 'package:flutter/material.dart';

Widget buildClosedImageGridTile(
  double edge,
  List<Map> imageList,
  int index,
) {
  return Card(
    elevation: 12,
    child: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 4),
            child: Container(
              height: edge,
              width: edge,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(8)),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(imageList[index]['image']['url']),
                ),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
