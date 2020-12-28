import 'package:flutter/material.dart';

import '../utils/utils.dart';
import '../values/values.dart';

///有高度的分割线
Widget divider30Px({double height = 30}) {
  return Container(height: setWidth(height), color: HexColor('#F3F6F7'));
}

///下划线
Container divider({String color = "#EEEEEE"}) {
  return Container(
    width: double.infinity,
    height: 1,
    color: HexColor(color),
  );
}

/// 10像素 Divider
Widget divider10Px({Color bgColor = AppColors.secondaryElement}) {
  return Container(
    height: setWidth(10),
    decoration: BoxDecoration(
      color: bgColor,
    ),
  );
}
