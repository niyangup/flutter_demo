import 'package:clipboard/clipboard.dart';
import 'package:flutter_get_law/common/widgets/widgets.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactOurController extends GetxController {
  final phone = "加载中".obs;
  final qq = "加载中".obs;
  final eMail = "加载中".obs;

  @override
  void onInit() {
    super.onInit();
    _initData();
  }

  Future<void> _initData() async {
    await Future.delayed(Duration(seconds: 1));
    phone.value = "10086";
    qq.value = "10000";
    eMail.value = "niyangup@163.com";
  }

  void handleCallPhone() {
    launch('tel:${phone.value}');
  }

  Future<void> handleCopyQQ() async {
    await FlutterClipboard.copy('${qq.value}');
    toastInfo(msg: '复制成功');
  }

  Future<void> handleCopyEmail() async {
    await FlutterClipboard.copy('${eMail.value}');
    toastInfo(msg: '复制成功');
  }
}
