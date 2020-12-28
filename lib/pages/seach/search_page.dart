import 'package:flutter/material.dart';
import 'package:flutter_get_law/common/utils/hex_color.dart';
import 'package:flutter_get_law/common/utils/screen.dart';
import 'package:flutter_get_law/common/widgets/widgets.dart';
import 'package:flutter_get_law/pages/law_detail/law_detail_page.dart';
import 'package:flutter_get_law/pages/seach/search_controller.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

///首页搜索框进入的搜索页面
class SearchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SearchController());
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: specialSearchAppBar(
        context,
        enable: true,
        controller: controller.controller,
        needBackBtn: true,
        color: Colors.white,
        title: Obx(() => Text(controller.selectTitle.value)),
        searchBtnCallback: controller.handleSearchBtnCallBack,
        onTapSelectCallback: controller.handleOnTapSelectCallback,
      ),
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            Obx(() => SmartRefresher(
                  controller: controller.refreshController,
                  child: ListView.builder(
                    // shrinkWrap: true,
                    // physics: NeverScrollableScrollPhysics(),
                    itemCount: controller.searchResultList.length,
                    itemBuilder: (BuildContext context, int index) {
                      return lawItem(
                        title: controller.searchResultList[index].name,
                        type: controller.searchResultList[index].type,
                        number: controller.searchResultList[index].number,
                        img: controller.searchResultList[index].img,
                        callback: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    LawDetailPage(id: controller.searchResultList[index].id)),
                          );
                        },
                      );
                    },
                  ),
                )),
            _buildSearchHistory(),
          ],
        ),
      ),
    );
  }

  ///搜索历史 widget
  Widget _buildSearchHistory() {
    final SearchController controller = Get.find();
    return Obx(() => Visibility(
          visible: controller.searchResultList?.isEmpty ?? true,
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: setWidth(30)),
            child: Column(
              children: <Widget>[
                SizedBox(height: setHeight(60)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text('历史搜索', style: buildTextStyle('#333333', 30, fontWeight: FontWeight.w500)),
                    GestureDetector(
                      child: Image.asset(
                        "images/28.png",
                        width: setWidth(32),
                        fit: BoxFit.cover,
                      ),
                      onTap: controller.handleDeleteHistoryData,
                    ),
                  ],
                ),
                SizedBox(height: setHeight(40)),
                Visibility(
                  visible: controller.searchHistoryList?.isNotEmpty ?? false,
                  child: Container(
                    width: double.infinity,
                    child: Wrap(
                      spacing: setWidth(20),
                      children: List.generate(controller.searchHistoryList.length, (index) {
                        return InputChip(
                          label: Text(controller.searchHistoryList[index].name ?? "",
                              style: buildTextStyle('#666666', 24)),
                          backgroundColor: HexColor("#F8F7F6"),
                          onPressed: controller.handleSearchHistory,
                        );
                      }),
                    ),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
