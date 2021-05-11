import 'dart:io';

abstract class StorageMethods {
  Future<String> uploadFile(
      {String uid, File uploadedFile});
}
