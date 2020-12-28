import 'package:flutter_get_law/common/values/constants.dart';
import 'package:flutter_get_law/common/values/values.dart';
import 'package:flutter_get_law/common/widgets/widgets.dart';
import 'package:flutter_get_law/pages/login/login_page/login_by_pwd_page.dart';
import 'package:flutter_get_law/pages/me_item/about_our_page.dart';
import 'package:flutter_get_law/pages/me_item/contact_our_page.dart';
import 'package:flutter_get_law/pages/me_item/evaluation/evaluation_list_page.dart';
import 'package:flutter_get_law/pages/me_item/read_history_page.dart';
import 'package:flutter_get_law/pages/me_item/suggest_send_page.dart';
import 'package:flutter_get_law/pages/me_item/use_help_page.dart';
import 'package:flutter_get_law/pages/me_item/user_level_page.dart';
import 'package:flutter_get_law/pages/setting/setting_page.dart';
import 'package:flutter_get_law/pages/tab/tab_controller.dart';
import 'package:get/get.dart';

class MeController extends GetxController {
  final RxString _username = "".obs;

  String get username => _username.value;

  set username(String value) {
    _username.value = value;
  }

  @override
  void onInit() {
    super.onInit();
    _username.value = Constants.username;
  }

  void handleToUserLevelPage() {
    Get.to(UserLevelPage());
  }

  void handleToReadHistoryPage() {
    Get.to(ReadHistoryPage());
  }

  void handleToEvaluationListPage() {
    Get.to(EvaluationListPage());
  }

  void handleToUseHelpPage() {
    Get.to(UseHelpPage());
  }

  void handleToSuggestSendPage() {
    Get.to(SuggestSendPage());
  }

  void handleToAboutOurPage() {
    Get.to(AboutOurPage());
  }

  void handleToContactOurPage() {
    Get.to(ContactOurPage());
  }

  void handleExitLogin() {
    showMyConfirmDialog(
      content: '确定要退出吗',
      okCallback: () async{
        final controller = Get.find<TabsController>();
        controller.resetCurrentIndex();
        Get.offAll(LoginByPwdPage());
      },
    );
  }

  void handleToSettingPage() {
    Get.to(SettingPage());
  }
}
