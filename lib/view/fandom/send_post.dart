import 'dart:io';
import 'package:fandom_app/models/app_user.dart';
import 'package:fandom_app/models/fandom.dart';
import 'package:fandom_app/models/posts.dart';
import 'package:fandom_app/util/methods/pick_image.dart';
import 'package:fandom_app/view_models/fandom_more_view_model.dart';
import 'package:flutter/material.dart';

class SendPost {
  final _formKey = GlobalKey<FormState>();
  File postImage;
  Posts post = Posts();

  dialog({BuildContext context, Fandom fandom, AppUser appUser}) {
    return showDialog(
      context: context,
      barrierDismissible: true,
      useRootNavigator: true,
      builder: (context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return AlertDialog(
              title: Text("Yapılan işi ekle"),
              content: SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: "Post",
                        ),
                        onSaved: (value) {
                          post.text = value;
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
                RaisedButton(
                  onPressed: () {
                    if (_formKey.currentState.validate()) {
                      _formKey.currentState.save();
                      post.uid = appUser.uid;
                      post.fid = fandom.fid;
                      post.username = appUser.username;
                      postImage!= null ? post.imageUrl=postImage.path: post.imageUrl="";
                      FandomMoreVM().setPost(post: post);
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
