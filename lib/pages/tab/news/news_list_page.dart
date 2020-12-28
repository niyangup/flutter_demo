import 'package:flutter/material.dart';
import 'package:flutter_get_law/common/utils/utils.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'controller/news_list_controller.dart';
import 'news_widget.dart';

///资讯列表页面
class NewsListPage extends StatefulWidget {
  NewsListPage({Key key}) : super(key: key);

  @override
  _NewsListPageState createState() => _NewsListPageState();
}

class _NewsListPageState extends State<NewsListPage> with AutomaticKeepAliveClientMixin {
  final controller = Get.put(NewsListController());

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return SmartRefresher(
      enablePullDown: true,
      enableTwoLevel: true,
      onRefresh: controller.initListData,
      controller: controller.controller,
      onLoading: controller.onLoad,
      header: MaterialClassicHeader(),
      child: Obx(() => ListView.builder(
            padding: EdgeInsets.symmetric(horizontal: setWidth(30)),
            itemCount: controller.infoListData.length,
            itemBuilder: (BuildContext context, int index) {
              return InkWell(
                child: Container(
                  color: Colors.white,
                  child: controller.infoListData[index].type == '1'
                      ? newsArticleItem(
                          title: controller.infoListData[index].name,
                          content: controller.infoListData[index].content,
                        )
                      : newsPicAndVideoItem(
                          imgUrl: controller.infoListData[index].img,
                          type: controller.infoListData[index].type,
                          title: controller.infoListData[index].name,
                          content: controller.infoListData[index].content,
                        ),
                ),
                onTap: controller.handleGoDetail,
              );
            },
          )),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
