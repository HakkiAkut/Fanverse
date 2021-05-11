import 'dart:io';

import 'package:fandom_app/models/announcements.dart';
import 'package:fandom_app/models/posts.dart';
import 'package:fandom_app/repositories/repository.dart';
import 'package:fandom_app/services/base/database/db_announcements_methods.dart';
import 'package:fandom_app/services/base/database/db_posts_methods.dart';
import 'package:fandom_app/services/base/storage_methods.dart';
import 'package:fandom_app/util/constants/app_state_enum.dart';
import 'package:fandom_app/util/init/service_locator.dart';
import 'package:flutter/material.dart';

class FandomMoreVM
    with ChangeNotifier
    implements AnnouncementsMethods, PostsMethods, StorageMethods {
  AppState _state = AppState.IDLE;
  Repository _repository = serviceLocator<Repository>();
  int lim = 10;

  AppState get state => _state;

  set state(AppState value) {
    _state = value;
    notifyListeners();
  }

  @override
  Stream<List<Announcements>> getAnnouncements({int limit, String fid}) {
    print("announcements");
    return _repository.getAnnouncements(limit: lim, fid: fid);
  }

  @override
  Stream<List<Posts>> getPostsByFID({@required String fid}) {
    return _repository.getPostsByFID(fid: fid);
  }

  @override
  Future<bool> setPost({Posts post}) async {
    if (post.imageUrl != "") {
      post.imageUrl =
          await uploadFile(uid: post.uid, uploadedFile: File(post.imageUrl));
    }
    return _repository.setPost(post: post);
  }

  @override
  Future<bool> setAnnouncement({Announcements announcements}) async {
    if (announcements.imageUrl != "") {
      announcements.imageUrl = await uploadFile(
          uid: "${announcements.fid}_Announcement",
          uploadedFile: File(announcements.imageUrl));
    }
    return _repository.setAnnouncement(announcements: announcements);
  }

  @override
  Future<String> uploadFile({String uid, File uploadedFile}) {
    return _repository.uploadFile(uid: uid, uploadedFile: uploadedFile);
  }

  @override
  Stream<List<Posts>> getPostsByUID({@required String uid}) {
    return _repository.getPostsByUID(uid: uid);
  }
}
