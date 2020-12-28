import 'package:flutter/material.dart';
import 'package:flutter_get_law/common/utils/utils.dart';
import 'package:flutter_get_law/common/values/values.dart';
import 'package:flutter_get_law/common/widgets/app.dart';

/// 透明背景 AppBar
Widget transparentAppBar({
  @required BuildContext context,
  Widget title,
  Widget leading,
  List<Widget> actions,
}) {
  return AppBar(
    brightness: Brightness.light,
    backgroundColor: Colors.transparent,
    elevation: 0,
    title: title != null
        ? Center(
            child: title,
          )
        : null,
    leading: leading,
    actions: actions,
  );
}

///Appbar
///backgroundColor -> white
///fontColors -> black
///fontSize -> 18
Widget getWhiteAppbar(
  String title, {
  Widget leading,
  BuildContext context,
  PreferredSizeWidget bottom,
  List<Widget> actions,
  Object heroTag,
}) {
  return AppBar(
    brightness: Brightness.light,
    centerTitle: true,
    title: Text(
      '$title',
      style:
          TextStyle(color: Colors.black, fontSize: setFontSize(34), fontWeight: FontWeight.normal),
    ),
    elevation: 0.5,
    backgroundColor: Colors.white,
    leading: leading ?? BackButton(color: HexColor("#333333")),
    bottom: bottom,
    actions: actions,
  );
}

///带圆角输入框和搜索按钮的appbar
//Widget searchAppbar(
//  BuildContext context, {
//  Widget hearer,
//  Color color = AppColors.primaryElement,
//  bool needBackBtn = false,
//}) {
//  return AppBar(
//      centerTitle: true,
//      automaticallyImplyLeading: needBackBtn,
//      backgroundColor: color,
//      actions: <Widget>[
//        Center(
//          child: Padding(
//            padding: EdgeInsets.only(
//              right: setWidth(20),
//              left: setWidth(10),
//            ),
//            child: GestureDetector(
//              child: Text(
//                '搜索',
//                style: TextStyle(
//                  color: HexColor("#FFFFFF"),
//                  fontSize: setFontSize(18),
//                ),
//              ),
//              onTap: () {
//                Navigator.push(
//                  context,
//                  MaterialPageRoute(builder: (context) => SearchPage()),
//                );
//              },
//            ),
//          ),
//        )
//      ],
//      title: Row(
//        children: <Widget>[
//          hearer ?? Container(),
//          SizedBox(width: setWidth(10)),
//          Expanded(
//            child: GestureDetector(
//              child: Container(
//                padding: EdgeInsets.only(left: setWidth(10)),
//                height: setHeight(26),
//                decoration: BoxDecoration(
//                  color: AppColors.primaryElementText,
//                  borderRadius: BorderRadius.circular(30),
//                ),
//                child: Row(
//                  children: <Widget>[
//                    Icon(Icons.search, color: HexColor("#D5D5D5")),
//                    Text(
//                      "请输入关键字",
//                      style: TextStyle(
//                          color: HexColor("#999999"),
//                          fontSize: setFontSize(16)),
//                    )
//                  ],
//                ),
//              ),
//              onTap: () {
//                Navigator.push(
//                  context,
//                  MaterialPageRoute(builder: (context) => SearchPage()),
//                );
//              },
//            ),
//          ),
//        ],
//      ));
//}

///特殊的搜索框
AppBar specialSearchAppBar(
  BuildContext context, {

  ///输入框之前需要显示的widget
  Widget hearer,

  ///背景颜色
  Color color = AppColors.primaryElement,

  ///是否显示回退按钮
  bool needBackBtn = false,

  ///输入框是否可用
  bool enable = false,

  ///点击输入框的时候调用的回调 仅在enable=false时可用
  GestureTapCallback textFieldCallback,

  ///点击搜索按钮时候会调用
  GestureTapCallback searchBtnCallback,

  ///左侧字体
  Widget title,

  ///左侧选择区域点击事件
  GestureTapCallback onTapSelectCallback,
  TextEditingController controller,
}) {
  return AppBar(
    elevation: 0,
    brightness: Brightness.light,
    backgroundColor: color,
    leading: needBackBtn ? BackButton(color: HexColor('#333333')) : Text('text'),
    title: Row(
      children: <Widget>[
        hearer ?? Container(),
        Expanded(
          child: GestureDetector(
            child: Container(
              height: setHeight(66),
              decoration: BoxDecoration(
                color: HexColor("#F3F6F7"),
                borderRadius: Radii.k54pxRadius,
              ),
              child: TextField(
                controller: controller,
                enabled: enable,
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(right: setWidth(14), left: setWidth(12)),
                    hintText: '请输入关键字',
                    prefixIcon: GestureDetector(
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          SizedBox(width: setWidth(30)),
                          LimitedBox(
                            child: DefaultTextStyle(
                                style: buildTextStyle('#999999', 28), child: title),
                            maxWidth: setWidth(120),
                          ),
                          Icon(Icons.keyboard_arrow_down,
                              color: Colors.black54, size: setWidth(40)),
                          SizedBox(width: setWidth(10)),
                          Container(
                            height: setHeight(40),
                            decoration: BoxDecoration(
                              color: Colors.amber,
                              border: Border(
                                right: BorderSide(color: HexColor("#CCCCCC")),
                              ),
                            ),
                          ),
                          SizedBox(width: setWidth(20)),
                        ],
                      ),
                      onTap: onTapSelectCallback ?? () {},
                    ),
                    border: OutlineInputBorder(
                      borderRadius: Radii.k54pxRadius,
                      borderSide: BorderSide.none,
                    )),
              ),
            ),
            onTap: !enable ? textFieldCallback : null,
          ),
        ),
      ],
    ),
    centerTitle: false,
    actions: <Widget>[
      GestureDetector(
        child: Center(
          child: Padding(
            padding: EdgeInsets.only(
              right: setWidth(20),
              left: setWidth(10),
            ),
            child: Text(
              '搜索',
              style: buildTextStyle("#333333", 30),
            ),
          ),
        ),
        onTap: searchBtnCallback,
      ),
    ],
  );
}

///带圆角输入框和搜索按钮的appbar
AppBar searchAppBar(
  BuildContext context, {

  ///输入框之前需要显示的widget
  Widget hearer,

  ///背景颜色
  Color color = AppColors.primaryElement,

  ///是否显示回退按钮
  bool needBackBtn = false,

  ///输入框是否可用
  bool enable = false,

  ///点击输入框的时候调用的回调 仅在enable=false时可用
  GestureTapCallback textFieldCallback,

  ///点击搜索按钮时候会调用
  GestureTapCallback searchBtnCallback,
  TextEditingController controller,
}) {
  return AppBar(
    elevation: 0,
    brightness: Brightness.light,
    backgroundColor: color,
    automaticallyImplyLeading: needBackBtn,
    leading: needBackBtn ? BackButton(color: HexColor('#333333')) : null,
    title: Row(
      children: <Widget>[
        hearer ?? Container(),
        Expanded(
          child: GestureDetector(
            child: Container(
              height: setHeight(66),
              decoration: BoxDecoration(
                color: HexColor("#F3F6F7"),
                borderRadius: Radii.k54pxRadius,
              ),
              child: TextField(
                controller: controller,
                enabled: enable,
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(right: setWidth(14)),
                    hintText: '请输入关键字',
                    prefixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderRadius: Radii.k54pxRadius,
                      borderSide: BorderSide.none,
                    )),
              ),
            ),
            onTap: !enable ? textFieldCallback : null,
          ),
        ),
      ],
    ),
    centerTitle: false,
    actions: <Widget>[
      GestureDetector(
        child: Center(
          child: Padding(
            padding: EdgeInsets.only(
              right: setWidth(20),
              left: setWidth(10),
            ),
            child: Text(
              '搜索',
              style: buildTextStyle("#333333", 30),
            ),
          ),
        ),
        onTap: searchBtnCallback,
      ),
    ],
  );
}
