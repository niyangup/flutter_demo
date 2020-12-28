import 'package:flutter/material.dart';
import 'package:flutter_get_law/common/utils/utils.dart';
import 'package:flutter_get_law/common/values/values.dart';
import 'package:flutter_get_law/common/widgets/widgets.dart';
import 'package:flutter_get_law/pages/setting/setting_controller.dart';
import 'package:flutter_get_law/pages/tab/me/me_controller.dart';
import 'package:get/get.dart';

class SettingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final MeController meController = Get.find();
    final controller = Get.put(SettingController());
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: getWhiteAppbar("设置", context: context),
      body: Container(
        padding: EdgeInsets.only(top: setHeight(64), left: setWidth(35), right: setWidth(35)),
        child: Column(
          children: <Widget>[
            _buildAvatar(),
            Obx(() => _buildListItem(
                title: '更改名称',
                content: meController.username,
                onTap: controller.handleUpdateUsername,
                visible: false)),
            _buildListItem(
              title: '手机号码',
              content: Constants.user_phone,
              onTap: controller.handleModifyPhone,
            ),
            _buildListItem(title: '修改密码', content: '', onTap: controller.handleModifyPwd),
            _buildListItem(
                title: '用户协议和隐私政策', content: '', onTap: controller.handleUserServiceAgreement),
          ],
        ),
      ),
    );
  }

  /// item
  Widget _buildListItem({
    ///左侧文字描述
    @required String title,

    ///右侧内容
    @required String content,

    ///是否显示最右侧符号
    bool visible = true,
    @required GestureTapCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap ?? () {},
      child: Container(
        color: Colors.white,
        padding: EdgeInsets.only(top: setHeight(39)),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Text(title, style: buildTextStyle('#333333', 30)),
                Spacer(),
                Text(content, style: buildTextStyle('#999999', 30)),
                Visibility(
                  visible: visible,
                  child: Row(
                    children: <Widget>[
                      SizedBox(width: setWidth(27)),
                      Image.asset(
                        "images/51.png",
                        width: setWidth(11),
                        fit: BoxFit.cover,
                      ),
                    ],
                  ),
                )
              ],
            ),
            SizedBox(height: setHeight(30)),
            divider(),
          ],
        ),
      ),
    );
  }

  ///头像
  Widget _buildAvatar() {
    final SettingController controller = Get.find();
    return GestureDetector(
      child: Container(
        color: Colors.white,
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text('更改头像', style: buildTextStyle('#333333', 30)),
                Hero(
                  tag: 'Avatar',
                  child: getCircleAvatar2(
                    radius: 74.0,
                    backgroundColor: AppColors.primaryElement,
                    img: Constants.user_avatar,
                  ),
                ),
              ],
            ),
            SizedBox(height: setHeight(31)),
            divider(),
          ],
        ),
      ),
      onTap: controller.updateAvatar,
    );
  }
}
