import 'package:fandom_app/models/app_user.dart';
import 'package:fandom_app/models/news.dart';
import 'package:fandom_app/services/base/auth_methods.dart';
import 'package:fandom_app/services/base/database/db_news_methods.dart';
import 'package:fandom_app/services/base/database/db_user_methods.dart';
import 'package:fandom_app/services/firebase/auth.dart';
import 'package:fandom_app/services/firebase/firestore_db.dart';
import 'package:fandom_app/util/constants/database__service_enum.dart';
import 'package:fandom_app/util/constants/web_service_enum.dart';
import 'package:fandom_app/util/init/service_locator.dart';
import 'package:flutter/material.dart';

/// user repository, manages web services for Authentication methods
/// If WebService is FIREBASE then it will work with firebase methods
/// otherwise if there is another service it will work with other one.
/// Works like DAO manager basically.
class Repository implements AuthMethods, NewsMethods, UserMethods {
  Auth _auth = serviceLocator<Auth>();
  FirestoreDB _firestore = serviceLocator<FirestoreDB>();
  WebService _webService = WebService.FIREBASE;
  DatabaseService _databaseService = DatabaseService.FIRESTORE;

  @override
  Future<AppUser> currentUser() async {
    if (_webService == WebService.FIREBASE) {
      AppUser appUser = await _auth.currentUser();
      if (appUser != null) {
        return await _firestore.getUser(uid:appUser.uid);
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
  Future<AppUser> signUpWithEmail({String email, String pwd,String username}) async {
    if (_webService == WebService.FIREBASE) {
      AppUser appUser = await _auth.signUpWithEmail(email: email, pwd: pwd);
      if (appUser != null) {
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
  Future<AppUser> getUser({@required String uid}) {
    if (_databaseService == DatabaseService.FIRESTORE) {
      return _firestore.getUser(uid: uid);
    }
    return null;
  }

  @override
  Future<bool> setUser({@required AppUser appUser}) {
    if (_databaseService == DatabaseService.FIRESTORE) {
      return _firestore.setUser(appUser: appUser);
    }
    return null;
  }
}
