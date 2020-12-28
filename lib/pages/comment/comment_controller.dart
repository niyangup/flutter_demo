import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_get_law/common/entitys/entitys.dart';
import 'package:flutter_get_law/common/values/constants.dart';
import 'package:flutter_get_law/common/widgets/widgets.dart';
import 'package:get/get.dart';

class CommentController extends GetxController {
  TextEditingController controller;
  final commentListData = <CommentListModel>[].obs;
  int code = 0;

  @override
  void onInit() {
    super.onInit();
    controller = TextEditingController();

    _initCommentData();
  }

  _initCommentData() async {
    var model = CommentListModel(
      content: "针不戳",
      portrait: "images/avatar.png",
      level: "黄金",
      userName: "评论名称",
      createTime: "2020-10-17 08:02:01",
    );
    commentListData.add(model);
  }

  @override
  void onClose() {
    super.onClose();
    controller?.dispose();
  }

  void handleSendComment() async {
    if (controller.text.trim().isEmpty) {
      toastInfo(msg: '说点什么吧');
    } else {
      EasyLoading.show(status: '请稍等');
      await Future.delayed(Duration(seconds: 1));
      var model = CommentListModel(
        content: controller.text,
        portrait: "images/avatar.png",
        level: "黄金",
        userName: "评论名称",
        createTime: "2020-10-17 08:02:01",
      );
      commentListData.add(model);
      controller.clear();
      EasyLoading.showSuccess(Constants.comment_success);
    }
  }
}
