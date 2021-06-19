import 'package:fandom_app/models/fandom.dart';

abstract class FandomMethods {
  Stream<List<Fandom>> getFandom();
  Stream<List<Fandom>> getFandomByUID({String uid});
  Future<bool> joinFandom({String uid, Fandom fandom, bool changeTo});
  Future<bool> createFandom({Fandom fandom});
}