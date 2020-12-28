import 'package:flutter/material.dart';
import 'package:flutter_get_law/common/utils/utils.dart';
import 'package:flutter_get_law/pages/login/login_controller/login_by_sms_controller.dart';
import 'package:flutter_get_law/pages/login/login_page/login_by_pwd_page.dart';
import 'package:flutter_get_law/pages/login/login_widget/custo_data.dart';
import 'package:flutter_get_law/pages/login/login_widget/login_text_field.dart';
import 'package:flutter_get_law/pages/login/login_widget/wechat_login_logo.dart';
import 'package:get/get.dart';

class LoginBySmsPage extends StatelessWidget {
  LoginBySmsPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginBySmsController());
    var padding = setWidth(75);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
        child: Padding(
          padding: EdgeInsets.only(left: padding, right: padding),
          child: Column(
            children: <Widget>[
              Spacer(),
              buildLogo(),
              SizedBox(height: setRealHeight(108)),
              LoginTextField(title: "手机号", controller: controller.phoneController),
              SizedBox(height: setRealHeight(40)),
              Obx(() => LoginTextField(
                    isSms: true,
                    title: "验证码",
                    controller: controller.smsController,
                    timerUtil: controller.timerUtil,
                    phone: controller.phone.value,
                    callback: () {
                      controller.doGetSmsCode();
                    },
                  )),
              SizedBox(height: setRealHeight(40)),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  getFont("密码登录", () => Get.off(LoginByPwdPage())),
                ],
              ),
              SizedBox(height: setRealHeight(40)),
              Container(
                width: getScreenWidth(),
                child: loginButton(
                    title: "登录",
                    callback: () {
                      controller.doLogin(controller);
                    }),
              ),
              SizedBox(height: setRealHeight(32)),
              buildForgetPwdBtn(),
              Spacer(),
              WechatLoginLogo()
            ],
          ),
        ),
      ),
    );
  }
}
