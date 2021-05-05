import 'package:fandom_app/models/news.dart';

abstract class NewsMethods {
  Stream<List<News>> getNews();
}