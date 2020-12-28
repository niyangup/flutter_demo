import 'package:flustars/flustars.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_get_law/common/utils/utils.dart';
import 'package:flutter_get_law/common/values/values.dart';
import 'package:get/get.dart';

class ModifyPhoneController extends GetxController {
  TextEditingController phoneController;
  TextEditingController smsCodeController;
  TimerUtil timerUtil;

  var phone = "".obs;

  @override
  void onInit() {
    super.onInit();
    timerUtil = TimerUtil();
    phoneController = TextEditingController()
      ..addListener(() {
        phone.value = phoneController.text;
      });
    smsCodeController = TextEditingController();
  }

  @override
  void onClose() {
    super.onClose();
    phoneController?.dispose();
    smsCodeController?.dispose();
  }

  Future<void> handleGetSmsCode() async {
    EasyLoading.show(status: Constants.notice);
    await Future.delayed(Duration(seconds: 1));
    //获取6位的随机验证码
    this.smsCodeController.text = getRandom();
    this.timerUtil.startCountDown();
    EasyLoading.dismiss();
  }

  Future<void> handleSubmitNewPhone() async {
    EasyLoading.show(status: Constants.notice);
    await Future.delayed(Duration(seconds: 1));
    phoneController.clear();
    smsCodeController.clear();
    phoneController.clear();
    smsCodeController.clear();
    Get.back();

    EasyLoading.showSuccess(Constants.submit_success);
  }
}
