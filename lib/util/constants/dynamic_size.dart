import 'package:flutter/cupertino.dart';

class DynamicSize{
  static double dynamicHeight(BuildContext context, double ratio) {
    return MediaQuery.of(context).size.height * ratio;
  }
  static double dynamicWidth(BuildContext context, double ratio) {
    return MediaQuery.of(context).size.width * ratio;
  }
}