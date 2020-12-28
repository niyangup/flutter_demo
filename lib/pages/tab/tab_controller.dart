import 'package:flutter/material.dart';
import 'package:flutter_get_law/pages/tab/download/download_page.dart';
import 'package:flutter_get_law/pages/tab/home/home_page.dart';
import 'package:flutter_get_law/pages/tab/me/me_page.dart';
import 'package:flutter_get_law/pages/tab/news/news_page.dart';
import 'package:get/get.dart';

class TabsController extends GetxController {
  List<Widget> _pages = [HomePage(), NewsPage(), DownLoadPage(), MePage()];

  List<Widget> get pages => _pages;
  final RxInt currentIndex = 0.obs;

  PageController _pageController;

  PageController get pageController => _pageController;

  @override
  void onInit() {
    super.onInit();
    _pageController = PageController(initialPage: currentIndex.value);
  }

  void resetCurrentIndex() {
    currentIndex.value = 0;
  }

  void onChange(int index) {
    currentIndex.value = index;
    _pageController.jumpToPage(index);
  }

  @override
  void onClose() {
    super.onClose();
    _pageController?.dispose();
  }
}
