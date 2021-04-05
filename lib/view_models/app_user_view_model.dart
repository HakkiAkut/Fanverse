import 'package:fandom_app/models/app_user.dart';
import 'package:fandom_app/repositories/user_repo.dart';
import 'package:fandom_app/services/base/auth_methods.dart';
import 'package:fandom_app/util/constants/app_state_enum.dart';
import 'package:fandom_app/util/init/service_locator.dart';
import 'package:flutter/cupertino.dart';

class AppUserVM with ChangeNotifier implements AuthMethods {
  AppState _state = AppState.IDLE;

  UserRepo _userRepo = serviceLocator<UserRepo>();
  AppUser _appUser;
  String errorMessage;
  final pattern = r'(^(?:[+])?[0-9]{10,12}$)';

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
      _appUser = await _userRepo.currentUser();
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
      _appUser = await _userRepo.signInWithEmail(email: email, pwd: pwd);
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
      return await _userRepo.signOut();
    } finally {
      state = AppState.IDLE;
    }
  }

  @override
  Future<AppUser> signUpWithEmail({String email, String pwd}) async {
    try {
      state = AppState.BUSY;
      _appUser = await _userRepo.signUpWithEmail(email: email, pwd: pwd);
      return _appUser;
    } finally {
      state = AppState.IDLE;
    }
  }
}