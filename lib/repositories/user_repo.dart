import 'package:fandom_app/models/app_user.dart';
import 'package:fandom_app/services/base/auth_methods.dart';
import 'package:fandom_app/services/firebase/auth.dart';
import 'package:fandom_app/util/constants/web_service_enum.dart';
import 'package:fandom_app/util/init/service_locator.dart';

/// user repository, manages web services for Authentication methods
/// If WebService is FIREBASE then it will work with firebase methods
/// otherwise if there is another service it will work with other one.
/// Works like DAO manager basically.
class UserRepo implements AuthMethods{
  Auth _auth = serviceLocator<Auth>();
  WebService _webService = WebService.FIREBASE;
  @override
  Future<AppUser> currentUser() async {
    if(_webService == WebService.FIREBASE){
      AppUser appUser = await _auth.currentUser();
      if (appUser != null) {
        return appUser;
      }
    }
    return null;
  }

  @override
  Future<AppUser> signInWithEmail({String email, String pwd}) async {
    if(_webService == WebService.FIREBASE){
      AppUser appUser = await _auth.signInWithEmail(email: email,pwd: pwd);
      if (appUser != null) {
        return appUser;
      }
    }
    return null;
  }

  @override
  Future<bool> signOut() async {
    if (_webService == WebService.FIREBASE) {
      return await _auth.signOut();
    } else {
      return null;
    }
  }

}