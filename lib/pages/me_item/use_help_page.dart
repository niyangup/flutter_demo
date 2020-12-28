import 'package:flutter/material.dart';
import 'package:flutter_get_law/common/widgets/widgets.dart';
import 'package:flutter_get_law/pages/me_item/controller/use_help_controller.dart';
import 'package:get/get.dart';

class UseHelpPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UseHelpController());
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: getWhiteAppbar('使用帮助', context: context),
        body: Obx(
          () => controller.content.isNotEmpty
              ? htmlWidget(html: controller.content.value)
              : Center(child: CircularProgressIndicator()),
        ));
  }
}
