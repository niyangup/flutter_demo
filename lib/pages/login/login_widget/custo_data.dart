import 'package:flutter/material.dart';
import 'package:flutter_get_law/common/utils/screen.dart';
import 'package:flutter_get_law/common/widgets/widgets.dart';
import 'package:flutter_get_law/pages/login/login_page/forget_page.dart';
import 'package:flutter_get_law/pages/login/login_page/register_page.dart';
import 'package:get/get.dart';

///顶部logo
Widget buildLogo(BuildContext context) {
  return Padding(
//    padding:
//        EdgeInsets.only(top: setRealHeight(160)),
    padding: EdgeInsets.only(),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        ClipOval(
          child: Image.asset(
            "images/logo_512.png",
            width: setWidth(150),
            height: setWidth(150),
            fit: BoxFit.cover,
          ),
        ),
      ],
    ),
  );
}

///可点击字体
Widget getFont(String text, GestureTapCallback callback) {
  return InkWell(
    child: Text(text, style: buildTextStyle('#4482FF', 32)),
    onTap: callback,
  );
}

Widget buildForgetPwdBtn() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: <Widget>[
      getFont("忘记密码?", () async {
        await Get.to(ForgetPwdPage());
      }),
      getFont("注册账号", () async {
        await Get.to(RegisterPage());
      })
    ],
  );
}
