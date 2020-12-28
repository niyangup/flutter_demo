import 'package:flustars/flustars.dart';
import 'package:flutter/material.dart';

import '../utils/utils.dart';
import '../values/values.dart';
import 'widgets.dart';

/// 扁平圆角按钮 如图 `btn_login.png`
Widget btnFlatButtonWidget({
  @required VoidCallback onPressed,
  double width = 140,
  double height = 44,
  Color gbColor = AppColors.primaryElement,
  String title = "button",
  Color fontColor = AppColors.primaryElementText,
  double fontSize = 18,
  String fontName = "Montserrat",
  FontWeight fontWeight = FontWeight.w400,
}) {
  return Container(
    width: setWidth(width),
    height: setHeight(height),
    child: FlatButton(
      onPressed: onPressed,
      color: gbColor,
      shape: RoundedRectangleBorder(
        borderRadius: Radii.k6pxRadius,
      ),
      child: Text(
        title,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: fontColor,
          fontFamily: fontName,
          fontWeight: fontWeight,
          fontSize: setFontSize(fontSize),
          height: 1,
        ),
      ),
    ),
  );
}

/// 第三方按钮
Widget btnFlatButtonBorderOnlyWidget({
  @required VoidCallback onPressed,
  double width = 88,
  double height = 44,
  String iconFileName,
}) {
  return Container(
    width: setWidth(width),
    height: setHeight(height),
    child: FlatButton(
      onPressed: onPressed,
      shape: RoundedRectangleBorder(
        side: Borders.primaryBorder,
        borderRadius: Radii.k6pxRadius,
      ),
      child: Image.asset(
        "assets/images/icons-$iconFileName.png",
      ),
    ),
  );
}

///在线阅读btn
Widget readBtn({
  @required VoidCallback callback,
  String title = '在线阅读',
  String color = '#FFFFFF',
  double fontSize = 28.0,
}) {
  return Container(
    height: setWidth(54),
    child: RaisedButton(
      color: AppColors.primaryElement,
      shape: RoundedRectangleBorder(
        borderRadius: Radii.k6pxRadius,
      ),
      onPressed: callback ?? () {},
      child: Text(
        title,
        style: buildTextStyle(color, fontSize, height: 1.3),
      ),
    ),
  );
}

///获取验证码按钮
///倒计时默认`60s`
///启动倒计时:
///  [TimerUtil] timerUtil.startCountDown();
///
class SmsOutlineButton extends StatefulWidget {
  final double height;

  final String text;

  ///手机号校验通过的时候调用
  final VoidCallback onPressed;

  ///倒计时时长 默认60秒 单位毫秒
  final int countDownTime;

  ///接收验证码的手机号
  final String phone;

  final TimerUtil timerUtil;

  SmsOutlineButton({
    Key key,
    @required this.onPressed,
    this.height = 48,
    this.text = '获取验证码',
    this.countDownTime = 60000,
    @required this.phone,
    @required this.timerUtil,
  }) : super(key: key);

  @override
  _SmsOutlineButtonState createState() {
    return _SmsOutlineButtonState();
  }
}

class _SmsOutlineButtonState extends State<SmsOutlineButton> {
  String title;

  @override
  void initState() {
    super.initState();
    title = widget.text;
    widget.timerUtil.setTotalTime(widget.countDownTime);
    widget.timerUtil.setOnTimerTickCallback((int time) {
      var countTime = time ~/ 1000;
      setState(() {
        if (countTime != 0) {
          title = countTime.toString() + "s后重新获取";
        } else {
          title = '重新获取';
          widget.timerUtil.setTotalTime(widget.countDownTime);
        }
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    widget.timerUtil?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: setHeight(widget.height),
      child: IgnorePointer(
        ignoring: widget.timerUtil?.isActive() ?? false,
        child: OutlineButton(
          padding: EdgeInsets.symmetric(horizontal: setWidth(10)),
          shape: RoundedRectangleBorder(borderRadius: Radii.k4pxRadius),
          borderSide: BorderSide(color: AppColors.primaryElement),
          onPressed: () {
            if (widget.phone == null ||
                widget.phone.isEmpty ||
                !RegexUtil.isMobileExact(widget.phone)) {
              toastInfo(msg: '请输入合法的手机号');
              return;
            }
            widget.onPressed();
          },
          child: Text(title,
              style: TextStyle(
                color:
                    widget.timerUtil.isActive() ? HexColor("#999999") : AppColors.primaryElement,
                fontSize: setFontSize(28),
                height: 1.3,
              )),
        ),
      ),
    );
  }
}
