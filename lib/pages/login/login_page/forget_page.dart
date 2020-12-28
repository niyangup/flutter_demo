import 'package:flutter/material.dart';
import 'package:flutter_get_law/common/utils/screen.dart';
import 'package:flutter_get_law/common/utils/utils.dart';
import 'package:flutter_get_law/common/widgets/widgets.dart';
import 'package:flutter_get_law/pages/login/login_controller/forge_controller.dart';
import 'package:flutter_get_law/pages/login/login_widget/login_text_field.dart';
import 'package:get/get.dart';

class ForgetPwdPage extends StatelessWidget {
  ForgetPwdPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ForgetPwdController());
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: BackButton(color: HexColor("#333333")),
        backgroundColor: Colors.white,
        brightness: Brightness.light,
        elevation: 0,
      ),
      body: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: Padding(
          padding: EdgeInsets.only(left: setWidth(74), right: setWidth(74)),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                _buildTitle(),
                SizedBox(height: setRealHeight(130)),
                LoginTextField(title: "手机号", controller: controller.phoneController),
                SizedBox(height: setRealHeight(40)),
                Obx(() => LoginTextField(
                      isSms: true,
                      title: "验证码",
                      timerUtil: controller.timerUtil,
                      controller: controller.smsController,
                      phone: controller.phone.value,
                      callback: () {
                        controller.doGetSmsCode();
                      },
                    )),
                SizedBox(height: setRealHeight(40)),
                LoginTextField(title: "输入密码", controller: controller.pwdController),
                SizedBox(height: setRealHeight(40)),
                LoginTextField(title: "再次输入密码", controller: controller.confirmPwdController),
                SizedBox(height: setRealHeight(60)),
                Container(
                  width: getScreenWidth(),
                  child: loginButton(
                    title: "重置密码",
                    callback: () {
                      controller.doResetPwd();
                    },
                  ),
                ),
                SizedBox(height: setRealHeight(60)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget _buildTitle() {
//    var padding = setWidth(182 - getStatusBarHeight());
  var padding = 0.0;
  return Padding(
    padding: EdgeInsets.only(top: padding),
    child: Text(
      '忘记密码',
      style: buildTextStyle('#333333', 48, fontWeight: FontWeight.w500),
    ),
  );
}
