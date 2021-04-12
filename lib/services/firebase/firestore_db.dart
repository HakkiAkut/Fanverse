import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fandom_app/models/news.dart';
import 'package:fandom_app/services/base/database_methods.dart';

class FirestoreDB implements DatabaseMethods {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Stream<List<News>> getNews() {
    Stream<QuerySnapshot> qp = _firestore
        .collection('news')
        .orderBy('milisecond', descending: true)
        .snapshots();

    return qp.map(
        (docs) => docs.docs.map((doc) => News.fromMap(doc.data())).toList());

  }
}
