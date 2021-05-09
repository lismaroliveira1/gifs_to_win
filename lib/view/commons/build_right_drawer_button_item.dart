import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget buildRightDrawerButtonItem({
  @required String item,
  @required BuildContext context,
  @required Function(String page) callback,
  @required IconData icon,
  @required String page,
  @required bool reverse,
}) {
  return InkWell(
    onTap: () {
      Navigator.of(context).pop();
      Future.delayed(
        Duration(milliseconds: 500),
        callback(page),
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
                      fontSize: 14,
                    ),
                  ),
                ),
                Icon(icon)
              ],
            )
          : Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(icon),
                Container(
                  child: Text(
                    item,
                    style: GoogleFonts.itim(
                      fontSize: 14,
                    ),
                  ),
                ),
              ],
            ),
    ),
  );
}
