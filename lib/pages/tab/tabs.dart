import 'package:flutter/material.dart';
import 'package:flutter_get_law/common/values/colors.dart';
import 'package:flutter_get_law/pages/tab/tab_controller.dart';
import 'package:get/get.dart';

class Tabs extends StatelessWidget {
  Tabs({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(TabsController());
    return TabsView();
  }
}

class TabsView extends GetView<TabsController> {
  TabsView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Obx(() => BottomNavigationBar(
            selectedItemColor: AppColors.primaryElement,
            currentIndex: controller.currentIndex.value,
            type: BottomNavigationBarType.fixed,
            onTap: controller.onChange,
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(icon: Icon(Icons.home), label: '首页'),
              BottomNavigationBarItem(icon: Icon(Icons.receipt), label: '资讯'),
              BottomNavigationBarItem(icon: Icon(Icons.assignment), label: '我的下载'),
              BottomNavigationBarItem(icon: Icon(Icons.person), label: '我的'),
            ],
          )),
      body: PageView.builder(
        physics: NeverScrollableScrollPhysics(),
        controller: controller.pageController,
        itemBuilder: (BuildContext context, int index) {
          return controller.pages[index];
        },
      ),
    );
  }
}
