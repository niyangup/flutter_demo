import 'package:flustars/flustars.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_get_law/common/utils/utils.dart';
import 'package:flutter_get_law/common/values/values.dart';
import 'package:flutter_get_law/pages/tab/tabs.dart';
import 'package:get/get.dart';

class LoginBySmsController extends GetxController {
  TextEditingController phoneController;
  TextEditingController smsController;
  TimerUtil timerUtil;
  String code = ''; //正确的验证码
  var phone = "".obs;

  @override
  void onInit() {
    super.onInit();
    timerUtil = TimerUtil();
    phoneController = TextEditingController()
      ..addListener(() {
        phone.value = phoneController.text;
      });
    smsController = TextEditingController();
  }

  @override
  void onClose() {
    super.onClose();
    phoneController?.dispose();
    smsController?.dispose();
  }

  Future<void> doLogin(LoginBySmsController controller) async {
    if (controller.checkEmpty()) {
      EasyLoading.show(status: Constants.notice);
      await Future.delayed(Duration(seconds: 1));
      if (this.phoneController.text.isNotEmpty && this.smsController.text.isNotEmpty) {
        EasyLoading.dismiss();
        Get.offAll(Tabs());
      } else {
        EasyLoading.showInfo(Constants.login_fail);
      }
    }
  }

  Future<void> doGetSmsCode() async {
    EasyLoading.show(status: Constants.notice);
    await Future.delayed(Duration(seconds: 1));
    //获取6位的随机验证码
    this.smsController.text = getRandom();
    this.timerUtil.startCountDown();
    EasyLoading.dismiss();
  }

  bool checkEmpty() {
    if (!checkPhone(phoneController)) {
      return false;
    }

    if (!checkControllerIsNotEmpty(smsController, msg: '请输入验证码')) {
      return false;
    }

    return true;
  }
}
