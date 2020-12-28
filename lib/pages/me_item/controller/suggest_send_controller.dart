import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_get_law/common/utils/utils.dart';
import 'package:flutter_get_law/common/values/constants.dart';
import 'package:get/get.dart';

class SuggestSendController extends GetxController {
  TextEditingController _phoneController;
  TextEditingController _contentController;

  TextEditingController get phoneController => _phoneController;

  TextEditingController get contentController => _contentController;

  @override
  void onInit() {
    super.onInit();
    _phoneController = TextEditingController();
    _contentController = TextEditingController();
  }

  void handleSubmit() async {
    if (checkPhone(_phoneController) &&
        checkControllerIsNotEmpty(_contentController, msg: '请输入反馈内容')) {
      EasyLoading.show(status: '请稍等');
      await Future.delayed(Duration(milliseconds: 500));
      _phoneController.clear();
      _contentController.clear();
      FocusScope.of(Get.overlayContext).requestFocus(FocusNode());
      EasyLoading.showSuccess(Constants.submit_success);
    }
  }

  @override
  void onClose() {
    super.onClose();
    _phoneController?.dispose();
    _contentController?.dispose();
  }
}
