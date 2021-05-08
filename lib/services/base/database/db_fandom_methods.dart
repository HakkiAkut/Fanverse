import 'package:fandom_app/models/fandom.dart';

abstract class FandomMethods {
  Future<List<Fandom>> getFandom();
}