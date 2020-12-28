import 'dart:convert';
import 'dart:math';

import 'package:flustars/flustars.dart';
import 'package:flutter/material.dart';
import 'package:flutter_get_law/common/entitys/entitys.dart';
import 'package:flutter_get_law/common/values/values.dart';
import 'package:flutter_get_law/common/widgets/widgets.dart';

/// 检查输入框的controller.text是否不为空
bool checkControllerIsNotEmpty(
  TextEditingController controller, {

  ///当字段为空时toast提示
  @required String msg,
}) {
  if (controller != null && controller.text != null && controller.text.isNotEmpty) {
    return true;
  } else {
    toastInfo(msg: msg);
    return false;
  }
}

///校验phoneController是否不为空以及是否合法
bool checkPhone(TextEditingController controller) {
  if (controller != null &&
      controller.text != null &&
      controller.text.isNotEmpty &&
      RegexUtil.isMobileExact(controller.text)) {
    //合法
    print('手机号合法');
    return true;
  } else {
    print('手机号不合法');
    toastInfo(msg: '请输入合法的手机号');
    return false;
  }
}

///校验pwdController是否不为空以及是否合法
bool checkPwd(TextEditingController controller) {
  if (controller != null && controller.text != null && controller.text.isNotEmpty) {
    //合法
    return true;
  } else {
    toastInfo(msg: '请输入密码');
    return false;
  }
}

String getRandom({int length = 6}) {
  List<int> result = <int>[];
  if (length == null || length < 0) {
    return 0.toString();
  } else {
    for (int i = 0; i < length; i++) {
      result.add(Random().nextInt(9));
    }
    return result.join();
  }
}

List<HomeLawModel> getHomeLawList() {
  var homeLawResultModel = HomeLawResultModel.fromJson(json.decode(Constants.home_json));
  return homeLawResultModel.data;
}
