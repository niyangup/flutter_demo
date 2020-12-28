import 'package:flustars/flustars.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_get_law/common/utils/utils.dart';
import 'package:flutter_get_law/common/values/values.dart';
import 'package:flutter_get_law/common/widgets/widgets.dart';
import 'package:flutter_get_law/pages/tab/tabs.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {
  TextEditingController phoneController;
  TextEditingController pwdController;
  TextEditingController confirmPwdController;
  TextEditingController industryTypeController; //行业类型controller
  TextEditingController smsController;
  TimerUtil timerUtil;

  var isChecked = true.obs;

  ///行业类型list
  List<String> industryTypeList = [];

  var phone = "".obs;

  @override
  void onInit() {
    super.onInit();

    timerUtil = TimerUtil();
    phoneController = TextEditingController()
      ..addListener(() => phone.value = phoneController.text);
    pwdController = TextEditingController();
    confirmPwdController = TextEditingController();
    industryTypeController = TextEditingController();
    smsController = TextEditingController();
    initType();
  }

  ///初始化行业类型数据
  Future<void> initType() async {
    await Future.delayed(Duration(seconds: 1));
    industryTypeList.addAll(["工程施工", "造价咨询", "工程设计", "其他"]);
  }

  @override
  void onClose() {
    super.onClose();
    phoneController?.dispose();
    pwdController?.dispose();
    industryTypeController?.dispose();
    smsController?.dispose();
    confirmPwdController?.dispose();
  }

  Future<void> doRegister() async {
    print(phoneController.text);
    if (checkContent()) {
      EasyLoading.show(status: Constants.notice);
      await Future.delayed(Duration(seconds: 1));
      EasyLoading.showSuccess(Constants.login_success);
      Get.offAll(Tabs());
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

  ///校验用户输入是否合法
  bool checkContent() {
    if (!checkPhone(phoneController)) {
      return false;
    }

    if (!checkControllerIsNotEmpty(smsController, msg: '请输入验证码')) {
      return false;
    }

//    if (this.code == '' || this.code != smsController.text) {
//      toastInfo(msg: "验证码输入错误");
//      return false;
//    }

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
    if (!checkControllerIsNotEmpty(industryTypeController, msg: '请选择行业类型')) {
      return false;
    }

    if (!isChecked.value) {
      toastInfo(msg: "请勾选用户服务协议");
      return false;
    }

    return true;
  }
}
