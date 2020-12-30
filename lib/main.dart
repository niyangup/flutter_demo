import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bugly/flutter_bugly.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'common/values/colors.dart';
import 'global.dart';
import 'pages/index/index.dart';

Future<void> main() async {
  runZonedGuarded(() async {
    await Global.init();
    FlutterBugly.postCatchedException(
      () => runApp(MyApp()),
      debugUpload: false,
    );
  }, (Object error, StackTrace stack) async {
    print(error);
    print(stack.toString());
    EasyLoading.dismiss();
    if (!kDebugMode) {
      await handleUploadError(error, stack);
    }
  });
}

///非[debug]环境异常上报
Future handleUploadError(Object error, StackTrace stack) async {
  await FlutterBugly.uploadException(message: error.toString(), detail: stack.toString());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RefreshConfiguration(
      hideFooterWhenNotFull: false,
      headerBuilder: () => MaterialClassicHeader(),
      shouldFooterFollowWhenNotFull: (m) => false,
      child: GetMaterialApp(
        localizationsDelegates: [
          RefreshLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
        ],
        theme: ThemeData(primaryColor: AppColors.primaryElement),
        supportedLocales: [
          const Locale('en'),
          const Locale('zh'),
        ],
        localeResolutionCallback: (Locale locale, Iterable<Locale> supportedLocales) {
          return locale;
        },
        title: '全过程法规',
        debugShowCheckedModeBanner: false,
        home: IndexPage(),
        builder: (context, child) {
          return Scaffold(
            resizeToAvoidBottomInset: false,
            body: FlutterEasyLoading(child: child),
          );
        },
      ),
    );
  }
}
