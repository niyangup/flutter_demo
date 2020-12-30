import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bugly/flutter_bugly.dart';
import 'package:flutter_get_law/common/utils/update.dart';
import 'package:flutter_get_law/common/utils/utils.dart';
import 'package:flutter_get_law/common/values/colors.dart';
import 'package:flutter_get_law/common/values/constants.dart';
import 'package:flutter_get_law/common/values/values.dart';
import 'package:flutter_get_law/common/widgets/widgets.dart';
import 'package:flutter_get_law/pages/tab/me/me_controller.dart';
import 'package:get/get.dart';

class MePage extends StatefulWidget {
  MePage({Key key}) : super(key: key);

  @override
  _MePageState createState() => _MePageState();
}

class _MePageState extends State<MePage> with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    final MeController controller = Get.put(MeController());
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            _buildHeader(),
            _buildListItem("44.png", '用户级别', onTap: controller.handleToUserLevelPage),
            _buildListItem("45.png", '阅读历史', onTap: controller.handleToReadHistoryPage),
            _buildListItem("65.png", '评价列表', onTap: controller.handleToEvaluationListPage),
            _buildListItem("46.png", '使用帮助', onTap: controller.handleToUseHelpPage),
            _buildListItem("63.png", '意见反馈', onTap: controller.handleToSuggestSendPage),
            // _buildListItem("62.png", '关于我们', onTap: controller.handleToAboutOurPage),
            _buildListItem("61.png", '联系客服', onTap: controller.handleToContactOurPage),
            _buildListItem("49.png", '退出登录', onTap: controller.handleExitLogin),
          ],
        ),
      ),
    );
  }

  Widget _buildListItem(String img, String title, {@required GestureTapCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        color: Colors.white,
        margin: EdgeInsets.only(
          left: setWidth(49),
          right: setWidth(43),
          top: setHeight(50),
        ),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Image.asset(
                  'images/$img',
                  width: setWidth(40),
                  fit: BoxFit.cover,
                ),
                SizedBox(width: setWidth(41)),
                Text(title, style: buildTextStyle('#333333', 30)),
                Spacer(),
                Image.asset(
                  "images/50.png",
                  width: setWidth(16),
                  height: setHeight(28),
                  fit: BoxFit.cover,
                ),
              ],
            ),
            SizedBox(height: setHeight(50)),
            divider(),
          ],
        ),
      ),
    );
  }

  ///头部背景区域
  Stack _buildHeader() {
    final MeController controller = Get.find();
    return Stack(
      children: <Widget>[
        Align(
          alignment: Alignment.center,
          child: Image.asset(
            "images/40.png",
            height: setHeight(400),
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          bottom: setHeight(80),
          child: Container(
            padding: EdgeInsets.only(left: setWidth(49), right: setWidth(43)),
            child: Row(
              children: <Widget>[
                Hero(
                  tag: 'Avatar',
                  child: getCircleAvatar2(
                      radius: 132,
                      backgroundColor: AppColors.primaryElement,
                      img: Constants.user_avatar),
                ),
                SizedBox(width: setWidth(20)),
                Container(
                  width: setWidth(750 - 132 - 49 - 20.0 - 43),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      GestureDetector(
                        onTap: controller.handleToSettingPage,
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: <Widget>[
                            Expanded(
                              child: Obx(() => Text(
                                    controller.username,
                                    style: buildTextStyle('#FFFFFF', 40),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  )),
                            ),
                            Image.asset(
                              "images/43.png",
                              width: setWidth(35),
                              fit: BoxFit.cover,
                            ),
                            SizedBox(width: setWidth(9)),
                            Text('设置', style: buildTextStyle('#F3F6F7', 28)),
                          ],
                        ),
                      ),
                      SizedBox(height: setHeight(20)),
                      Container(
                        padding: EdgeInsets.only(left: setWidth(49)),
                        width: setWidth(195),
                        height: setHeight(40),
                        decoration: BoxDecoration(
                            image: DecorationImage(image: AssetImage("images/42.png"))),
                        child: Text('级别：${Constants.user_level}',
                            style: buildTextStyle('#FFFFFF', 24, height: 1.5)),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  @override
  bool get wantKeepAlive => true;
}
