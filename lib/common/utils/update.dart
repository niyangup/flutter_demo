import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bugly/flutter_bugly.dart';
import 'package:flutter_get_law/common/widgets/widgets.dart';
import 'package:get/get.dart';

class UpdateApp {
  static final GlobalKey<UpdateDialogState> _dialogKey = new GlobalKey();

  static Future<void> checkUpdate() async {
    if (Platform.isAndroid) {
      UpgradeInfo info = await FlutterBugly.getUpgradeInfo();
      if (info != null) {
        _showUpdateDialog(info.newFeature, info.apkUrl);
      }
    }
  }

  static _showUpdateDialog(String version, String url) async {
    if (version == null || version.isEmpty || url == null || url.isEmpty) {
      return;
    }
    await showDialog(
      barrierDismissible: false,
      context: Get.overlayContext,
      builder: (_) => _buildDialog(version, url),
    );
  }

  static Widget _buildDialog(String version, String url) {
    print(version);
    return UpdateDialog(
      key: _dialogKey,
      version: version,
      onClickWhenDownload: (_msg) {
        //提示不要重复下载
        print(_msg);
      },
      onClickWhenNotDownload: () {
        //下载apk，完成后打开apk文件，建议使用dio+open_file插件
      },
    );
  }
}
