import 'package:flustars/flustars.dart';
import 'package:flutter/material.dart';
import 'package:flutter_get_law/common/utils/utils.dart';
import 'package:flutter_get_law/common/values/values.dart';
import 'package:flutter_get_law/common/widgets/widgets.dart';

///手机号是final的
///修改手机号需要rebuild this widget
///Obx(()=>Widget());
class LoginTextField extends StatefulWidget {
  final String title;
  final TextEditingController controller;

  final bool isPwd;
  final bool isSms;

  ///点击获取验证码的响应事件 手机号校验通过的时候调用
  final VoidCallback callback;

  final FormFieldValidator<String> validator;

  final bool enable;

  final String hintText;
  final bool isIndustryType;

  ///需要校验的手机号 验证码按钮必填
  final String phone;

  final TimerUtil timerUtil;

  LoginTextField({
    Key key,
    @required this.title,
    @required this.controller,
    this.isPwd,
    this.isSms = false,
    this.validator,
    this.callback,
    this.enable = true,
    this.hintText = '',
    this.isIndustryType = false,
    this.phone = "",
    this.timerUtil,
  });

  @override
  _LoginTextFieldState createState() => _LoginTextFieldState();
}

class _LoginTextFieldState extends State<LoginTextField> {
  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.key,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(widget.title, style: buildTextStyle("#666666", 30)),
          TextFormField(
            enabled: widget.enable,
            obscureText: widget.isPwd ?? false,
            controller: widget.controller,
            style: buildTextStyle("#999999", 32),
            decoration: InputDecoration(
              hintText: widget.hintText,
              hintStyle: buildTextStyle("#999999", 32),
              disabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: HexColor("#999999")),
              ),
              suffixIcon: widget.enable
                  ? Stack(
                      alignment: Alignment.centerRight,
                      children: <Widget>[
                        Visibility(
                          child: buildClearIconButton(),
                          visible: !widget.isIndustryType,
                        ),
                        widget.isSms
                            ? Container(
                                padding: EdgeInsets.only(right: setWidth(34 + 28.0 + 28)),
                                child: SmsOutlineButton(
                                  onPressed: widget.callback,
                                  phone: widget.phone,
                                  timerUtil: widget.timerUtil,
                                ),
                              )
                            : Text(''),
                      ],
                    )
                  : Container(),
            ),
            validator: widget.validator ??
                (v) {
                  return null;
                },
          ),
        ],
      ),
    );
  }

  IconButton buildClearIconButton() {
    return IconButton(
      icon: Container(
        decoration: BoxDecoration(
          //背景
          color: Color(0xFFE6E6E6),
          //设置四周圆角 角度
          borderRadius: BorderRadius.all(Radius.circular(50)),
          //设置四周边框
        ),
        child: Icon(
          Icons.close,
          color: Colors.white,
          size: setWidth(34),
        ),
      ),
      onPressed: () {
        //清除输入框文字,直接使用widget.controller.clear()会报错
        WidgetsBinding.instance.addPostFrameCallback(
          (_) => widget.controller.clear(),
        );
      },
    );
  }
}

Widget loginButton({
  @required VoidCallback callback,
  String title = '',
  String color = '#FFFFFF',
  double fontSize = 34.0,
}) {
  return Container(
    height: setWidth(90),
    child: FlatButton(
      color: AppColors.primaryElement,
      shape: RoundedRectangleBorder(
        borderRadius: Radii.k10pxRadius,
      ),
      onPressed: callback ?? () {},
      child: Text(title, style: buildTextStyle(color, fontSize)),
    ),
  );
}
