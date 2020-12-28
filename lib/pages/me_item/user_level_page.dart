import 'package:flutter/material.dart';
import 'package:flutter_get_law/common/utils/screen.dart';
import 'package:flutter_get_law/common/values/colors.dart';
import 'package:flutter_get_law/common/values/constants.dart';
import 'package:flutter_get_law/common/widgets/widgets.dart';
import 'package:flutter_get_law/pages/tab/me/me_controller.dart';
import 'package:get/get.dart';

///用户级别页面
class UserLevelPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final controller = Get.find<MeController>();
    return Scaffold(
      backgroundColor: AppColors.primaryElement,
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            expandedHeight: setHeight(420),
            pinned: true,
            automaticallyImplyLeading: false,
            backgroundColor: AppColors.primaryElement,
            title: Text('用户级别', style: buildTextStyle('#FFFFFF', 34)),
            leading: BackButton(),
            centerTitle: true,
            flexibleSpace: FlexibleSpaceBar(
              background: Stack(
                children: <Widget>[
                  Align(
                    alignment: Alignment.topLeft,
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: AppColors.primaryElement,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      height: setHeight(132),
                      margin: EdgeInsets.only(
                        top: setWidth(100),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          SizedBox(width: setWidth(49)),
                          Hero(
                            tag: 'Avatar',
                            child: getCircleAvatar2(
                                radius: 132,
                                backgroundColor: AppColors.primaryElement,
                                img: Constants.user_avatar),
                          ),
                          SizedBox(width: setWidth(20)),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: <Widget>[
                                Obx(() => Text(
                                      controller.username,
                                      style: buildTextStyle("#FFFFFF", 40,
                                          fontWeight: FontWeight.w500),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    )),
                                SizedBox(height: setHeight(20)),
                                Container(
                                  padding: EdgeInsets.only(left: setWidth(49)),
                                  width: setWidth(195),
                                  height: setHeight(40),
                                  decoration: BoxDecoration(
                                      image: DecorationImage(image: AssetImage("images/42.png"))),
                                  child: Text(
                                    '级别：${Constants.user_level}',
                                    style: buildTextStyle('#FFFFFF', 24, height: 1.4),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverFillRemaining(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: Padding(
                padding: EdgeInsets.only(left: setWidth(28)),
                child: ListView(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  children: <Widget>[
                    Text('级别规则', style: buildTextStyle("#333333", 36)),
                    SizedBox(height: setWidth(28)),
                    htmlWidget(html: Constants.user_level_json),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
