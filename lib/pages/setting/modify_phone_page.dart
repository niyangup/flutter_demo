import 'package:flutter/material.dart';
import 'package:flutter_get_law/common/utils/utils.dart';
import 'package:flutter_get_law/common/widgets/widgets.dart';
import 'package:flutter_get_law/pages/login/login_widget/login_text_field.dart';
import 'package:get/get.dart';

import 'modify_phone_controller.dart';

///修改手机号
class ModifyPhonePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ModifyPhoneController());
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: getWhiteAppbar('修改手机号', context: context),
      body: GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: () {
            FocusScope.of(context).requestFocus(FocusNode());
          },
          child: Column(
            children: <Widget>[
              inputTextIn('新手机号', hint: '请输入新手机号', controller: controller.phoneController),
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
              SizedBox(height: setHeight(59)),
              Container(
                width: double.infinity,
                margin: EdgeInsets.symmetric(horizontal: setWidth(30)),
                child: loginButton(
                  title: '保存',
                  callback: controller.handleSubmitNewPhone,
                ),
              ),
            ],
          )),
    );
  }
}
