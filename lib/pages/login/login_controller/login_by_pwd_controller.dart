import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_get_law/common/utils/utils.dart';
import 'package:flutter_get_law/common/values/values.dart';
import 'package:flutter_get_law/pages/tab/tabs.dart';
import 'package:get/get.dart';

class LoginByPwdController extends GetxController {
  TextEditingController phoneController;
  TextEditingController passwordController;
  String phone;

  LoginByPwdController({this.phone});

  @override
  void onInit() {
    super.onInit();
    print(phone);
    phoneController = TextEditingController(text: phone);
    passwordController = TextEditingController();
  }

  @override
  void onClose() {
    phoneController?.dispose();
    passwordController?.dispose();
  }

  Future<void> doLogin() async {
    print(phoneController.text);
    if (checkEmpty()) {
      EasyLoading.show(status: Constants.notice);
      await Future.delayed(Duration(seconds: 1));
      if (this.phoneController.text.isPhoneNumber && this.passwordController.text.isNotEmpty) {
        EasyLoading.showSuccess(Constants.login_success);
        Get.offAll(Tabs());
      } else {
        EasyLoading.showInfo(Constants.login_fail);
      }
    }
  }

  bool checkEmpty() {
    if (!checkPhone(phoneController)) {
      //手机号不合法
      return false;
    }

    if (!checkPwd(passwordController)) {
      return false;
    }

    return true;
  }
}
