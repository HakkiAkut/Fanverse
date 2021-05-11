import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fandom_app/util/constants/random_string_generator.dart';

class Announcements {
  String id;
  String fid; // fandom id
  String title;
  String text;
  String imageUrl;
  Timestamp date;

  Announcements(
  {this.id, this.fid, this.title, this.text, this.imageUrl, this.date});

  Map<String,dynamic> toMap(){
    return{
      "id": id ?? RandomStringGenerator().getRandomString(5),
      "title": title,
      "fid": fid,
      "text": text,
      "date": date ?? FieldValue.serverTimestamp(),
      "imageUrl": imageUrl,
    };
  }

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