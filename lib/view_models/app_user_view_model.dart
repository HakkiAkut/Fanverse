import 'package:fandom_app/models/app_user.dart';
import 'package:fandom_app/services/base/auth_methods.dart';
import 'package:flutter/cupertino.dart';

class AppUserVM with ChangeNotifier implements AuthMethods{
  @override
  Future<AppUser> currentUser() {
    // TODO: implement currentUser
    throw UnimplementedError();
  }

  @override
  Future<AppUser> signInWithEmail({String email, String pwd}) {
    // TODO: implement signInWithEmail
    throw UnimplementedError();
  }

  @override
  Future<bool> signOut() {
    // TODO: implement signOut
    throw UnimplementedError();
  }

}