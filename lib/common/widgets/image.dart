import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../values/values.dart';

/// 缓存图片
Widget imageCached(
  String url, {
  EdgeInsetsGeometry margin,
}) {
  return CachedNetworkImage(
    fit: BoxFit.cover,
    imageUrl: url,
    imageBuilder: (context, imageProvider) => Container(
      margin: margin,
      decoration: BoxDecoration(
        borderRadius: Radii.k6pxRadius,
        image: DecorationImage(
          image: imageProvider,
          fit: BoxFit.cover,
          // colorFilter: ColorFilter.mode(Colors.red, BlendMode.colorBurn),
        ),
      ),
    ),
    placeholder: (context, url) {
      return Container(
        alignment: Alignment.center,
        child: CircularProgressIndicator(),
      );
    },
    errorWidget: (context, url, error) => Icon(Icons.error),
  );
}
