import 'dart:io';

import 'package:fandom_app/models/announcements.dart';
import 'package:fandom_app/models/app_user.dart';
import 'package:fandom_app/models/fandom.dart';
import 'package:fandom_app/util/methods/pick_image.dart';
import 'package:fandom_app/view_models/fandom_more_view_model.dart';
import 'package:flutter/material.dart';

class SendAnnouncement{
  final _formKey = GlobalKey<FormState>();
  File postImage;
  Announcements announcement = Announcements();

  dialog({BuildContext context, Fandom fandom}) {
    return showDialog(
      context: context,
      barrierDismissible: true,
      useRootNavigator: true,
      builder: (context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return AlertDialog(
              title: Text("Announcement"),
              content: SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: "Title",
                        ),
                        onSaved: (value) {
                          announcement.title = value;
                        },
                        validator: (value) {
                          if (value == null || value == '') {
                            return 'cannot be empty!';
                          } else {
                            return null;
                          }
                        },
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: "Announcement",
                        ),
                        onSaved: (value) {
                          announcement.text = value;
                        },
                        validator: (value) {
                          if (value == null || value == '') {
                            return 'cannot be empty!';
                          } else {
                            return null;
                          }
                        },
                      ),
                      TextButton(
                        onPressed: () async {
                          postImage = await PickImage().chooseFile();
                        },
                        child: Icon(Icons.perm_media_outlined),
                      ),
                    ],
                  ),
                ),
              ),
              actions: <Widget>[
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState.validate()) {
                      _formKey.currentState.save();
                      announcement.fid = fandom.fid;
                      postImage!= null ? announcement.imageUrl=postImage.path: announcement.imageUrl="";
                      FandomMoreVM().setAnnouncement(announcements: announcement);
                    }
                  },
                  child: Text("Post"),
                )
              ],
            );
          },
        );
      },
    );
  }

}