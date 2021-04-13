import 'package:flutter/cupertino.dart';

double dynamicHeight(BuildContext context, double ratio) {
  return MediaQuery.of(context).size.height * ratio;
}
double dynamicWidth(BuildContext context, double ratio) {
  return MediaQuery.of(context).size.width * ratio;
}