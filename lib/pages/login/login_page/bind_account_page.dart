import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_get_law/common/utils/utils.dart';
import 'package:flutter_get_law/common/widgets/widgets.dart';
import 'package:flutter_get_law/pages/login/login_controller/bind_accont_controller.dart';
import 'package:flutter_get_law/pages/login/login_widget/login_text_field.dart';
import 'package:get/get.dart';

import 'user_service_agreement_page.dart';

class BindAccountPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(BindAccountController());
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
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(left: setWidth(74), right: setWidth(74)),
            child: Column(
              children: <Widget>[
                _buildTitle(),
                SizedBox(height: setHeight(130)),
                LoginTextField(
                  title: "手机号",
                  controller: controller.phoneController,
                ),
                SizedBox(height: setHeight(40)),
                LoginTextField(
                  title: "验证码",
                  isSms: true,
                  controller: controller.smsController,
                ),
                SizedBox(height: setHeight(40)),
                Stack(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: LoginTextField(
                            title: "行业类型",
                            enable: false,
                            controller: controller.ivtController,
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
                              context: context, list: <String>['哈哈', '无误']);
                          print(dialog);
                        },
                      ),
                    ),
                  ],
                ),
                SizedBox(height: setHeight(82)),
                GestureDetector(
                  onTap: () {
                    controller.isChecked.value = !controller.isChecked.value;
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        height: setHeight(27),
                        width: setWidth(27),
                        child: Obx(() => controller.isChecked.value
                            ? Image.asset("images/4.png", fit: BoxFit.cover)
                            : Image.asset("images/5.png", fit: BoxFit.cover)),
                      ),
                      SizedBox(width: setWidth(18)),
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
                  ),
                ),
                SizedBox(height: setHeight(84)),
                loginButton(title: "绑定账号", callback: () {})
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTitle() {
    var padding = setWidth(182 - getStatusBarHeight());
    return Padding(
      padding: EdgeInsets.only(top: padding),
      child: Text(
        '绑定微信账号',
        style: buildTextStyle('#333333', 48, fontWeight: FontWeight.w500),
      ),
    );
  }
}
