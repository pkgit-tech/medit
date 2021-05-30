import 'dart:ffi';

import 'package:flutter/material.dart';

TextStyle getTextStyle({Color? fcolor, FontWeight? weightf, double? size}) {
  return TextStyle(
      color: fcolor,
      fontSize: size,
      fontFamily: "SFProDisplay",
      fontWeight: weightf);
}
