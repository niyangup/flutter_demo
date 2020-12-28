import 'package:flutter/material.dart';
import 'package:flutter_get_law/common/utils/screen.dart';
import 'package:flutter_get_law/common/widgets/widgets.dart';
import 'package:flutter_get_law/pages/login/login_widget/login_text_field.dart';
import 'package:get/get.dart';

import 'modify_pwd_controller.dart';

class ModifyPwdPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ModifyPwdController());
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: getWhiteAppbar('修改密码', context: context),
        body: GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: () {
            FocusScope.of(context).requestFocus(FocusNode());
          },
          child: Container(
            child: Column(
              children: <Widget>[
                inputTextIn('手机号', hint: '请输入手机号', controller: controller.phoneController),
                Container(
                  child: Stack(
                    alignment: Alignment.center,
                    children: <Widget>[
                      Align(
                        alignment: Alignment.center,
                        child: inputTextIn('验证码',
                            hint: '输入验证码', controller: controller.smsCodeController),
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Padding(
                          padding: EdgeInsets.only(right: setWidth(30)),
                          child: Obx(() => SmsOutlineButton(
                                phone: controller.phone.value,
                                onPressed: controller.handleGetSmsCode,
                                timerUtil: controller.timerUtil,
                              )),
                        ),
                      ),
                    ],
                  ),
                ),
                inputTextIn('修改密码',
                    hint: '输入修改后的密码', isPwd: true, controller: controller.pwdController),
                inputTextIn('确认密码',
                    hint: '输入再次输入密码', isPwd: true, controller: controller.confirmPwdController),
                SizedBox(height: setHeight(59)),
                Container(
                  width: double.infinity,
                  margin: EdgeInsets.symmetric(horizontal: setWidth(30)),
                  child: loginButton(
                    title: '修改密码',
                    callback: controller.handleSubmitPwd,
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
