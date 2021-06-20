import 'package:fandom_app/models/announcements.dart';
import 'package:fandom_app/util/components/text_style.dart';
import 'package:fandom_app/util/constants/dynamic_size.dart';
import 'package:fandom_app/util/constants/palette.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

Container announcementListTile(
    {@required BuildContext context, @required Announcements announcements, bool isDarkMode}) {
  return Container(
    padding: EdgeInsets.all(5.0),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      color: Palette.getBackground(isDarkMode),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.15),
          blurRadius: 20,
          offset: Offset(0, 10),
        ),
      ],
    ),
    child: Column(
      children: [
        announcements.imageUrl != null
            ? Container(
                height: DynamicSize.dynamicWidth(context, 0.50),
                decoration: BoxDecoration(
                  color: Palette.MAIN_COLOR.shade200,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.15),
                      blurRadius: 20,
                      offset: Offset(0, 10),
                    ),
                  ],
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(announcements.imageUrl),
                  ),
                ),
              )
            : Container(),
        SizedBox(
          height: 8.0,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              announcements.title,
              style: labelText.copyWith(
                  fontSize: 18, color: Palette.getTextColor(isDarkMode).withOpacity(0.8)),
            ),
            Text(
              announcements.date != null
                  ? DateFormat.yMMMd().format(announcements.date.toDate())
                  : "",
              style: labelText.copyWith(color: Palette.getTextColor(isDarkMode).withOpacity(0.8)),
            )
          ],
        ),
        SizedBox(
          height: 8.0,
        ),
        Text(
          announcements.text,
          style: labelText.copyWith(
            color: Palette.getTextColor(isDarkMode).withOpacity(0.9),
          ),
        ),
        SizedBox(
          height: 4.0,
        ),
      ],
    ),
  );
}
