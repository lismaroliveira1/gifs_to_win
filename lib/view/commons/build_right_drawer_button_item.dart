import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget buildRightDrawerButtonItem({
  @required String item,
  @required BuildContext context,
  @required Function(String name) callback,
  @required IconData icon,
  @required bool reverse,
}) {
  return InkWell(
    onTap: () {
      Navigator.of(context).pop();
      Future.delayed(
        Duration(milliseconds: 500),
        callback(item),
      );
    },
    child: Padding(
      padding: const EdgeInsets.all(14.0),
      child: reverse
          ? Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  child: Text(
                    item,
                    style: GoogleFonts.itim(
                      fontSize: 20,
                      color: Colors.blueGrey[100],
                    ),
                  ),
                ),
                Icon(
                  icon,
                  color: Colors.blueGrey[100],
                )
              ],
            )
          : Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(
                  icon,
                  color: Colors.blueGrey[100],
                ),
                Container(
                  child: Text(
                    item,
                    style: GoogleFonts.itim(
                      fontSize: 14,
                      color: Colors.blueGrey[100],
                    ),
                  ),
                ),
              ],
            ),
    ),
  );
}
