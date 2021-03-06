import 'package:fandom_app/models/news.dart';
import 'package:fandom_app/util/components/button_style.dart';
import 'package:fandom_app/util/components/text_style.dart';
import 'package:fandom_app/util/constants/palette.dart';
import 'package:fandom_app/util/constants/dynamic_size.dart';
import 'package:fandom_app/util/constants/navigation_constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

Container newsListTile(
    {@required BuildContext context, @required News news, bool isDarkMode}) {
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
        Container(
          height: DynamicSize.dynamicWidth(context, 0.50),
          decoration: BoxDecoration(
            color: Palette.getMainColor(isDarkMode),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.15),
                blurRadius: 20,
                offset: Offset(0, 10),
              ),
            ],
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(news.url),
            ),
          ),
        ),
        SizedBox(
          height: 8.0,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              news.title,
              style: labelText.copyWith(
                  fontSize: 18,
                  color: Palette.getTextColor(isDarkMode).withOpacity(0.8)),
            ),
            Text(
              DateFormat.yMMMd().format(news.date.toDate()),
              style: labelText.copyWith(
                  color: Palette.getTextColor(isDarkMode).withOpacity(0.8)),
            )
          ],
        ),
        SizedBox(
          height: 8.0,
        ),
        Text(
          news.text,
          maxLines: 5,
          style: labelText.copyWith(
            color: Palette.getTextColor(isDarkMode).withOpacity(0.9),
          ),
        ),
        SizedBox(
          height: 4.0,
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.pushNamed(context, NavigationConstants.NEWS_MORE,
                arguments: news);
          },
          style: buttonStyle.copyWith(
              backgroundColor: MaterialStateProperty.all<Color>(
                  Palette.getMainColor(isDarkMode))),
          child: Text(
            "More",
            style: labelText,
          ),
        ),
      ],
    ),
  );
}
