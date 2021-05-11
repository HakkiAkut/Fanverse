import 'package:fandom_app/models/fandom.dart';
import 'package:fandom_app/view/fandom/fandom_list.dart';
import 'package:fandom_app/view_models/app_user_view_model.dart';
import 'package:fandom_app/view_models/fandom_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyFandomsPage extends StatefulWidget {
  @override
  _MyFandomsPageState createState() => _MyFandomsPageState();
}

class _MyFandomsPageState extends State<MyFandomsPage> {
  @override
  Widget build(BuildContext context) {
    final _appUserVM = Provider.of<AppUserVM>(context);
    return StreamProvider<List<Fandom>>.value(
      value: FandomVM().getFandomByUID(uid: _appUserVM.appUser.uid),
      initialData: [],
      child: FandomList(title: "My Fandoms",),
      updateShouldNotify: (prev, now) => true,
    );
  }
}
