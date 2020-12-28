import 'package:flutter_get_law/common/values/constants.dart';
import 'package:get/get.dart';

class UseHelpController extends GetxController {
  final content = "".obs;

  @override
  void onInit() {
    super.onInit();
    _initData();
  }

  Future<void> _initData() async {
    await Future.delayed(Duration(milliseconds: 500));
    content.value = Constants.use_help;
  }
}
