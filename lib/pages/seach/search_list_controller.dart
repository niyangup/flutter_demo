import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_get_law/common/entitys/entitys.dart';
import 'package:flutter_get_law/common/values/values.dart';
import 'package:get/get.dart';
import 'package:gzx_dropdown_menu/gzx_dropdown_menu.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class SearchListController extends GetxController {
  RefreshController refreshController;
  TextEditingController appbarController;
  List<String> dropDownHeaderItemStrings = [Constants.all_type, '行业类型'];
  GZXDropdownMenuController dropdownMenuController = GZXDropdownMenuController();

  var scaffoldKey = new GlobalKey<ScaffoldState>();
  GlobalKey stackKey = GlobalKey();

  ///法律法规列表数据
  final lawListData = <HomeLawModel>[].obs;

  ///二级分类菜单数据
  List<TwoMenuModel> twoMenuListData = [];

  var leftSelectName = Constants.all_type.obs;
  var rightSelectName = Constants.all_type.obs;

  @override
  void onInit() {
    super.onInit();
    refreshController = RefreshController(initialRefresh: false);
    appbarController = TextEditingController();
    _initMenuData();
    _initLawList();
  }

  @override
  void onClose() {
    super.onClose();
    appbarController?.dispose();
  }

  void _initMenuData() {
    twoMenuListData.addAll([
      TwoMenuModel(name: "全部分类"),
      TwoMenuModel(name: "水利功能"),
      TwoMenuModel(name: "公路交通"),
    ]);
  }

  void _initLawList() {
    var homeLawResultModel = HomeLawResultModel.fromJson(json.decode(Constants.home_json));
    homeLawResultModel.data.shuffle();
    lawListData.clear();
    lawListData.addAll(homeLawResultModel.data);
  }
}
