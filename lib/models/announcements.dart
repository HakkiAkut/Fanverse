import 'package:cloud_firestore/cloud_firestore.dart';

class Announcements {
  String id;
  String fid; // fandom id
  String title;
  String text;
  String imageUrl;
  Timestamp date;

  Announcements(
  {this.id, this.fid, this.title, this.text, this.imageUrl, this.date});

  factory Announcements.fromMap(Map<String, dynamic> map) {
    return Announcements(
      id: map['id'] as String,
      title: map['title'] as String,
      text: map['text'] as String,
      imageUrl: map['url'] as String,
      date: map['date'] as Timestamp,
      fid: map['fid'],
    );
  }
}