import 'package:flutter/material.dart';
import 'package:flutter_get_law/common/utils/utils.dart';
import 'package:flutter_get_law/pages/login/login_controller/login_by_pwd_controller.dart';
import 'package:flutter_get_law/pages/login/login_page/login_by_sms_page.dart';
import 'package:flutter_get_law/pages/login/login_widget/custo_data.dart';
import 'package:flutter_get_law/pages/login/login_widget/login_text_field.dart';
import 'package:flutter_get_law/pages/login/login_widget/wechat_login_logo.dart';
import 'package:get/get.dart';

class LoginByPwdPage extends StatelessWidget {
  final String phone;

  LoginByPwdPage({Key key, this.phone}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final loginByPwdController = Get.put(LoginByPwdController(phone: phone));
    var padding = setWidth(75);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: Padding(
          padding: EdgeInsets.only(left: padding, right: padding),
          child: Column(
            children: <Widget>[
              Spacer(),
              buildLogo(context),
              SizedBox(height: setRealHeight(108)),
              LoginTextField(title: "手机号", controller: loginByPwdController.phoneController),
              SizedBox(height: setRealHeight(40)),
              LoginTextField(
                  isPwd: true, title: "登录密码", controller: loginByPwdController.passwordController),
              SizedBox(height: setRealHeight(40)),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[getFont("验证码登录", () => Get.off(LoginBySmsPage()))],
              ),
              SizedBox(height: setRealHeight(40)),
              Container(
                width: getScreenWidth(),
                child: loginButton(
                  title: "登录",
                  callback: () {
                    loginByPwdController.doLogin();
                  },
                ),
              ),
              SizedBox(height: setRealHeight(32)),
              buildForgetPwdBtn(),
              Spacer(),
              WechatLoginLogo(),
            ],
          ),
        ),
      ),
    );
  }
}
