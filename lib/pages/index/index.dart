import 'package:flutter/material.dart';
import 'package:flutter_get_law/pages/tab/tabs.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class IndexPage extends StatefulWidget {
  IndexPage({Key key}) : super(key: key);

  @override
  _IndexPageState createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, width: 750, height: 1334, allowFontScaling: true);

    // return Scaffold(
    //   body: Global.isFirstOpen == true
    //       ? LoginByPwdPage()
    //       : Global.isOfflineLogin == true
    //           ? Tabs()
    //           : LoginByPwdPage(),
    // );
    return Tabs();
  }
}