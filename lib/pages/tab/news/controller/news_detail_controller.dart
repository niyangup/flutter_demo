import 'dart:convert';

import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_get_law/common/entitys/entitys.dart';
import 'package:flutter_get_law/common/values/constants.dart';
import 'package:flutter_get_law/common/values/values.dart';
import 'package:flutter_get_law/common/widgets/widgets.dart';
import 'package:flutter_get_law/pages/comment/comment_page.dart';
import 'package:get/get.dart';

class NewsDetailController extends GetxController {
  final _model = InfoDetailModel().obs;

  InfoDetailModel get model => _model.value;

  @override
  void onInit() {
    super.onInit();
    _initInfoDetailData();
  }

  _initInfoDetailData() async {
    EasyLoading.show(status: Constants.notice);
    await Future.delayed(Duration(milliseconds: 300));
    var model = InfoDetailResultModel.fromJson(json.decode(Constants.info_json));
    _model.value = model.data;
    EasyLoading.dismiss();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void handleLikeCallback() {
    model.giveLikeState != "1" ? like() : unLike();
    update();
  }

  void like() {
    model.giveLikeState = "1";
    model.giveLike++;
  }

  void unLike() {
    model.giveLikeState = "2";
    model.giveLike != null && model.giveLike > 1 ? model.giveLike-- : print('');
  }

  void handleGoToComment() {
    Get.to(CommentPage());
  }

  void handleShareWechatFriendsCircle() {
    toastInfo(msg: "分享微信朋友圈");
  }

  void handleShareWechatFriends() {
    toastInfo(msg: "分享微信好友");
  }
}
