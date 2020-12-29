import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_get_law/common/values/values.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'common/values/colors.dart';
import 'global.dart';
import 'pages/index/index.dart';

Future<void> main() async {
  runZonedGuarded(() async {
    await Global.init();
    await SentryFlutter.init(
      (options) {
        options.dsn = Constants.sentry_url;
      },
      appRunner: () => runApp(MyApp()),
    );
    // runApp(MyApp());
  }, (Object error, StackTrace stack) async {
    print(error);
    print(stack.toString());
    EasyLoading.dismiss();
    await handleUploadError(error, stack);
  });
}

///上传Error
Future<SentryId> handleUploadError(Object error, StackTrace stack) async =>
    await Sentry.captureException(error, stackTrace: stack);

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
          return Scaffold(body: FlutterEasyLoading(child: child));
        },
      ),
    );
  }
}
