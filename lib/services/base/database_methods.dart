import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fandom_app/models/news.dart';

abstract class DatabaseMethods {

  //Future<bool> saveUser(AppUser appUser);
  //Future<AppUser> getUser(String userId);

  Stream<List<News>> getNews();
}