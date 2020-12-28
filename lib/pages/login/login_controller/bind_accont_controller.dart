import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BindAccountController extends GetxController {
  TextEditingController phoneController;
  TextEditingController ivtController; //邀请码controller
  TextEditingController smsController;
  final phone = ''.obs;

  var isChecked = true.obs;

  @override
  void onInit() {
    super.onInit();
    phoneController = TextEditingController();
    ivtController = TextEditingController();
    smsController = TextEditingController();
  }

  @override
  void onClose() {
    super.onClose();
    phoneController?.dispose();
    ivtController?.dispose();
    smsController?.dispose();
  }
}
