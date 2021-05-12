import 'package:fandom_app/models/pages.dart';
import 'package:fandom_app/util/components/text_style.dart';
import 'package:fandom_app/util/constants/dynamic_size.dart';
import 'package:fandom_app/util/constants/palette.dart';
import 'package:flutter/material.dart';

class PagesView extends StatefulWidget {
  final Pages page;

  const PagesView({Key key, this.page}) : super(key: key);

  @override
  _PagesViewState createState() => _PagesViewState();
}

class _PagesViewState extends State<PagesView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        primary: false,
        slivers: [
          SliverAppBar(
            expandedHeight: DynamicSize.dynamicWidth(context, 0.75),
            pinned: true,
            primary: true,
            backgroundColor: Palette.MAIN_COLOR,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.network(
                widget.page.imageUrl,
                fit: BoxFit.cover,
              ),
              title: Text(
                widget.page.name,
                style: labelText.copyWith(fontSize: 15),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              padding: EdgeInsets.all(10),
              child: Text(
                widget.page.text,
                style: labelText.copyWith(
                  color: Colors.black.withOpacity(0.9),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
