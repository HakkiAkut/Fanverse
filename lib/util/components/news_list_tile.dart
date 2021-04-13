import 'package:fandom_app/models/news.dart';
import 'package:fandom_app/util/components/text_style.dart';
import 'package:fandom_app/util/constants/colors.dart';
import 'package:fandom_app/util/constants/dynamic_size.dart';
import 'package:flutter/material.dart';

Container newsListTile({@required BuildContext context, @required News news}) {
  return Container(
    decoration: BoxDecoration(color: boldColor),
    child: Column(
      children: [
        Container(
          width: dynamicWidth(context, 0.95),
          height: dynamicWidth(context, 0.75),
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
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
        Text(
          news.title,
          style: labelText.copyWith(
              fontSize: 18, color: Colors.white.withOpacity(0.8)),
        ),
        Text(
          news.text,
          maxLines: 3,
          style: labelText.copyWith(
            color: Colors.white.withOpacity(0.9),
          ),
        ),
      ],
    ),
  );
}
