import 'package:fandom_app/models/posts.dart';
import 'package:fandom_app/util/components/text_style.dart';
import 'package:fandom_app/util/constants/dynamic_size.dart';
import 'package:fandom_app/util/constants/palette.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

Container postListTile(
    {@required BuildContext context, @required Posts posts, bool isDarkMode}) {
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
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              posts.username,
              style: labelText.copyWith(
                  fontSize: 18, color: Palette.getTextColor(isDarkMode).withOpacity(0.8)),
            ),
            Text(
              posts.date != null
                  ? DateFormat.yMMMd().format(posts.date.toDate())
                  : "",
              style: labelText.copyWith(color: Palette.getTextColor(isDarkMode).withOpacity(0.8)),
            )
          ],
        ),
        SizedBox(
          height: 8.0,
        ),
        Text(
          posts.text,
          style: labelText.copyWith(
            color: Palette.getTextColor(isDarkMode).withOpacity(0.9),
          ),
        ),
        SizedBox(
          height: 4.0,
        ),
        posts.imageUrl != ""
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
                    image: NetworkImage(posts.imageUrl),
                  ),
                ),
              )
            : Container(),
        SizedBox(
          height: 8.0,
        ),
      ],
    ),
  );
}
