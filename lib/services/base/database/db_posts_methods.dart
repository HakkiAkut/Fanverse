import 'package:fandom_app/models/posts.dart';
import 'package:flutter/cupertino.dart';

abstract class PostsMethods {
  Stream<List<Posts>> getPostsByFID({@required String fid});
  Stream<List<Posts>> getPostsByUID({@required String uid});
  Future<bool> setPost({@required Posts post});
}