import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fandom_app/models/announcements.dart';
import 'package:fandom_app/models/app_user.dart';
import 'package:fandom_app/models/fandom.dart';
import 'package:fandom_app/models/news.dart';
import 'package:fandom_app/models/posts.dart';
import 'package:fandom_app/services/base/database/db_announcements_methods.dart';
import 'package:fandom_app/services/base/database/db_fandom_methods.dart';
import 'package:fandom_app/services/base/database/db_news_methods.dart';
import 'package:fandom_app/services/base/database/db_posts_methods.dart';
import 'package:fandom_app/services/base/database/db_user_methods.dart';
import 'package:flutter/material.dart';

class FirestoreDB
    implements NewsMethods, UserMethods, FandomMethods, AnnouncementsMethods, PostsMethods {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Stream<List<News>> getNews({int limit}) {
    Stream<QuerySnapshot> qp = _firestore
        .collection('news')
        .orderBy('milisecond', descending: true)
        .limit(10)
        .snapshots();

    return qp.map(
        (docs) => docs.docs.map((doc) => News.fromMap(doc.data())).toList());
  }

  @override
  Future<AppUser> getUser({@required String uid}) async {
    try {
      DocumentSnapshot user =
          await _firestore.collection("users").doc(uid).get();
      Map<String, dynamic> userData = user.data();
      AppUser newUser = AppUser.fromMap(userData);
      print("user object: " + newUser.uid);
      return newUser;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  @override
  Future<bool> setUser({@required AppUser appUser}) async {
    try {
      await _firestore
          .collection("users")
          .doc(appUser.uid)
          .set(appUser.toMap());
      return true;
    } catch (e) {
      print(e.toString());
      return false;
    }
  }

  @override
  Future<List<Fandom>> getFandom() async {
    QuerySnapshot qp = await _firestore.collection("Fandom").get();
    return qp.docs.map((doc) => Fandom.fromMap(doc.data())).toList();
  }

  @override
  Stream<List<Announcements>> getAnnouncements({int limit, String fid}) {
    Stream<QuerySnapshot> qp = _firestore
        .collection('announcements')
        .where("fid", isEqualTo: fid)
        .orderBy('milisecond', descending: true)
        .limit(limit)
        .snapshots();

    return qp.map((docs) =>
        docs.docs.map((doc) => Announcements.fromMap(doc.data())).toList());
  }

  @override
  Stream<List<Posts>> getPostsByFID({@required String fid}) {
    Stream<QuerySnapshot> qp = _firestore
        .collection('posts')
        .where("fid", isEqualTo: fid)
        .orderBy('milisecond', descending: true)
        .snapshots();

    return qp.map((docs) =>
    docs.docs.map((doc) => Posts.fromMap(doc.data())).toList());
  }

  @override
  Future<bool> setPost({Posts post}) async {
    try {
      await _firestore
          .collection("posts")
          .doc(post.id)
          .set(post.toMap());
      return true;
    } catch (e) {
      print(e.toString());
      return false;
    }

  }

  @override
  Future<bool> setAnnouncement({Announcements announcements}) async {
    try {
      await _firestore
          .collection("announcements")
          .doc(announcements.id)
          .set(announcements.toMap());
      return true;
    } catch (e) {
      print(e.toString());
      return false;
    }

  }
}
