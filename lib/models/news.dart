import 'package:flutter/material.dart';

class News {
  String text;
  String url;
  String date;

  News({@required this.text, this.url, @required this.date});

  factory News.fromMap(Map<String, dynamic> map) {
    return News(
      text: map['text'] as String,
      url: map['url'] as String,
      date: map['date'] as String,
    );
  }
}
