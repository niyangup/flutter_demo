import 'dart:convert';

import 'package:flutter_get_law/common/entitys/entitys.dart';
import 'package:flutter_get_law/common/values/constants.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../news_detail_page.dart';

class NewsListController extends GetxController {
  final _infoListData = <InfoListModel>[].obs;
  RefreshController _controller;

  List<InfoListModel> get infoListData => _infoListData.toList();

  RefreshController get controller => _controller;
  int page = 1;

  @override
  void onInit() {
    super.onInit();
    initListData();
    _controller = RefreshController(initialRefresh: true);
  }

  initListData() async {
    await Future.delayed(Duration(microseconds: 300));
    var model = InfoListResultModel.fromJson(json.decode(Constants.info_list_json));
    _infoListData.clear();
    _infoListData.addAll(model.data);

    _controller.refreshCompleted();
  }

  onLoad() async {
    // var infoListResultModel =
    //     await InformationApi.informationList(widget.id, ++page, context: context);
    // if (infoListResultModel.code == 200 && infoListResultModel.data.isNotEmpty) {
    //   setState(() {
    //     this._infoListData.addAll(infoListResultModel.data);
    //   });
    // }
    // _controller.loadComplete();
  }

  void handleGoDetail() {
    Get.to(NewsDetailPage());
  }
}
