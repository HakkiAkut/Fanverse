import 'package:fandom_app/services/firebase/auth.dart';
import 'package:get_it/get_it.dart';

GetIt serviceLocator = GetIt.instance;

void initializeLocator() {
  serviceLocator
      .registerLazySingleton(() => Auth()); // Firebase Authentication Service
}
