import 'package:fandom_app/models/app_user.dart';
import 'package:flutter/cupertino.dart';

/// Base class for Authentication operations
abstract class AuthMethods{
  Future<AppUser> currentUser();
  Future<AppUser> signInWithEmail({@required String email, @required String pwd});
  Future<AppUser> signUpWithEmail({@required String email, @required String pwd,@required String username});
  Future<AppUser> signInWithGoogle();
  Future<bool> signOut();
}