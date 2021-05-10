import 'package:fandom_app/models/announcements.dart';
import 'package:fandom_app/models/posts.dart';
import 'package:fandom_app/repositories/repository.dart';
import 'package:fandom_app/services/base/database/db_announcements_methods.dart';
import 'package:fandom_app/services/base/database/db_posts_methods.dart';
import 'package:fandom_app/util/constants/app_state_enum.dart';
import 'package:fandom_app/util/init/service_locator.dart';
import 'package:flutter/material.dart';

class FandomMoreVM with ChangeNotifier implements AnnouncementsMethods, PostsMethods {
  AppState _state = AppState.IDLE;
  Repository _repository = serviceLocator<Repository>();
  int lim =10;

  AppState get state => _state;

  set state(AppState value) {
    _state = value;
    notifyListeners();
  }


  @override
  Stream<List<Announcements>> getAnnouncements({int limit, String fid}) {
    print("announcements");
    return _repository.getAnnouncements(limit: lim,fid: fid);
  }

  @override
  Stream<List<Posts>> getPostsByFID({@required int fid}) {
    return _repository.getPostsByFID(fid: fid);
  }
}