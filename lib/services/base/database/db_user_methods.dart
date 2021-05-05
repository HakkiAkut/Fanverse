import 'package:fandom_app/models/app_user.dart';

abstract class UserMethods {
  Future<bool> saveUser(AppUser appUser);
  Future<AppUser> getUser(String userId);
}