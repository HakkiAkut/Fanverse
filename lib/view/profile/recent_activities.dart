import 'package:fandom_app/models/posts.dart';
import 'package:fandom_app/view/fandom_more/fandom_posts.dart';
import 'package:fandom_app/view_models/app_user_view_model.dart';
import 'package:fandom_app/view_models/fandom_more_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RecentActivities extends StatefulWidget {
  @override
  _RecentActivitiesState createState() => _RecentActivitiesState();
}

class _RecentActivitiesState extends State<RecentActivities> {
  @override
  Widget build(BuildContext context) {
    final _appUserVM = Provider.of<AppUserVM>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Recent Activities"),
      ),
      body: Container(
        child: StreamProvider<List<Posts>>.value(
          value: FandomMoreVM().getPostsByUID(uid: _appUserVM.appUser.uid),
          initialData: [],
          child: FandomPosts(),
          updateShouldNotify: (prev, now) => true,
        ),
      ),
    );
  }
}
