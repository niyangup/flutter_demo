import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EvaluationListController extends GetxController {
  final List<Tab> _tabValues = [Tab(text: '法律法规'), Tab(text: '资讯')];

  List<Tab> get tabValues => _tabValues;
  TabController _controller;

  TabController get controller => _controller;

  @override
  void onInit() {
    super.onInit();
    _controller = TabController(length: _tabValues.length, vsync: ScrollableState());
  }

  @override
  void onClose() {
    super.onClose();
    _controller?.dispose();
  }
}
