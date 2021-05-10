import 'package:fandom_app/models/announcements.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FandomAnnouncements extends StatefulWidget {

  @override
  _FandomAnnouncementsState createState() => _FandomAnnouncementsState();
}

class _FandomAnnouncementsState extends State<FandomAnnouncements> {

  @override
  Widget build(BuildContext context) {
    final _fandomMoreVM = Provider.of<List<Announcements>>(context);
    return _fandomMoreVM.isEmpty
        ? CircularProgressIndicator()
        : ListView.separated(
        primary: false,
        itemBuilder: (context, index) {
          print("${_fandomMoreVM[index].title}");
          return Text("title: ${_fandomMoreVM[index].title}");
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
