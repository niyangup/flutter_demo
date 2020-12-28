import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_get_law/common/values/values.dart';
import 'package:flutter_get_law/common/widgets/widgets.dart';
import 'package:flutter_get_law/pages/login/login_page/user_service_agreement_page.dart';
import 'package:flutter_get_law/pages/tab/me/me_controller.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import 'modify_phone_page.dart';
import 'modify_pwd_page.dart';

class SettingController extends GetxController {
  TextEditingController controller;

  @override
  void onInit() {
    super.onInit();
    controller = TextEditingController();
  }

  @override
  void onClose() {
    super.onClose();
    controller?.dispose();
  }

  ///修改名称 点击确定后逻辑处理
  void handleModifyUserName() async {
    if (controller.text.isEmpty) {
      toastInfo(msg: Constants.content_can_not_empty);
      return;
    }
    EasyLoading.show(status: Constants.notice);
    await Future.delayed(Duration(seconds: 1));
    final MeController meController = Get.find();
    meController.username = controller.text;
    Get.back();
    controller.clear();
    EasyLoading.showSuccess(Constants.submit_success);
  }

  void handleUpdateUsername() {
    showMyInputDialog(
      okCallback: handleModifyUserName,
      title: '更改名称',
      controller: controller,
      cancelCallback: () {
        controller.clear();
      },
    );
  }

  void handleGoNewPage(Widget page) {
    Get.to(page);
  }

  void handleModifyPhone() {
    handleGoNewPage(ModifyPhonePage());
  }

  void handleModifyPwd() {
    handleGoNewPage(ModifyPwdPage());
  }

  void handleUserServiceAgreement() {
    handleGoNewPage(UserServiceAgreementPage());
  }

  Future<void> updateAvatar() async {
    try {
      var selectDialog = await showMySelectDialog(
          context: Get.overlayContext, list: ['拍照', '从相册中选择'], title: '请选择获取图片方式');
      if (selectDialog != null) {
        if (selectDialog == '拍照') {
          PickedFile file =
              await ImagePicker().getImage(source: ImageSource.camera, imageQuality: 10);
          _handleGalleryPic(file);
        } else if (selectDialog == '从相册中选择') {
          PickedFile file =
              await ImagePicker().getImage(source: ImageSource.gallery, imageQuality: 10);
          _handleGalleryPic(file);
        }
      }
    } catch (e) {
      print(e);
    }
  }

  void _handleGalleryPic(PickedFile file) {
    toastInfo(msg: "上传图片,url: ${file.path}");
  }
}
