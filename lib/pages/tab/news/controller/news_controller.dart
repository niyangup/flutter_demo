import 'package:flutter/material.dart';
import 'package:flutter_get_law/common/entitys/entitys.dart';
import 'package:get/get.dart';

class NewsController extends GetxController with SingleGetTickerProviderMixin {
  final _tabValues = <InfoTabModel>[];

  TabController _controller;

  final _tabEnable = false.obs;

  bool get tabEnable => _tabEnable.value;

  TabController get controller => _controller;

  List<InfoTabModel> get tabValues => _tabValues;

  @override
  void onInit() {
    super.onInit();
    _initInfoTabListData();
  }

  _initInfoTabListData() async {
    // var infoTabResultMode = await InformationApi.informationClassify(context: Get.overlayContext);
    // if (infoTabResultMode.code == 200 && infoTabResultMode.data.isNotEmpty) {
    //   this._tabValues.clear();
    //   this._tabValues.addAll(infoTabResultMode.data);
    // }
    await Future.delayed(Duration(milliseconds: 400));
    final List<String> list = ["推荐", "招标代理", "其他"];
    this._tabValues.addAll(List.generate(
        list.length, (index) => InfoTabModel(id: index.toString(), name: list[index])));
    _controller = TabController(length: _tabValues.length, vsync: this);
    _tabEnable.toggle();
  }

  @override
  void onClose() {
    super.onClose();
    _controller?.dispose();
  }
}
