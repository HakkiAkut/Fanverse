import 'package:fandom_app/models/app_user.dart';
import 'package:flutter/cupertino.dart';

/// Base class for Authentication operations
abstract class AuthMethods{
  Future<AppUser> currentUser();
  Future<AppUser> signInWithEmail({@required String email, @required String pwd});
  Future<bool> signOut();
}