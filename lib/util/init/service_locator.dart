import 'package:fandom_app/repositories/repository.dart';
import 'package:fandom_app/services/firebase/auth.dart';
import 'package:fandom_app/services/firebase/firestore_db.dart';
import 'package:get_it/get_it.dart';

GetIt serviceLocator = GetIt.instance;

void initializeLocator() {
  serviceLocator
      .registerLazySingleton(() => Auth()); // Firebase Authentication Service
  serviceLocator.registerLazySingleton(() => Repository()); // User repository
  serviceLocator.registerLazySingleton(() => FirestoreDB()); // Firestore Database Service
}
