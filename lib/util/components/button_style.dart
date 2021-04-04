import 'package:fandom_app/util/components/text_style.dart';
import 'package:flutter/material.dart';

/// base button style
final buttonStyle = ButtonStyle(
  backgroundColor: MaterialStateProperty.all<Color>(Colors.orange.shade900),
  elevation: MaterialStateProperty.all<double>(2.0),
  textStyle: MaterialStateProperty.all<TextStyle>(labelText),
  padding: MaterialStateProperty.all<EdgeInsetsGeometry>(EdgeInsets.all(18.0)),

);