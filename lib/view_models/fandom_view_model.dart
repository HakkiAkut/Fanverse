import 'package:fandom_app/models/fandom.dart';
import 'package:fandom_app/repositories/repository.dart';
import 'package:fandom_app/services/base/database/db_fandom_methods.dart';
import 'package:fandom_app/util/constants/app_state_enum.dart';
import 'package:fandom_app/util/init/service_locator.dart';
import 'package:flutter/cupertino.dart';

class FandomVM with ChangeNotifier implements FandomMethods {
  AppState _state = AppState.IDLE;

  Repository _repository = serviceLocator<Repository>();
  List<Fandom> _allFandoms;
  List<Fandom> _myFandoms = [];

  AppState get state => _state;

  List<Fandom> get allFandoms => _allFandoms;

  List<Fandom> get myFandoms => _myFandoms;

  set allFandoms(List<Fandom> value) {
    _allFandoms = value;
    notifyListeners();
  }

  set myFandoms(List<Fandom> value) {
    _myFandoms = value;
    notifyListeners();
  }

  FandomVM() {
    getFandom();
    print("works 1");
  }

  set state(AppState value) {
    _state = value;
    notifyListeners();
  }

  @override
  Stream<List<Fandom>> getFandom() {
    return _repository.getFandom();
  }

  @override
  Stream<List<Fandom>> getFandomByUID({String uid}) {
    return _repository.getFandomByUID(uid: uid);
  }
}
