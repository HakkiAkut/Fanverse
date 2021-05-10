import 'package:cloud_firestore/cloud_firestore.dart';

class Posts {
  String id;
  String fid;// fandom id
  String uid;
  String text;
  String imageUrl;
  Timestamp date;

  Posts({this.id, this.fid, this.uid, this.text, this.imageUrl, this.date});

  factory Posts.fromMap(Map<String, dynamic> map) {
    return Posts(
      id: map['id'] as String,
      uid: map['uid'] as String,
      text: map['text'] as String,
      imageUrl: map['url'] as String,
      date: map['date'] as Timestamp,
      fid: map['fid'] as String,
    );
  }

}