import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Constants {
  Constants._();

  static const String title = "Pokedex";
  static TextStyle getTitleTextStyle() {
    return TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
        fontSize: _caculateFontSize(48));
  }

  static TextStyle getPokemonTitleTextStyle() {
    return TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
        fontSize: _caculateFontSize(22));
  }

  static TextStyle getPokemonTypeChipTextStyle() {
    return TextStyle(color: Colors.white, fontSize: _caculateFontSize(20));
  }

  static _caculateFontSize(int size) {
    if (ScreenUtil().orientation == Orientation.portrait) {
      return size.sp;
    } else {
      return (size * 1.2).sp;
    }
  }

  static TextStyle getPokeInfoLabelTextStyle() {
    return TextStyle(color: Colors.black, fontSize: _caculateFontSize(20));
  }
  static TextStyle getPokeInfoTextStyle() {
    return TextStyle(color: Colors.black, fontSize: _caculateFontSize(16));
  }
}
