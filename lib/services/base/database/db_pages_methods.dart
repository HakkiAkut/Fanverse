import 'package:fandom_app/models/pages.dart';

abstract class PagesMethods{
  Stream<List<Pages>> getPages({String classId});
}