import 'package:fandom_app/models/fandom.dart';
import 'package:fandom_app/repositories/repository.dart';
import 'package:fandom_app/services/base/database/db_fandom_methods.dart';
import 'package:fandom_app/util/constants/app_state_enum.dart';
import 'package:fandom_app/util/init/service_locator.dart';
import 'package:flutter/cupertino.dart';

class FandomVM with ChangeNotifier implements FandomMethods{
  AppState _state = AppState.IDLE;

  Repository _repository = serviceLocator<Repository>();
  List<Fandom> _allFandoms;
  AppState get state => _state;

  List<Fandom> get allFandoms => _allFandoms;

  set allFandoms(List<Fandom> value){
    _allFandoms = value;
    notifyListeners();
  }

  FandomVM(){
   getFandom();
   print("works 1");
  }

  set state(AppState value) {
    _state = value;
    notifyListeners();
  }

  @override
  Future<List<Fandom>> getFandom() async {
    try {
      state = AppState.BUSY;
      _allFandoms = await _repository.getFandom();
      if (_allFandoms != null && _allFandoms.isNotEmpty) {
        return _allFandoms;
      } else {
        return null;
      }
    } finally {
      state = AppState.IDLE;
    }
  }
}