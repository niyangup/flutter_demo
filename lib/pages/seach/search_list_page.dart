import 'package:flutter/material.dart';
import 'package:flutter_get_law/common/entitys/entitys.dart';
import 'package:flutter_get_law/common/utils/screen.dart';
import 'package:flutter_get_law/common/values/constants.dart';
import 'package:flutter_get_law/common/widgets/widgets.dart';
import 'package:flutter_get_law/pages/law_detail/law_detail_page.dart';
import 'package:flutter_get_law/pages/seach/search_list_controller.dart';
import 'package:get/get.dart';
import 'package:gzx_dropdown_menu/gzx_dropdown_menu.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

///搜索列表
class SearchListPage extends StatefulWidget {
  final HomeMenuModel oneCategoryModel;

  SearchListPage({Key key, this.oneCategoryModel}) : super(key: key);

  @override
  _SearchListPageState createState() => _SearchListPageState();
}

class _SearchListPageState extends State<SearchListPage> {
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SearchListController());
    return Scaffold(
      appBar: searchAppBar(
        context,
        needBackBtn: true,
        color: Colors.white,
        enable: true,
        controller: controller.appbarController,
        searchBtnCallback: () async {},
      ),
      key: controller.scaffoldKey,
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          key: controller.stackKey,
          children: <Widget>[
            Column(
              children: <Widget>[
                Obx(() => GZXDropDownHeader(
                      borderWidth: 0,
                      dividerHeight: 0,
                      height: setHeight(125),
                      items: [
                        GZXDropDownHeaderItem(controller.leftSelectName.value,
                            style: buildTextStyle("#333333", 32)),
                        GZXDropDownHeaderItem(
                            controller.rightSelectName.value == Constants.all_type
                                ? controller.dropDownHeaderItemStrings[1]
                                : controller.rightSelectName.value,
                            style: buildTextStyle("#333333", 32)),
                      ],
                      stackKey: controller.stackKey,
                      controller: controller.dropdownMenuController,
                      dropDownStyle: buildTextStyle("#4482FF", 32),
                    )),
                SizedBox(height: setHeight(20)),
                _buildListDataWidget(controller),
              ],
            ),
            controller.twoMenuListData.isNotEmpty
                ? GZXDropDownMenu(
                    controller: controller.dropdownMenuController,
                    animationMilliseconds: 300,
                    menus: [
                      _buildCategoryItem(controller),
                      _buildBusinessItem(controller),
                    ],
                  )
                : Container(),
          ],
        ),
      ),
    );
  }

  ///新闻列表widget
  Widget _buildListDataWidget(SearchListController controller) {
    return Expanded(
      child: Builder(
        builder: (context) {
          if (controller.lawListData.isEmpty) {
            return Center(child: Text('暂无数据'));
          } else {
            return SmartRefresher(
              controller: controller.refreshController,
              header: MaterialClassicHeader(),
              child: ListView.builder(
                  itemCount: controller.lawListData.length,
                  itemBuilder: (BuildContext context, int index) {
                    return lawItem(
                      img: controller.lawListData[index].img,
                      title: controller.lawListData[index].name,
                      number: controller.lawListData[index].number,
                      type: controller.lawListData[index].type,
                      callback: () => Get.to(LawDetailPage()),
                      isDownLoaded: false,
                    );
                  }),
            );
          }
        },
      ),
    );
  }

  ///右侧的行业类型item
  GZXDropdownMenuBuilder _buildBusinessItem(SearchListController controller) {
    var height = ((40 * 4.0) / 3) * (controller.twoMenuListData.length / 3.0).ceil();
    var finalHeight = height > (40 * 4.0) ? (40 * 4.0) : height;
    return GZXDropdownMenuBuilder(
        dropDownHeight: finalHeight ?? 40 * 4,
        dropDownWidget: Container(
          margin: EdgeInsets.symmetric(horizontal: setWidth(75)),
          child: SingleChildScrollView(
            child: Wrap(
              spacing: setWidth(70),
              runSpacing: setHeight(50),
              alignment: WrapAlignment.start,
              children: List.generate(
                  controller.twoMenuListData.length,
                  (index) => GestureDetector(
                        child: Container(
                          alignment: Alignment.center,
                          width: setWidth(150),
                          height: setHeight(50),
                          child: Obx(() => Text(
                                controller.twoMenuListData[index].name,
                                style: controller.twoMenuListData[index].name ==
                                        controller.rightSelectName.value
                                    ? buildTextStyle('#4482FF', 32)
                                    : buildTextStyle("#333333", 32),
                              )),
                        ),
                        onTap: () async {
                          controller.rightSelectName.value = controller.twoMenuListData[index].name;
                          controller.dropdownMenuController.hide();
                        },
                      )),
            ),
          ),
        ));
  }

  ///左侧的全部类型item
  GZXDropdownMenuBuilder _buildCategoryItem(SearchListController controller) {
    var height = ((40 * 4.0) / 3) * (controller.twoMenuListData.length / 3).ceil();
    var finalHeight = height > (40 * 4.0) ? (40 * 4.0) : height;
    return GZXDropdownMenuBuilder(
        dropDownHeight: finalHeight ?? 40 * 4,
        dropDownWidget: Container(
          margin: EdgeInsets.symmetric(horizontal: setWidth(75)),
          child: SingleChildScrollView(
            child: Wrap(
              spacing: setWidth(70),
              runSpacing: setHeight(50),
              alignment: WrapAlignment.start,
              children: List.generate(
                  controller.twoMenuListData.length,
                  (index) => GestureDetector(
                        child: Container(
                          width: setWidth(150),
                          height: setHeight(50),
                          child: Obx(() => Text(
                                controller.twoMenuListData[index].name,
                                style: controller.twoMenuListData[index].name ==
                                        controller.leftSelectName.value
                                    ? buildTextStyle('#4482FF', 32)
                                    : buildTextStyle("#333333", 32),
                              )),
                        ),
                        onTap: () async {
                          controller.leftSelectName.value = controller.twoMenuListData[index].name;
                          controller.dropdownMenuController.hide();
                        },
                      )),
            ),
          ),
        ));
  }
}

class SortCondition {
  String name;
  bool isSelected;

  SortCondition({this.name, this.isSelected});
}
