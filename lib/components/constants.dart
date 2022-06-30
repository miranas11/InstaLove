import 'package:flutter/material.dart';

const kPurpleColor = Color.fromRGBO(76, 21, 76, 0.90);
const kBackgroundColor = Color.fromRGBO(251, 228, 236, 1);
const kPinkColor = Color.fromRGBO(249, 187, 208, 1);

const double widthgap = 0.12;

double getHeight(BuildContext context) {
  return MediaQuery.of(context).size.height;
}

double getWidth(BuildContext context) {
  return MediaQuery.of(context).size.width;
}
