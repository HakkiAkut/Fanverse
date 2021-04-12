import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fandom_app/models/news.dart';
import 'package:fandom_app/services/base/database_methods.dart';

class Firestore implements DatabaseMethods{
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  @override
  Stream<List<News>> getNews() {

  }

}