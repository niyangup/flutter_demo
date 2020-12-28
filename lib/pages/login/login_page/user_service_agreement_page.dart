import 'package:flutter/material.dart';
import 'package:flutter_get_law/common/widgets/widgets.dart';
import 'package:flutter_get_law/pages/login/login_controller/user_service_agreement_controller.dart';
import 'package:get/get.dart';

///用户服务协议
class UserServiceAgreementPage extends StatelessWidget {
  UserServiceAgreementPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(UserServiceAgreementPageController());
    return UserServiceAgreementView();
  }
}

class UserServiceAgreementView extends GetView<UserServiceAgreementPageController> {
  UserServiceAgreementView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: getWhiteAppbar('用户协议和隐私政策', context: context),
        body: SafeArea(
          child: Obx(
            () => controller.html.isNotEmpty
                ? htmlWidget(html: controller.html.value)
                : Center(child: CircularProgressIndicator()),
          ),
        ));
  }
}
