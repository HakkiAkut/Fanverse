import 'package:cloud_firestore/cloud_firestore.dart';
import 'file:///D:/repo/fandom_app/fandom_app/lib/util/methods/random_string_generator.dart';

class Posts {
  String id;
  String username;
  String fid;// fandom id
  String uid;
  String text;
  String imageUrl;
  Timestamp date;

  Posts({this.id, this.username, this.fid, this.uid, this.text, this.imageUrl, this.date});

  Map<String,dynamic> toMap(){
    return{
      "id": id ?? RandomStringGenerator().getRandomString(5),
      "username": username,
      "fid": fid,
      "uid": uid,
      "text": text,
      "date": date ?? FieldValue.serverTimestamp(),
      "imageUrl": imageUrl,
      "milisecond": DateTime.now().toUtc().millisecond,
    };
  }

  factory Posts.fromMap(Map<String, dynamic> map) {
    return Posts(
      id: map['id'] as String,
      username: map['username'] as String,
      uid: map['uid'] as String,
      text: map['text'] as String,
      imageUrl: map['url'] as String,
      date: map['date'] as Timestamp,
      fid: map['fid'] as String,
    );
  }
}