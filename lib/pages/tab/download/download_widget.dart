import 'package:flutter/material.dart';
import 'package:flutter_get_law/common/utils/utils.dart';
import 'package:flutter_get_law/common/values/values.dart';
import 'package:flutter_get_law/common/widgets/widgets.dart';

class DownloadItem extends StatelessWidget {
  final String title;
  final String img;
  final bool needRightIcons;
  final GestureTapCallback onTap;
  final EdgeInsetsGeometry margin;
  final EdgeInsetsGeometry padding;
  final GestureTapCallback iconTap;

  const DownloadItem({
    Key key,
    this.title = "我的列表",
    this.img = "77.png",
    this.needRightIcons = false,
    this.onTap,
    this.margin,
    this.padding,
    this.iconTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        decoration: BoxDecoration(borderRadius: Radii.k6pxRadius, color: Colors.white),
        margin: margin ?? EdgeInsets.symmetric(horizontal: setWidth(34)),
        padding: padding ?? EdgeInsets.all(setHeight(34)),
        child: Row(
          children: <Widget>[
            Image.asset(
              "images/78.png",
              width: setWidth(40),
              height: setHeight(40),
              fit: BoxFit.cover,
            ),
            SizedBox(width: setWidth(30)),
            Text(title, style: buildTextStyle('#333333', 32)),
            Spacer(),
            GestureDetector(
              child: Visibility(
                visible: needRightIcons,
                child: Image.asset(
                  "images/$img",
                  width: setWidth(40),
                  height: setHeight(40),
                  fit: BoxFit.cover,
                ),
              ),
              onTap: iconTap ?? () {},
            ),
          ],
        ),
      ),
      onTap: onTap ?? () {},
    );
  }
}
