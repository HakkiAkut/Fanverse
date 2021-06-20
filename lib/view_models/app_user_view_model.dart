import 'package:fandom_app/models/app_user.dart';
import 'package:fandom_app/repositories/repository.dart';
import 'package:fandom_app/services/base/auth_methods.dart';
import 'package:fandom_app/services/base/database/db_user_methods.dart';
import 'package:fandom_app/util/constants/app_state_enum.dart';
import 'package:fandom_app/util/init/service_locator.dart';
import 'package:flutter/cupertino.dart';

class AppUserVM with ChangeNotifier implements AuthMethods, UserMethods {
  AppState _state = AppState.IDLE;

  Repository _repository = serviceLocator<Repository>();
  AppUser _appUser;
  bool _isDarkTheme = false;

  AppUser get appUser => _appUser;

  darkTheme(bool isDarkTheme){
    _isDarkTheme = isDarkTheme;
  }

  bool get isDarkTheme => _isDarkTheme;

  AppState get state => _state;

  AppUserVM() {
    currentUser();
  }

  set state(AppState value) {
    _state = value;
    notifyListeners();
  }

  @override
  Future<AppUser> currentUser() async {
    try {
      state = AppState.BUSY;
      _appUser = await _repository.currentUser();
      if (_appUser != null) {
        return _appUser;
      } else {
        return null;
      }
    } finally {
      state = AppState.IDLE;
    }
  }

  @override
  Future<AppUser> signInWithEmail({String email, String pwd}) async {
    try {
      state = AppState.BUSY;
      _appUser = await _repository.signInWithEmail(email: email, pwd: pwd);
      return _appUser;
    } finally {
      state = AppState.IDLE;
    }
  }

  @override
  Future<bool> signOut() async {
    try {
      state = AppState.BUSY;
      _appUser = null;
      return await _repository.signOut();
    } finally {
      state = AppState.IDLE;
    }
  }

  @override
  Future<AppUser> signUpWithEmail({String email, String pwd, String username}) async {
    try {
      state = AppState.BUSY;
      _appUser = await _repository.signUpWithEmail(email: email, pwd: pwd, username: username);
      return _appUser;
    } finally {
      state = AppState.IDLE;
    }
  }

  @override
  Future<AppUser> signInWithGoogle() async {
    try {
      state = AppState.BUSY;
      _appUser = await _repository.signInWithGoogle();
      return _appUser;
    } finally {
      state = AppState.IDLE;
    }
  }

  @override
  Future<AppUser> getUser({@required String uid}) async {
    return await _repository.getUser(uid: uid);
  }

  @override
  Future<bool> setUser({@required AppUser appUser}) async {
    return await _repository.setUser(appUser: appUser);
  }
}
