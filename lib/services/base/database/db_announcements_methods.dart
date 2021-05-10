import 'package:fandom_app/models/announcements.dart';

abstract class AnnouncementsMethods {
  Stream<List<Announcements>> getAnnouncements({int limit});
}