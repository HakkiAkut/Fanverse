import 'package:fandom_app/models/fandom.dart';
import 'package:fandom_app/view/fandom/fandom_list.dart';
import 'package:fandom_app/view_models/fandom_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AllFandomsPage extends StatefulWidget {
  @override
  _AllFandomsPageState createState() => _AllFandomsPageState();
}

class _AllFandomsPageState extends State<AllFandomsPage> {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<Fandom>>.value(
      value: FandomVM().getFandom(),
      initialData: [],
      child: FandomList(title: "All Fandoms",),
      updateShouldNotify: (prev, now) => true,
    );
  }
}
