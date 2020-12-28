import 'package:flutter/material.dart';
import 'package:flutter_get_law/common/utils/utils.dart';
import 'package:flutter_get_law/common/values/values.dart';
import 'package:flutter_get_law/common/widgets/widgets.dart';
import 'package:flutter_get_law/pages/tab/news/controller/news_detail_controller.dart';
import 'package:get/get.dart';
import 'package:videos_player/model/control.model.dart';
import 'package:videos_player/model/video.model.dart';
import 'package:videos_player/util/theme.util.dart';
import 'package:videos_player/videos_player.dart';

///资讯详情页面
class NewsDetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NewsDetailController());
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: getWhiteAppbar('详情', context: context),
      body: Obx(() => buildStack(controller, context)),
    );
  }

  Widget buildStack(NewsDetailController controller, BuildContext context) {
    double height = setHeight(100);
    return Stack(
      children: <Widget>[
        Align(
          alignment: Alignment.topCenter,
          child: SingleChildScrollView(
            child: Container(
              margin: EdgeInsets.only(bottom: height),
              child: Column(
                children: <Widget>[
                  SizedBox(height: setHeight(30)),
                  Text(controller.model.name ?? '', style: buildTextStyle('#333333', 38)),
                  SizedBox(height: setHeight(40)),
                  Text(controller.model.createTime ?? '', style: buildTextStyle('#999999', 30)),
                  SizedBox(height: setHeight(40)),
                  controller.model.type == '3' && controller.model.video != null
                      ? VideosPlayer(
                          networkVideos: [
                            NetworkVideo(
                                id: "2",
                                name: "Elephant Dream",
                                videoUrl: controller.model.video,
                                videoControl: NetworkVideoControl(
                                  fullScreenByDefault: false,
                                )),
                          ],
                          playlistStyle: Style.Style2,
                        )
                      : Container(),
                  htmlWidget(html: controller.model.content),
                ],
              ),
            ),
          ),
        ),
        buildBottomBar(height, controller, context),
      ],
    );
  }

  Widget buildBottomBar(double height, NewsDetailController controller, BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: SafeArea(
        child: Container(
          color: Colors.white,
          width: getScreenWidth(),
          height: height,
          padding: EdgeInsets.only(left: setWidth(30), right: setWidth(30)),
          child: Row(
            children: <Widget>[
              buildEditText(),
              SizedBox(width: setWidth(40)),
              GestureDetector(
                child: GetBuilder<NewsDetailController>(
                  builder: (controller) {
                    return Image.asset(
                      controller.model.giveLikeState == "1" ? "images/71.png" : "images/74.png",
                      width: setWidth(42),
                      fit: BoxFit.cover,
                    );
                  },
                ),
                onTap: controller.handleLikeCallback,
              ),
              SizedBox(width: setWidth(14)),
              Container(
                padding: EdgeInsets.only(top: setHeight(22)),
                alignment: Alignment.topCenter,
                child: GetBuilder<NewsDetailController>(
                  builder: (controller) {
                    return Text(controller.model?.giveLike?.toString() ?? "0");
                  },
                ),
              ),
              SizedBox(width: setWidth(40)),
              GestureDetector(
                child: Image.asset(
                  "images/73.png",
                  width: setWidth(42),
                  fit: BoxFit.cover,
                ),
                onTap: controller.handleGoToComment,
              ),
              SizedBox(width: setWidth(14)),
              Container(
                padding: EdgeInsets.only(top: setHeight(22)),
                alignment: Alignment.topCenter,
                child: Text(controller.model?.commentNum?.toString() ?? "0"),
              ),
              SizedBox(width: setWidth(40)),
              GestureDetector(
                child: Image.asset("images/72.png", width: setWidth(42), fit: BoxFit.cover),
                onTap: buildBottomSheetBar,
              ),
              SizedBox(width: setWidth(40)),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildEditText() {
    final controller = Get.find<NewsDetailController>();
    return Expanded(
      child: GestureDetector(
        child: Container(
          height: setHeight(70),
          decoration: BoxDecoration(
            color: HexColor("#F3F6F7"),
            borderRadius: Radii.k10pxRadius,
          ),
          child: TextField(
            enabled: false,
            decoration: InputDecoration(
                contentPadding: EdgeInsets.only(right: setWidth(14), left: setWidth(14)),
                hintText: '说点什么吧',
                border: OutlineInputBorder(
                  borderRadius: Radii.k10pxRadius,
                  borderSide: BorderSide.none,
                )),
          ),
        ),
        onTap: controller.handleGoToComment,
      ),
    );
  }

  void buildBottomSheetBar() {
    final controller = Get.find<NewsDetailController>();
    Get.bottomSheet(
      Container(
        width: getScreenWidth(),
        height: setRealHeight(358),
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            GestureDetector(
              child: Container(
                height: setRealHeight(358),
                child: Tab(
                  icon: Image.asset("images/36.png",
                      width: setWidth(108), height: setHeight(108), fit: BoxFit.cover),
                  text: '微信好友',
                ),
              ),
              onTap: controller.handleShareWechatFriends,
            ),
            GestureDetector(
              child: Container(
                height: setRealHeight(358),
                child: Tab(
                  icon: Image.asset("images/37.png",
                      width: setWidth(108), height: setHeight(108), fit: BoxFit.cover),
                  text: '朋友圈',
                ),
              ),
              onTap: controller.handleShareWechatFriendsCircle,
            ),
          ],
        ),
      ),
    );
  }
}
