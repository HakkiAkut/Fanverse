import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fandom_app/models/news.dart';
import 'package:fandom_app/services/base/database_methods.dart';

class Firestore implements DatabaseMethods {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  StreamController ss;

  @override
  Stream<List<News>> getNews() {
    Stream<QuerySnapshot> qp = _firestore
        .collection('news')
        .orderBy('milisecond', descending: true)
        .snapshots();

    return qp.map(
        (docs) => docs.docs.map((doc) => News(title: doc['title'])).toList());

  }
}
