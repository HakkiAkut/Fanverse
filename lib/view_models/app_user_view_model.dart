import 'package:fandom_app/models/app_user.dart';
import 'package:fandom_app/repositories/repository.dart';
import 'package:fandom_app/services/base/auth_methods.dart';
import 'package:fandom_app/util/constants/app_state_enum.dart';
import 'package:fandom_app/util/init/service_locator.dart';
import 'package:flutter/cupertino.dart';

class AppUserVM with ChangeNotifier implements AuthMethods {
  AppState _state = AppState.IDLE;

  Repository _repository = serviceLocator<Repository>();
  AppUser _appUser;

  AppUser get appUser => _appUser;

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
  Future<AppUser> signUpWithEmail({String email, String pwd}) async {
    try {
      state = AppState.BUSY;
      _appUser = await _repository.signUpWithEmail(email: email, pwd: pwd);
      return _appUser;
    } finally {
      state = AppState.IDLE;
    }
  }
}