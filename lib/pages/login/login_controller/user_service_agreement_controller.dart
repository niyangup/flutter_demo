import 'package:flutter_get_law/common/values/constants.dart';
import 'package:get/get.dart';

class UserServiceAgreementPageController extends GetxController {
  var html = "".obs;

  @override
  void onInit() {
    super.onInit();
    Future.delayed(Duration(seconds: 2), () {
      html.value = Constants.argument;
    });
  }
}
