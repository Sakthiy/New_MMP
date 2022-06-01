import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Themedata {
  static const main1C = Color(0xFF00A719);
  static const sbackground = Color(0xFFEDE7FF);
  static const IconColor = Colors.pink;
  static const maintitle = 'My Market Price';
}

extension MyExtension on String {
  String capi() {
    return "${this[0].toUpperCase()}${this.substring(1).toLowerCase()}";
  }
}
