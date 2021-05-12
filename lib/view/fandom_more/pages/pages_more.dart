import 'package:fandom_app/models/pages.dart';
import 'package:fandom_app/view/fandom_more/pages/pages_view.dart';
import 'package:fandom_app/view_models/pages_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PagesMore extends StatefulWidget {
  final List<String> classInfo;
  // 0 classId
  // 1 className

  const PagesMore({Key key, this.classInfo}) : super(key: key);
  @override
  _PagesMoreState createState() => _PagesMoreState();
}

class _PagesMoreState extends State<PagesMore> {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<Pages>>.value(
      value: PagesVM().getPages(classId: widget.classInfo[0]),
      initialData: [],
      child: PagesView(title: widget.classInfo[1],),
      updateShouldNotify: (prev, now) => true,
    );
  }
}
