import 'package:fandom_app/models/posts.dart';
import 'package:fandom_app/util/components/list_tiles/posts_tile.dart';
import 'package:fandom_app/view_models/app_user_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FandomPosts extends StatefulWidget {
  @override
  _FandomPostsState createState() => _FandomPostsState();
}

class _FandomPostsState extends State<FandomPosts> {
  @override
  Widget build(BuildContext context) {
    final _fandomMoreVM = Provider.of<List<Posts>>(context);
    final _appUserVM = Provider.of<AppUserVM>(context);
    return _fandomMoreVM.isEmpty
        ? CircularProgressIndicator()
        : ListView.separated(
            primary: false,
            itemBuilder: (context, index) {
              print("${_fandomMoreVM[index].username}");
              return postListTile(
                  context: context,
                  posts: _fandomMoreVM[index],
                  isDarkMode: _appUserVM.isDarkTheme);
            },
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            separatorBuilder: (context, index) {
              return SizedBox(
                height: 18.0,
              );
            },
            itemCount: _fandomMoreVM.length);
  }
}
