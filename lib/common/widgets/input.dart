import 'package:flutter/material.dart';

import '../utils/utils.dart';
import '../values/values.dart';
import '../widgets/dividing_line.dart';
import 'widgets.dart';

/// 输入框
Widget inputTextEdit({
  @required TextEditingController controller,
  TextInputType keyboardType = TextInputType.text,
  String hintText,
  bool isPassword = false,
  double marginTop = 15,
  bool autofocus = false,
}) {
  return Container(
    height: setHeight(44),
    margin: EdgeInsets.only(top: setHeight(marginTop)),
    decoration: BoxDecoration(
      color: AppColors.secondaryElement,
      borderRadius: Radii.k6pxRadius,
    ),
    child: TextField(
      autofocus: autofocus,
      controller: controller,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        hintText: hintText,
        contentPadding: EdgeInsets.fromLTRB(20, 10, 0, 9),
        border: InputBorder.none,
      ),
      style: TextStyle(
        color: AppColors.primaryText,
        fontFamily: "Avenir",
        fontWeight: FontWeight.w400,
        fontSize: setFontSize(18),
      ),
      maxLines: 1,
      autocorrect: false,
      // 自动纠正
      obscureText: isPassword, // 隐藏输入内容, 密码框
    ),
  );
}

/// email 输入框
/// 背景白色，文字黑色，带阴影
Widget inputEmailEdit({
  @required TextEditingController controller,
  TextInputType keyboardType = TextInputType.text,
  String hintText,
  bool isPassword = false,
  double marginTop = 15,
  bool autofocus = false,
}) {
  return Container(
    height: setHeight(44),
    margin: EdgeInsets.only(top: setHeight(marginTop)),
    decoration: BoxDecoration(
      color: AppColors.primaryBackground,
      borderRadius: Radii.k6pxRadius,
      boxShadow: [
        BoxShadow(
          color: Color.fromARGB(41, 0, 0, 0),
          offset: Offset(0, 1),
          blurRadius: 0,
        ),
      ],
    ),
    child: TextField(
      autofocus: autofocus,
      controller: controller,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        hintText: hintText,
        contentPadding: EdgeInsets.fromLTRB(20, 10, 0, 9),
        border: InputBorder.none,
        hintStyle: TextStyle(
          color: AppColors.primaryText,
        ),
      ),
      style: TextStyle(
        color: AppColors.primaryText,
        fontFamily: "Avenir",
        fontWeight: FontWeight.w400,
        fontSize: setFontSize(18),
      ),
      maxLines: 1,
      autocorrect: false,
      // 自动纠正
      obscureText: isPassword, // 隐藏输入内容, 密码框
    ),
  );
}

///登录输入框 右侧显示获取验证码 如图input_login.jpg
Widget inputTextField(
  double width,
  String title,
  String imgName, {
  bool isSmsCode = false,
  String hintText = '',
  bool isPwd = false,
}) {
  return Container(
    width: setWidth(width),
    child: Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            Image.asset(
              "assets/images/login/$imgName",
              width: setWidth(20),
              height: setHeight(20),
            ),
            SizedBox(width: setWidth(10)),
            Text('$title'),
          ],
        ),
        Stack(
          children: <Widget>[
            Positioned(
              child: TextField(
                obscureText: isPwd,
                decoration: InputDecoration(
                  hintText: hintText,
                ),
              ),
            ),
            Positioned(
              right: setWidth(10),
              bottom: setHeight(10),
              child: isSmsCode
                  ? Container(
                      padding: EdgeInsets.only(
                        left: setWidth(10),
                      ),
                      decoration: BoxDecoration(
                        border: Border(
                          left: BorderSide(),
                        ),
                      ),
                      alignment: Alignment.bottomRight,
                      child: Text('获取验证码'),
                    )
                  : Container(),
            ),
          ],
        )
      ],
    ),
  );
}

///左字右输入框 加下划线 如图input_text_in.png
Widget inputTextIn(
  String text, {
  String hint,
  double width = 750,
  double height = 40,
  bool isPwd = false,
  @required TextEditingController controller,

  ///字框之间的距离
  double padding = 10,
}) {
  return Container(
    width: setWidth(width),
    child: Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            SizedBox(width: setWidth(28)),
            Text(text, style: buildTextStyle('#333333', 32)),
            Expanded(
              child: TextField(
                controller: controller,
                obscureText: isPwd,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.only(
                    top: height,
                    left: setWidth(padding),
                  ),
                  hintText: hint ?? '',
                  border: OutlineInputBorder(borderSide: BorderSide.none),
                ),
              ),
            )
          ],
        ),
        divider(),
      ],
    ),
  );
}
