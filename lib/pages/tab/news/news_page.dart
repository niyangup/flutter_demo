import 'package:flutter/material.dart';
import 'package:flutter_get_law/common/utils/utils.dart';
import 'package:flutter_get_law/common/values/values.dart';
import 'package:flutter_get_law/common/widgets/widgets.dart';
import 'package:get/get.dart';

import 'controller/news_controller.dart';
import 'news_list_page.dart';

///资讯page
class NewsPage extends StatefulWidget {
  @override
  _NewsPageState createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    final controller = Get.put(NewsController());
    return Obx(() => controller.tabEnable
        ? Scaffold(
            backgroundColor: Colors.white,
            appBar: getWhiteAppbar('资讯',
                leading: Container(),
                bottom: TabBar(
                  tabs: List.generate(controller.tabValues.length, (index) {
                    return Tab(text: controller.tabValues[index].name);
                  }),
                  isScrollable: true,
                  controller: controller.controller,
                  indicatorColor: AppColors.primaryElement,
                  indicatorSize: TabBarIndicatorSize.label,
                  unselectedLabelStyle: buildTextStyle('#999999', 30),
                  labelStyle: buildTextStyle('#333333', 30, fontWeight: FontWeight.w500),
                  labelColor: AppColors.primaryElement,
                  unselectedLabelColor: HexColor('#999999'),
                )),
            body: TabBarView(
              controller: controller.controller,
              children: controller.tabValues.map((e) => NewsListPage()).toList(),
            ),
          )
        : Scaffold(
            backgroundColor: Colors.white,
            appBar: getWhiteAppbar('资讯', leading: Container()),
            body: Center(child: CircularProgressIndicator()),
          ));
  }

  @override
  bool get wantKeepAlive => true;
}
