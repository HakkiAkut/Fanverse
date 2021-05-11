import 'dart:io';

import 'package:fandom_app/services/base/storage_methods.dart';
import 'package:fandom_app/util/methods/random_string_generator.dart';
import 'package:firebase_storage/firebase_storage.dart';

class Storage implements StorageMethods {
  final FirebaseStorage _firebaseStorage = FirebaseStorage.instance;
  Reference _reference;

  @override
  Future<String> uploadFile(
      {String uid, File uploadedFile}) async {
    _reference = _firebaseStorage
        .ref()
        .child(uid)
        .child(RandomStringGenerator().getRandomString(5));
    UploadTask uploadTask = _reference.putFile(uploadedFile);
    var url;
    try {
      await uploadTask
          .whenComplete(() async => url = await _reference.getDownloadURL());
    } catch (e) {
      return null;
    }

    return url;
  }
}
