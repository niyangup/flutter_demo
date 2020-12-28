import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';

import '../utils/utils.dart';
import '../values/values.dart';
import 'image.dart';
import 'widgets.dart';

typedef MyCallback<T> = Widget Function(T model);
typedef OnLinkTap = void Function(String url);

///FutureBuilder工具类
///
///[future] 传入的异步方法 用于获取数据
///[finishWidget] 回调 当有数据时创建的Widget 其中的参数model即异步获取的数据
///                     没有数据时 显示 `没有更多数据`
///                      加载时 显示圆形进度条/骨架屏
Widget futureWidget<T>(Future<T> future, MyCallback<T> finishWidget) {
  return FutureBuilder<T>(
    future: future,
    builder: (BuildContext context, AsyncSnapshot snapshot) {
      if (snapshot.connectionState == ConnectionState.done) {
        if (snapshot.hasError) {
          return Text('');
        } else {
          if (snapshot.data != null) {
            T model = snapshot.data;
            return finishWidget(model);
          } else {
            return Center(child: Text('没有更多数据'));
          }
        }
      } else {
        return Center(child: CircularProgressIndicator());
//        return PKCardListSkeleton(
//          isCircularImage: true,
//          isBottomLinesActive: true,
//          length: 10,
//        );
      }
    },
  );
}

/// 字体style工具方法
/// color 颜色值 #FFF
/// fontSize 字体大小 单位sp
/// 行高 height:根据字体大小(px)计算行间距  height=fontSize*lineSpace
TextStyle buildTextStyle(
  ///字体颜色 color 颜色值 #FFF
  String color,

  /// fontSize 字体大小 单位sp
  double fontSize, {

  ///行高
  double height,

  ///是否加粗
  bool isBold = false,

  ///字重 默认w400
  FontWeight fontWeight = FontWeight.w400,
}) {
  return TextStyle(
    color: HexColor(color),
    fontSize: setFontSize(fontSize),
    height: height,
    fontWeight: isBold ? FontWeight.bold : fontWeight,
  );
}

///圆角头像
///[radius] 方法内已适配 直接填px
Widget getCircleAvatar(
    {String img = '38.png', double radius = 74.0, Color backgroundColor = Colors.white}) {
  return CircleAvatar(
    backgroundImage: AssetImage('images/$img'),
    backgroundColor: backgroundColor,
    radius: setWidth(radius / 2),
  );
}

Widget getCircleAvatar2(
    {String img = '38.png', double radius = 74.0, Color backgroundColor = Colors.white}) {
  return CircleAvatar(
    backgroundImage: AssetImage('$img'),
    backgroundColor: backgroundColor,
    radius: setWidth(radius / 2),
  );
}

///网络图片 圆角头像
///[radius] 方法内已适配 直接填px
Widget getNetWordCircleAvatar({
  String img = '38.png',
  double radius = 74.0,
  Color backgroundColor = Colors.white,
  @required String url,
}) {
  return CircleAvatar(
    backgroundImage: CachedNetworkImageProvider(url),
    backgroundColor: backgroundColor,
    radius: setWidth(radius / 2),
  );
}

///解析网页
Widget htmlWidget({
  @required String html,

  ///当富文本中超链接被点击的时候调用
  OnLinkTap onLinkTap,
}) {
  return SingleChildScrollView(
    child: Padding(
      padding: EdgeInsets.all(setWidth(30)),
      child: HtmlWidget(
        html ?? "暂无数据",
        onTapUrl: onLinkTap,
      ),
    ),
  );
  // return SingleChildScrollView(
  //   child: Html(
  //     data: html ?? '暂无数据',
  //     onLinkTap: onLinkTap,
  //   ),
  // );
}

///可伸缩的text
///[readmore: ^1.0.0]第三方插件
///修改源码中此部分为如下所示代码
/// TextSpan link = TextSpan(
///      children: [
///        TextSpan(text: _readMore ? '...' : '',
///            style: TextStyle(color: Color.fromARGB(255, 33, 33, 33))),
///       TextSpan(text: _readMore ? widget.trimCollapsedText : widget
///            .trimExpandedText, style: effectiveTextStyle.copyWith(
///          color: colorClickableText,
///       ), recognizer: TapGestureRecognizer()
///         ..onTap = _onTapLink),
///      ],
///     style: effectiveTextStyle.copyWith(
///        color: colorClickableText,
///     ),
///    );
///
//Widget readMoreText(String text, {int lines = 3}) {
//  return ReadMoreText(
//    text,
//    trimLines: lines,
//    trimMode: TrimMode.Line,
//    trimCollapsedText: '全部',
//    trimExpandedText: ' 收起',
//    colorClickableText: AppColors.primaryElement,
//    style: TextStyle(fontSize: setFontSize(28)),
//  );
//}

///法律法规item
Widget lawItem({
  String img = "http://39.103.128.99:8080/regulations/upload/20200825141109_19837243.jpg",
  String title = '中华人民共和国人民武装警察法',
  String type = '工程监理',
  String number = '312566144',
  String btnTitle = '在线阅读',
  @required VoidCallback callback,

  ///是否已下载
  bool isDownLoaded = false,
}) {
  return GestureDetector(
    child: Container(
      decoration: BoxDecoration(
        borderRadius: Radii.k10pxRadius,
        color: HexColor('#F3F6F7'),
      ),
      padding: EdgeInsets.only(
        left: setWidth(30),
        right: setWidth(30),
        top: setHeight(34),
        bottom: setHeight(20),
      ),
      margin: EdgeInsets.only(
        right: setWidth(30),
        left: setWidth(30),
        bottom: setWidth(30),
      ),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Container(
                width: setWidth(220),
                height: setHeight(220),
                child: Image.asset(img, fit: BoxFit.cover),
              ),
              SizedBox(width: setWidth(30)),
              Expanded(
                child: Container(
                  height: setHeight(220),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        title,
                        style: buildTextStyle('#333333', 32, fontWeight: FontWeight.w500),
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        '文号：$number',
                        style: buildTextStyle('#999999', 28),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        '类型：$type',
                        style: buildTextStyle('#999999', 28),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: setHeight(20)),
          Row(
            children: <Widget>[
              Visibility(
                visible: isDownLoaded,
                child: Row(
                  children: <Widget>[
                    Image.asset(
                      "images/30.png",
                      width: setWidth(30),
                      height: setWidth(30),
                      fit: BoxFit.cover,
                    ),
                    SizedBox(width: setWidth(10)),
                    Text('已下载', style: buildTextStyle('#4482FF', 30)),
                  ],
                ),
              ),
              Spacer(),
              Visibility(
                visible: false,
                child: readBtn(callback: callback, title: btnTitle),
              ),
            ],
          ),
        ],
      ),
    ),
    onTap: callback,
  );
}

///下载数据页面法律item
Widget downloadLawItem({
  String img =
      "https://flutter.cn/assets/flutter-lockup-1caf6476beed76adec3c477586da54de6b552b2f42108ec5bc68dc63bae2df75.png",
  String title = '中华人民共和国人民武装警察法',
  String type = '工程监理',
  String number = '312566144',
//  String btnTitle = '在线阅读',
  String readState = '已读',
  @required VoidCallback callback,
  Color backColor,
}) {
  return GestureDetector(
    onTap: callback,
    child: Container(
      decoration: BoxDecoration(
        borderRadius: Radii.k10pxRadius,
        color: backColor ?? HexColor('#F3F6F7'),
      ),
      padding: EdgeInsets.only(
        left: setWidth(30),
        right: setWidth(30),
        top: setHeight(34),
        bottom: setHeight(20),
      ),
      margin: EdgeInsets.only(
        right: setWidth(30),
        left: setWidth(30),
        // bottom: setWidth(30),
      ),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Container(
                width: setWidth(195),
                height: setHeight(195),
                child: imageCached(img),
              ),
              SizedBox(width: setWidth(30)),
              Expanded(
                child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        title,
                        style: buildTextStyle('#333333', 32, fontWeight: FontWeight.w500),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(height: setHeight(24)),
                      readWidget(tagText: readState),
                      SizedBox(height: setHeight(16)),
                      Text(
                        '类型：$type',
                        style: buildTextStyle('#999999', 28),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        '编号：$number',
                        style: buildTextStyle('#999999', 28),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: setHeight(20)),
        ],
      ),
    ),
  );
}

///已读Tag
Widget readWidget({String tagText = '已读'}) {
  return Container(
    width: setWidth(76),
    decoration: BoxDecoration(
      borderRadius: Radii.k4pxRadius,
      color: AppColors.primaryElement,
    ),
    padding: EdgeInsets.symmetric(horizontal: setWidth(10), vertical: setWidth(5)),
    alignment: Alignment.center,
    child: Text(
      tagText,
      style: TextStyle(color: Colors.white, fontSize: setFontSize(24), fontWeight: FontWeight.w400),
    ),
  );
}

///分类Tag
Widget categoryTag({String title = '图文'}) {
  return Container(
    margin: EdgeInsets.only(left: setWidth(10)),
    width: setWidth(60),
    decoration: BoxDecoration(
      borderRadius: Radii.k4pxRadius,
      color: AppColors.primaryElement.withOpacity(0.2),
    ),
    alignment: Alignment.center,
    child: Text(
      title,
      style: buildTextStyle("#4482FF", 22),
    ),
  );
}
