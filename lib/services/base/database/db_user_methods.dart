import 'package:fandom_app/models/app_user.dart';
import 'package:flutter/cupertino.dart';

abstract class UserMethods {
  Future<bool> setUser({@required AppUser appUser});
  Future<AppUser> getUser({@required String uid});
}