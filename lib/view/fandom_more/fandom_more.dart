import 'package:fandom_app/models/announcements.dart';
import 'package:fandom_app/models/fandom.dart';
import 'package:fandom_app/models/posts.dart';
import 'package:fandom_app/util/components/text_style.dart';
import 'package:fandom_app/util/constants/dynamic_size.dart';
import 'package:fandom_app/util/constants/navigation_constants.dart';
import 'package:fandom_app/util/constants/palette.dart';
import 'package:fandom_app/view/fandom_more/fandom_announcements.dart';
import 'package:fandom_app/view/fandom_more/fandom_posts.dart';
import 'package:fandom_app/view/fandom_more/send_announcement.dart';
import 'package:fandom_app/view/fandom_more/send_post.dart';
import 'package:fandom_app/view_models/app_user_view_model.dart';
import 'package:fandom_app/view_models/fandom_more_view_model.dart';
import 'package:fandom_app/view_models/fandom_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:provider/provider.dart';

class FandomMore extends StatefulWidget {
  final Fandom fandom;

  const FandomMore({Key key, this.fandom}) : super(key: key);

  @override
  _FandomMoreState createState() => _FandomMoreState();
}

class _FandomMoreState extends State<FandomMore> {
  int _current = 0;

  @override
  Widget build(BuildContext context) {
    print("it works" + widget.fandom.fid);
    final _appUserVM = Provider.of<AppUserVM>(context);
    return Scaffold(
      body: CustomScrollView(
        primary: false,
        slivers: [
          SliverAppBar(
            actions: [
              TextButton(
                child: Icon(
                    widget.fandom.members[_appUserVM.appUser.uid] != true
                        ? Icons.bookmark_border
                        : Icons.bookmark),
                onPressed: () async {
                  bool b1 = await FandomVM().joinFandom(
                      uid: _appUserVM.appUser.uid, fandom: widget.fandom);
                  if (b1 != null && b1 != false) {
                    setState(() {
                      widget.fandom.members[_appUserVM.appUser.uid] = true;
                    });
                  }
                },
              ),
            ],
            expandedHeight: DynamicSize.dynamicWidth(context, 0.75),
            pinned: true,
            primary: true,
            backgroundColor: Palette.MAIN_COLOR,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.network(
                widget.fandom.imageUrl,
                fit: BoxFit.cover,
              ),
              title: Text(
                widget.fandom.name,
                style: labelText.copyWith(fontSize: 15),
              ),
            ),
          ),
          fandomTabs(context)[_current],
        ],
      ),
      floatingActionButton: Stack(
        alignment: Alignment.bottomRight,
        children: [
          Positioned(
            right: 3,
            bottom: 70,
            child: _current == 0
                ? widget.fandom.admins[_appUserVM.appUser.uid] != true
                    ? Container()
                    : FloatingActionButton(
                        mini: true,
                        onPressed: () {
                          SendAnnouncement().dialog(
                            context: context,
                            fandom: widget.fandom,
                          );
                        },
                        child: Icon(Icons.add),
                      )
                : widget.fandom.members[_appUserVM.appUser.uid] != true
                    ? Container()
                    : FloatingActionButton(
                        mini: true,
                        onPressed: () {
                          SendPost().dialog(
                              context: context,
                              fandom: widget.fandom,
                              appUser: _appUserVM.appUser);
                        },
                        child: Icon(Icons.add),
                      ),
          ),
          SpeedDial(
            icon: Icons.add,
            activeIcon: Icons.remove,
            overlayColor: Colors.black,
            overlayOpacity: 0.6,
            children: [
              SpeedDialChild(
                  child: Icon(Icons.add_circle),
                  label: "Characters",
                  onTap: () {
                    Navigator.pushNamed(context, NavigationConstants.PAGES_MORE,
                        arguments: <String>[
                          widget.fandom.pageClasses[
                              widget.fandom.pageClasses.keys.first],
                          widget.fandom.pageClasses.keys.first
                        ]);
                  }),
            ],
          )
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _current,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.announcement), label: "Main"),
          BottomNavigationBarItem(icon: Icon(Icons.add_comment), label: "Posts")
        ],
        onTap: (index) {
          setState(() {
            _current = index;
          });
        },
      ),
    );
  }

  List<Widget> fandomTabs(BuildContext context) {
    return [
      SliverToBoxAdapter(
        child: Container(
          padding: EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(widget.fandom.description),
              StreamProvider<List<Announcements>>.value(
                value: FandomMoreVM().getAnnouncements(fid: widget.fandom.fid),
                initialData: [],
                child: FandomAnnouncements(),
                updateShouldNotify: (prev, now) => true,
              ),
            ],
          ),
        ),
      ),
      SliverToBoxAdapter(
        child: StreamProvider<List<Posts>>.value(
          value: FandomMoreVM().getPostsByFID(fid: widget.fandom.fid),
          initialData: [],
          child: FandomPosts(),
          updateShouldNotify: (prev, now) => true,
        ),
      ),
    ];
  }
}
