import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:poketball/constants/constants.dart';
import 'package:poketball/constants/ui_helper.dart';

class AppTitle extends StatefulWidget {
   AppTitle({Key? key}) : super(key: key);

  @override
  _AppTitleState createState() => _AppTitleState();
}

class _AppTitleState extends State<AppTitle> {
 final String _imgPath = 'assets/pokeball.jpg';

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: UIHelper.getAppTitleWidgetHeight(),
      child: Stack(
        children:  [
          Padding(
            padding: UIHelper.getDefaultPadding(),
            child: Align(alignment: Alignment.centerLeft ,child: Text(Constants.title,style: Constants.getTitleTextStyle(),)),
          ),
          Align(alignment: Alignment.topRight,child: Image.asset(
            _imgPath,
            width: ScreenUtil().orientation == Orientation.portrait ? 0.2.sh : 0.2.sw,
            fit: BoxFit.fitWidth,))
        ],
      ),
    );
  }
}
