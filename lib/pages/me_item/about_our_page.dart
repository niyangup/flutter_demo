import 'package:flutter/material.dart';
import 'package:flutter_get_law/common/widgets/widgets.dart';

///关于我们
class AboutOurPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: getWhiteAppbar("关于我们", context: context),
      // body: futureWidget<AboutUsResultModel>(
      //   UserSettingApi.aboutUs(context: context),
      //   (model) {
      //     return htmlWidget(html: model.data.name);
      //   },
      // ),
    );
  }
}
