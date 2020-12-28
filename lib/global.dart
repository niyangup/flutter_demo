import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_get_law/common/values/constants.dart';

import 'common/dao/download_dao.dart';
import 'common/utils/storage.dart';
import 'common/utils/utils.dart';

/// 全局配置
class Global {
  /// 省
  static String province = '';

  /// 市
  static String city = '';

  /// 区
  static String area = Constants.city;

  /// init
  static Future init() async {
    // 运行初始
    WidgetsFlutterBinding.ensureInitialized();

    // 工具初始
    await StorageUtil.init();
    HttpUtil();

    // 初始化数据库
    await DBUtil().initDB();

    //android 状态栏为透明的沉浸
    if (Platform.isAndroid) {
      SystemUiOverlayStyle systemUiOverlayStyle =
          SystemUiOverlayStyle(statusBarColor: Colors.transparent);
      SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
    }
  }
}
