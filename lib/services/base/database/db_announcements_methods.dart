import 'package:fandom_app/models/announcements.dart';
import 'package:flutter/cupertino.dart';

abstract class AnnouncementsMethods {
  Stream<List<Announcements>> getAnnouncements({int limit, String fid});
  Future<bool> setAnnouncement({@required Announcements announcements});
}