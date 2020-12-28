import 'dart:convert';

import 'package:flutter_get_law/common/dao/folder_domain.dart';
import 'package:flutter_get_law/common/entitys/entitys.dart';
import 'package:flutter_get_law/common/values/values.dart';
import 'package:flutter_get_law/common/widgets/widgets.dart';
import 'package:flutter_get_law/pages/comment/comment_page.dart';
import 'package:get/get.dart';
import 'package:share/share.dart';

class LawDetailController extends GetxController {
  final String id;

  var model = LawDetailModel().obs;
  bool isDownloaded = false;
  List<FolderDomain> folderList = [];

  LawDetailController(this.id);

  @override
  void onInit() {
    super.onInit();
    _initLawDetailData();
  }

  _initLawDetailData() {
    var resultModel = LawDetailResultModel.fromJson(json.decode(Constants.law_detail_json));
    this.model.value = resultModel.data;
  }

  void handleDownload() {
    toastInfo(msg: '下载...');
  }

  void handleComment() {
    Get.to(CommentPage());
  }

  void handleShare() {
    Share.share(model.value.name);
  }
}
