import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_get_law/common/entitys/entitys.dart';
import 'package:flutter_get_law/common/utils/utils.dart';
import 'package:flutter_get_law/common/values/constants.dart';
import 'package:flutter_get_law/common/widgets/widgets.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class SearchController extends GetxController {
  TextEditingController controller;
  RefreshController refreshController;

  List<HomeMenuModel> selectListData = [];

  final selectTitle = '全部分类'.obs;

  String selectTitleId ="";

  List<SelectModel> dialogListData = [];

  ///搜索历史数据
  final searchHistoryList = <SearchHistoryModel>[].obs;

  ///搜索结果
  final searchResultList = <HomeLawModel>[].obs;

  int page = 1;

  ///搜索历史点击后会消失  用此表里保存name关键字
  String searchHistoryName = '';

  @override
  void onInit() {
    super.onInit();
    controller = TextEditingController();
    refreshController = RefreshController(initialRefresh: false);

    _initSearchTitle();
    _initSearchHistory();
  }

  @override
  void dispose() {
    super.dispose();
    controller?.dispose();
  }

  ///初始化appbar数据
  _initSearchTitle() async {
    final list = ["全部分类", "工程咨询", "勘察设计", "其他"];
    dialogListData.addAll(List.generate(
      list.length,
      (index) => SelectModel(
        id: index.toString(),
        title: list[index],
      ),
    ));
  }

  ///初始化历史搜索数据
  _initSearchHistory() {
    final list = ["设计", "建筑", "地质"];
    var searchHistoryData = List.generate(
      3,
      (index) => SearchHistoryModel(name: list[index]),
    );
    searchHistoryList.addAll(searchHistoryData);
  }

  ///搜索事件
  Future<void> _searchInfo() async {
    await Future.delayed(Duration(seconds: 1));
    searchResultList.clear();
    var lawList = getHomeLawList();
    lawList.shuffle();
    searchResultList.addAll(lawList);
  }

  void handleSearchHistory() async {
    EasyLoading.show(status: Constants.notice);
    await _searchInfo();
    EasyLoading.dismiss();
  }

  void handleDeleteHistoryData() {
    showMyConfirmDialog(
      content: "确定要清空搜索历史吗",
      okCallback: () {
        searchHistoryList.clear();
        Get.back();
      },
    );
  }

  void handleSearchBtnCallBack() async {
    if (controller.text.isEmpty) {
      toastInfo(msg: '请输入关键字');
      return;
    }

    EasyLoading.show(status: '请稍等');
    await _searchInfo();
    EasyLoading.dismiss();
  }

  handleOnTapSelectCallback() async {
    var selectedValue = await showMyModelSelectDialog(
      context: Get.overlayContext,
      list: dialogListData,
      title: '请选择分类',
    );
    if (selectedValue != null) {
      this.selectTitle.value = selectedValue.title;
      this.selectTitleId = selectedValue.id;
    }
  }
}
