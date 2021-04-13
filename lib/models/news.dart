import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class News {
  String id;
  String title;
  String text;
  String url;
  Timestamp date;

  News({@required this.id,@required this.title,@required this.text, this.url, @required this.date});

  factory News.fromMap(Map<String, dynamic> map) {
    return News(
      id: map['id'] as String,
      title: map['title'] as String,
      text: map['text'] as String,
      url: map['url'] as String,
      date: map['date'] as Timestamp,
    );
  }
}
