import 'package:flustars/flustars.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_get_law/common/utils/utils.dart';
import 'package:flutter_get_law/common/values/values.dart';
import 'package:flutter_get_law/common/widgets/widgets.dart';
import 'package:flutter_get_law/pages/login/login_page/login_by_pwd_page.dart';
import 'package:get/get.dart';

class ForgetPwdController extends GetxController {
  TextEditingController phoneController;
  TextEditingController pwdController;
  TextEditingController confirmPwdController; //邀请码controller
  TextEditingController smsController;
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
    pwdController = TextEditingController();
    confirmPwdController = TextEditingController();
    smsController = TextEditingController();
  }

  @override
  void onClose() {
    super.onClose();
    phoneController?.dispose();
    pwdController?.dispose();
    confirmPwdController?.dispose();
    smsController?.dispose();
  }

  Future<void> doGetSmsCode() async {
    EasyLoading.show(status: Constants.notice);
    await Future.delayed(Duration(seconds: 1));
    //获取6位的随机验证码
    this.smsController.text = getRandom();
    this.timerUtil.startCountDown();
    EasyLoading.dismiss();
  }

  ///检查输入框的数据是否合法
  bool checkEmpty() {
    if (!checkPhone(phoneController)) {
      return false;
    }

    if (!checkControllerIsNotEmpty(smsController, msg: '请输入验证码')) {
      return false;
    }

    if (!checkPwd(pwdController)) {
      return false;
    }

    if (!checkControllerIsNotEmpty(confirmPwdController, msg: '请再次输入密码')) {
      return false;
    }

    if (pwdController.text != confirmPwdController.text) {
      toastInfo(msg: '密码与确认密码不相同');
      return false;
    }

    return true;
  }

  Future<void> doResetPwd() async {
    if (checkEmpty()) {
      EasyLoading.show(status: Constants.notice);
      await Future.delayed(Duration(seconds: 1));
      Get.off(LoginByPwdPage(phone: phone.value));
      EasyLoading.showSuccess(Constants.reset_success);
    }
  }
}
