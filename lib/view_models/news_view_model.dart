import 'package:fandom_app/models/news.dart';
import 'package:fandom_app/repositories/repository.dart';
import 'package:fandom_app/services/base/database_methods.dart';
import 'package:fandom_app/util/constants/app_state_enum.dart';
import 'package:fandom_app/util/init/service_locator.dart';
import 'package:flutter/material.dart';

class NewsVM with ChangeNotifier implements DatabaseMethods {
  AppState _state = AppState.IDLE;
  Repository _repository = serviceLocator<Repository>();
  int limit =10;

  AppState get state => _state;

  set state(AppState value) {
    _state = value;
    notifyListeners();
  }


  @override
  Stream<List<News>> getNews() {
    // Since it's stream, appState control doesn't needed
    return _repository.getNews(limit: limit);
  }
}
