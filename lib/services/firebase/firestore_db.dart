import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fandom_app/models/app_user.dart';
import 'package:fandom_app/models/news.dart';
import 'package:fandom_app/services/base/database/db_news_methods.dart';

class FirestoreDB implements NewsMethods {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  
  

  @override
  Stream<List<News>> getNews({int limit}) {
    Stream<QuerySnapshot> qp = _firestore
        .collection('news')
        .orderBy('milisecond', descending: true).limit(10)
        .snapshots();

    return qp.map(
        (docs) => docs.docs.map((doc) => News.fromMap(doc.data())).toList());
  }

  @override
  Future<AppUser> getUser(String userId) {
    // TODO: implement getUser
    throw UnimplementedError();
  }

  @override
  Future<bool> saveUser(AppUser appUser) {
    // TODO: implement saveUser
    throw UnimplementedError();
  }
}
