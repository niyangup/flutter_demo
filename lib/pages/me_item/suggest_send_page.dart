import 'package:flutter/material.dart';
import 'package:flutter_get_law/common/utils/utils.dart';
import 'package:flutter_get_law/common/values/values.dart';
import 'package:flutter_get_law/common/widgets/widgets.dart';
import 'package:flutter_get_law/pages/login/login_widget/login_text_field.dart';
import 'package:flutter_get_law/pages/me_item/controller/suggest_send_controller.dart';
import 'package:get/get.dart';

///建议反馈页面
class SuggestSendPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SuggestSendController());
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: getWhiteAppbar('意见反馈', context: context),
        body: GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
          child: ListView(
            children: <Widget>[
              SizedBox(height: setHeight(40)),
              buildPhoneEditText(controller),
              SizedBox(height: setHeight(30)),
              buildTextArea(controller),
              SizedBox(height: setHeight(50)),
              buildSubmitBtn(controller)
            ],
          ),
        ));
  }

  Widget buildSubmitBtn(SuggestSendController controller) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: setWidth(30)),
      width: getScreenWidth(),
      child: loginButton(
        title: '提 交',
        callback: controller.handleSubmit,
      ),
    );
  }

  Widget buildTextArea(SuggestSendController controller) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: setWidth(30)),
      height: setHeight(464),
      decoration: BoxDecoration(
        color: HexColor("#F3F6F7"),
        borderRadius: Radii.k10pxRadius,
      ),
      child: TextField(
        controller: controller.contentController,
        maxLines: 10,
        decoration: InputDecoration(
            contentPadding:
                EdgeInsets.only(right: setWidth(14), left: setWidth(40), top: setHeight(35)),
            hintText: '请输入反馈文字...',
            border: OutlineInputBorder(
              borderRadius: Radii.k10pxRadius,
              borderSide: BorderSide.none,
            )),
      ),
    );
  }

  Widget buildPhoneEditText(SuggestSendController controller) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: setWidth(30)),
      height: setHeight(100),
      decoration: BoxDecoration(
        color: HexColor("#F3F6F7"),
        borderRadius: Radii.k10pxRadius,
      ),
      child: TextField(
        controller: controller.phoneController,
        decoration: InputDecoration(
            contentPadding: EdgeInsets.only(right: setWidth(14), left: setWidth(40)),
            hintText: '请输入联系方式',
            border: OutlineInputBorder(
              borderRadius: Radii.k10pxRadius,
              borderSide: BorderSide.none,
            )),
      ),
    );
  }
}
