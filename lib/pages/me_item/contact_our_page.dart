import 'package:flutter/material.dart';
import 'package:flutter_get_law/common/utils/disable_water_ripple_behavior.dart';
import 'package:flutter_get_law/common/utils/hex_color.dart';
import 'package:flutter_get_law/common/utils/screen.dart';
import 'package:flutter_get_law/common/values/values.dart';
import 'package:flutter_get_law/common/widgets/widgets.dart';
import 'package:flutter_get_law/pages/me_item/controller/contact_our_controller.dart';
import 'package:get/get.dart';

///联系客服页面
class ContactOurPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ContactOurController());
    return Scaffold(
        backgroundColor: HexColor("#F3F6F7"),
        appBar: getWhiteAppbar('联系客服', context: context),
        body: ScrollConfiguration(
          behavior: DisableWaterRippleBehavior(),
          child: SingleChildScrollView(
            child: Obx(() => buildColumn(controller)),
          ),
        ));
  }

  Widget buildColumn(ContactOurController controller) {
    return Column(
      children: <Widget>[
        _buildItem('58.png', '客服电话：${controller.phone}', '拨打电话', HexColor('#0B88D0'),
            controller.handleCallPhone),
        _buildItem(
            '59.png', '客服QQ：${controller.qq}', '复制', HexColor("#FC9F59"), controller.handleCopyQQ),
        _buildItem('60.png', '电子邮箱：${controller.eMail}', '复制', HexColor("#01C89B"),
            controller.handleCopyEmail),
        SizedBox(height: setHeight(30)),
      ],
    );
  }

  Widget _buildItem(
    final String img,
    final String title,
    final String btnText,
    final Color color,
    final VoidCallback onPressed,
  ) {
    return Container(
      width: getScreenWidth(),
      margin: EdgeInsets.only(
        left: setWidth(30),
        right: setWidth(30),
        top: setHeight(30),
      ),
      child: Card(
        child: Column(
          children: <Widget>[
            SizedBox(height: setHeight(46)),
            Image.asset("images/$img", width: setWidth(80), fit: BoxFit.cover),
            SizedBox(height: setHeight(40)),
            Text(title, style: buildTextStyle('#666666', 32)),
            SizedBox(height: setHeight(40)),
            Container(
              width: setWidth(300),
              height: setWidth(70),
              child: RaisedButton(
                color: color,
                shape: RoundedRectangleBorder(borderRadius: Radii.k6pxRadius),
                onPressed: onPressed ?? () {},
                child: Text(btnText, style: buildTextStyle('#FFFFFF', 32)),
              ),
            ),
            SizedBox(height: setHeight(46)),
          ],
        ),
      ),
    );
  }
}
