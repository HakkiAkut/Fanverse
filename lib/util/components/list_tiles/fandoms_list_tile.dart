import 'package:fandom_app/models/fandom.dart';
import 'package:fandom_app/util/components/text_style.dart';
import 'package:fandom_app/util/constants/dynamic_size.dart';
import 'package:fandom_app/util/constants/navigation_constants.dart';
import 'package:fandom_app/util/constants/palette.dart';
import 'package:flutter/material.dart';

Container fandomListTile(
    {@required BuildContext context, @required Fandom fandom}) {
  return Container(
    padding: EdgeInsets.all(5.0),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      color: Colors.white,
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
              image: NetworkImage(fandom.imageUrl),
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
              fandom.name,
              style: labelText.copyWith(
                  fontSize: 18, color: Colors.black.withOpacity(0.8)),
            ),
            Text(
              "${fandom.members.length}",
              style: labelText.copyWith(color: Colors.black.withOpacity(0.8)),
            )
          ],
        ),
        SizedBox(
          height: 8.0,
        ),
        Text(
          fandom.description,
          maxLines: 5,
          style: labelText.copyWith(
            color: Colors.black.withOpacity(0.9),
          ),
        ),
        SizedBox(
          height: 4.0,
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.pushNamed(context, NavigationConstants.FANDOM_MORE,
                arguments: fandom);
          },
          child: Text(
            "More",
            style: labelText,
          ),
        ),
      ],
    ),
  );
}
