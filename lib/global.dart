import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_get_law/common/values/constants.dart';

import 'common/dao/download_dao.dart';
import 'common/utils/storage.dart';
import 'common/utils/utils.dart';
import 'common/values/values.dart';

/// 全局配置
class Global {
  /// 省
  static String province = '';

  /// 市
  static String city = '';

  /// 区
  static String area = Constants.city;
  static bool isFirstOpen;

  /// init
  static Future init() async {
    // 运行初始
    WidgetsFlutterBinding.ensureInitialized();

    // 工具初始
    await StorageUtil.init();
    HttpUtil();

    // 初始化数据库
    await DBUtil().initDB();

    // 读取设备第一次打开
    isFirstOpen = !StorageUtil().getBool(STORAGE_DEVICE_ALREADY_OPEN_KEY);
    if (isFirstOpen) {
      StorageUtil().setBool(STORAGE_DEVICE_ALREADY_OPEN_KEY, true);
    }

    //android 状态栏为透明的沉浸
    if (Platform.isAndroid) {
      SystemUiOverlayStyle systemUiOverlayStyle =
          SystemUiOverlayStyle(statusBarColor: Colors.transparent);
      SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
    }
  }
}
