import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_get_law/common/utils/disable_water_ripple_behavior.dart';
import 'package:flutter_get_law/common/utils/utils.dart';
import 'package:flutter_get_law/common/widgets/widgets.dart';
import 'package:flutter_get_law/pages/login/login_controller/register_controller.dart';
import 'package:flutter_get_law/pages/login/login_page/user_service_agreement_page.dart';
import 'package:flutter_get_law/pages/login/login_widget/login_text_field.dart';
import 'package:get/get.dart';

class RegisterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(RegisterController());
    return Scaffold(
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
          child: SafeArea(
            child: ScrollConfiguration(
              behavior: DisableWaterRippleBehavior(),
              child: ListView(
                children: <Widget>[
                  _buildTitle(),
                  SizedBox(height: setRealHeight(60)),
                  _buildPhoneEdit(controller),
                  SizedBox(height: setRealHeight(40)),
                  Obx(() => _buildSmsEdit(controller)),
                  SizedBox(height: setRealHeight(40)),
                  _buildPwdEdit(controller),
                  SizedBox(height: setRealHeight(40)),
                  _buildConfirmEdit(controller),
                  SizedBox(height: setRealHeight(35)),
                  Stack(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Expanded(
                            child: AbsorbPointer(
                              child: LoginTextField(
                                isIndustryType: true,
                                title: "行业类型",
                                controller: controller.industryTypeController,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Positioned(
                        right: setWidth(0),
                        bottom: setHeight(10),
                        child: IconButton(
                          icon: Icon(Icons.keyboard_arrow_down,
                              size: setWidth(50), color: HexColor('#999999')),
                          onPressed: () async {
                            var dialog = await showMySelectDialog(
                                context: context, list: controller.industryTypeList);
                            controller.industryTypeController.text = dialog;
                          },
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: setRealHeight(35)),
                  _buildUserArgument(controller),
                  SizedBox(height: setRealHeight(84)),
                  loginButton(
                      title: "注册",
                      callback: () {
                        controller.doRegister();
                      }),
                  SizedBox(height: setRealHeight(80)),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildUserArgument(RegisterController controller) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        GestureDetector(
          child: Obx(() => Container(
                height: setHeight(27),
                width: setWidth(27),
                child: controller.isChecked.value
                    ? Image.asset("images/4.png")
                    : Image.asset("images/5.png"),
              )),
          onTap: () {
            controller.isChecked.value = !controller.isChecked.value;
          },
        ),
        SizedBox(width: setWidth(21)),
        RichText(
          text: TextSpan(
              style: TextStyle(color: HexColor("#999999"), fontSize: setFontSize(26)),
              children: <InlineSpan>[
                TextSpan(text: '同意《'),
                TextSpan(
                  text: '用户协议和隐私政策',
                  recognizer: TapGestureRecognizer()
                    ..onTap = () => Get.to(UserServiceAgreementPage()),
                  style: buildTextStyle('#4482FF', 26),
                ),
                TextSpan(text: '》'),
              ]),
        ),
      ],
    );
  }

  LoginTextField _buildConfirmEdit(RegisterController controller) {
    return LoginTextField(
      title: "确认密码",
      controller: controller.confirmPwdController,
    );
  }

  LoginTextField _buildPwdEdit(RegisterController controller) {
    return LoginTextField(
      title: "密码",
      controller: controller.pwdController,
    );
  }

  LoginTextField _buildSmsEdit(RegisterController controller) {
    return LoginTextField(
      title: "验证码",
      isSms: true,
      phone: controller.phone.value,
      controller: controller.smsController,
      timerUtil: controller.timerUtil,
      callback: () {
        controller.doGetSmsCode();
      },
    );
  }

  LoginTextField _buildPhoneEdit(RegisterController controller) {
    return LoginTextField(
      title: "手机号",
      controller: controller.phoneController,
    );
  }

  Widget _buildTitle() {
//    var padding = setWidth(182 - getStatusBarHeight());
    var padding = 0.0;
    return Padding(
      padding: EdgeInsets.only(top: padding),
      child: Text(
        '注册账号',
        style: buildTextStyle('#333333', 48, fontWeight: FontWeight.w500),
      ),
    );
  }
}
