import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

/// base error toast message

errorMessage({@required String message,bool durationShort}){
  return Fluttertoast.showToast(
      msg: message,
      toastLength: !durationShort ? Toast.LENGTH_LONG:Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.red,
      textColor: Colors.white,
      fontSize: 16.0
  );
}