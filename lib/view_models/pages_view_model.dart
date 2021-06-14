import 'dart:io';

import 'package:fandom_app/models/pages.dart';
import 'package:fandom_app/repositories/repository.dart';
import 'package:fandom_app/services/base/database/db_pages_methods.dart';
import 'package:fandom_app/util/constants/app_state_enum.dart';
import 'package:fandom_app/util/init/service_locator.dart';
import 'package:flutter/material.dart';

class PagesVM with ChangeNotifier implements PagesMethods {
  AppState _state = AppState.IDLE;
  Repository _repository = serviceLocator<Repository>();
  int limit = 10;

  AppState get state => _state;

  set state(AppState value) {
    _state = value;
    notifyListeners();
  }

  @override
  Stream<List<Pages>> getPages({String classId}) {
    return _repository.getPages(classId: classId);
  }

  @override
  Future<bool> createPage({Pages page, File file}) async {
    page.imageUrl =
        await _repository.uploadFile(uid: page.name, uploadedFile: file);
    return await _repository.createPage(page: page);
  }
}
