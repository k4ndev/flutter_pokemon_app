import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UIHelper {
  UIHelper._();

  static double getAppTitleWidgetHeight() {
    return ScreenUtil().orientation == Orientation.portrait ? 0.15.sh : 0.15.sw;
  }

  static EdgeInsets getDefaultPadding() {
    if (ScreenUtil().orientation == Orientation.portrait) {
      return EdgeInsets.all(12.w);
    } else {
      return EdgeInsets.all(8.w);
    }
  }

  static double calculatePokeImageSize() {
    if (ScreenUtil().orientation == Orientation.portrait) {
      return 0.2.sw;
    } else {
      return 0.3.sh;
    }
  }

  static EdgeInsets getPokeInfoPadding() {
      if (ScreenUtil().orientation == Orientation.portrait) {
      return EdgeInsets.all(10.w);
    } else {
      return EdgeInsets.all(6.w);
    }
  }
}
