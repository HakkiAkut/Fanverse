import 'dart:io';

import 'package:fandom_app/models/announcements.dart';
import 'package:fandom_app/models/app_user.dart';
import 'package:fandom_app/models/fandom.dart';
import 'package:fandom_app/models/news.dart';
import 'package:fandom_app/models/pages.dart';
import 'package:fandom_app/models/posts.dart';
import 'package:fandom_app/services/base/auth_methods.dart';
import 'package:fandom_app/services/base/database/db_announcements_methods.dart';
import 'package:fandom_app/services/base/database/db_fandom_methods.dart';
import 'package:fandom_app/services/base/database/db_news_methods.dart';
import 'package:fandom_app/services/base/database/db_pages_methods.dart';
import 'package:fandom_app/services/base/database/db_posts_methods.dart';
import 'package:fandom_app/services/base/database/db_user_methods.dart';
import 'package:fandom_app/services/base/storage_methods.dart';
import 'package:fandom_app/services/firebase/auth.dart';
import 'package:fandom_app/services/firebase/firestore_db.dart';
import 'package:fandom_app/services/firebase/storage.dart';
import 'package:fandom_app/util/constants/StorageService.dart';
import 'package:fandom_app/util/constants/database__service_enum.dart';
import 'package:fandom_app/util/constants/web_service_enum.dart';
import 'package:fandom_app/util/init/service_locator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// user repository, manages web services for Authentication methods
/// If WebService is FIREBASE then it will work with firebase methods
/// otherwise if there is another service it will work with other one.
/// Works like DAO manager basically.
class Repository
    implements
        AuthMethods,
        NewsMethods,
        UserMethods,
        FandomMethods,
        AnnouncementsMethods,
        PostsMethods,
        StorageMethods, PagesMethods {
  Auth _auth = serviceLocator<Auth>();
  Storage _storage = serviceLocator<Storage>();
  FirestoreDB _firestore = serviceLocator<FirestoreDB>();
  WebService _webService = WebService.FIREBASE;
  StorageService _storageService = StorageService.FIREBASE;
  DatabaseService _databaseService = DatabaseService.FIRESTORE;

  @override
  Future<AppUser> currentUser() async {
    if (_webService == WebService.FIREBASE) {
      AppUser appUser = await _auth.currentUser();
      if (appUser != null) {
        return await _firestore.getUser(uid: appUser.uid);
      } else {
        return null;
      }
    }
    return null;
  }

  @override
  Future<AppUser> signInWithEmail({String email, String pwd}) async {
    if (_webService == WebService.FIREBASE) {
      AppUser appUser = await _auth.signInWithEmail(email: email, pwd: pwd);
      if (appUser != null) {
        return appUser;
      }
    }
    return null;
  }

  @override
  Future<bool> signOut() async {
    if (_webService == WebService.FIREBASE) {
      return await _auth.signOut();
    } else {
      return null;
    }
  }

  @override
  Future<AppUser> signUpWithEmail(
      {String email, String pwd, String username}) async {
    if (_webService == WebService.FIREBASE) {
      AppUser appUser = await _auth.signUpWithEmail(email: email, pwd: pwd);
      if (appUser != null) {
        appUser.username = username;
        await setUser(appUser: appUser);
        return appUser;
      }
    }
    return null;
  }

  @override
  Future<AppUser> signInWithGoogle() async {
    if (_webService == WebService.FIREBASE) {
      AppUser appUser = await _auth.signInWithGoogle();
      if (appUser != null) {
        return appUser;
      }
    }
    return null;
  }

  @override
  Stream<List<News>> getNews({int limit}) {
    if (_databaseService == DatabaseService.FIRESTORE) {
      return _firestore.getNews(limit: limit);
    }
    return null;
  }

  @override
  Future<AppUser> getUser({@required String uid}) async {
    if (_databaseService == DatabaseService.FIRESTORE) {
      return await _firestore.getUser(uid: uid);
    }
    return null;
  }

  @override
  Future<bool> setUser({@required AppUser appUser}) async {
    if (_databaseService == DatabaseService.FIRESTORE) {
      return await _firestore.setUser(appUser: appUser);
    }
    return null;
  }

  @override
  Stream<List<Fandom>> getFandom() {
    if (_databaseService == DatabaseService.FIRESTORE) {
      return _firestore.getFandom();
    }
    return null;
  }

  @override
  Stream<List<Announcements>> getAnnouncements({int limit, String fid}) {
    if (_databaseService == DatabaseService.FIRESTORE) {
      return _firestore.getAnnouncements(limit: limit, fid: fid);
    }
    return null;
  }

  @override
  Stream<List<Posts>> getPostsByFID({@required String fid}) {
    if (_databaseService == DatabaseService.FIRESTORE) {
      return _firestore.getPostsByFID(fid: fid);
    }
    return null;
  }

  @override
  Future<bool> setPost({Posts post}) {
    if (_databaseService == DatabaseService.FIRESTORE) {
      return _firestore.setPost(post: post);
    }
    return null;
  }

  @override
  Future<bool> setAnnouncement({Announcements announcements}) {
    if (_databaseService == DatabaseService.FIRESTORE) {
      return _firestore.setAnnouncement(announcements: announcements);
    }
    return null;
  }

  @override
  Future<String> uploadFile({String uid, File uploadedFile}) {
    if (_storageService == StorageService.FIREBASE) {
      return _storage.uploadFile(uid: uid, uploadedFile: uploadedFile);
    }
    return null;
  }

  @override
  Stream<List<Posts>> getPostsByUID({String uid}) {
    if (_databaseService == DatabaseService.FIRESTORE) {
      return _firestore.getPostsByUID(uid: uid);
    }
    return null;
  }

  @override
  Stream<List<Fandom>> getFandomByUID({String uid}) {
    if (_databaseService == DatabaseService.FIRESTORE) {
      return _firestore.getFandomByUID(uid: uid);
    }
    return null;
  }

  @override
  Future<bool> joinFandom({String uid, Fandom fandom}) async {
    if (_databaseService == DatabaseService.FIRESTORE) {
      return await _firestore.joinFandom(uid: uid, fandom: fandom);
    }
    return null;
  }

  @override
  Stream<List<Pages>> getPages({String classId}) {
    if (_databaseService == DatabaseService.FIRESTORE) {
      return _firestore.getPages(classId: classId);
    }
    return null;
  }
}
