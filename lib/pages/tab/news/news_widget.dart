import 'package:flutter/material.dart';
import 'package:flutter_get_law/common/utils/utils.dart';
import 'package:flutter_get_law/common/values/values.dart';
import 'package:flutter_get_law/common/widgets/widgets.dart';

///资讯 图文 视频 item
Widget newsPicAndVideoItem({
  String title,
  String content,
  String imgUrl,
  String type,
}) {
  return Column(
    children: <Widget>[
      SizedBox(height: setHeight(40)),
      Row(
        children: <Widget>[
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                RichText(
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  text: TextSpan(
                    children: <InlineSpan>[
                      TextSpan(
                          text: title, style: buildTextStyle('#333333', 30)),
                      WidgetSpan(
                          child: categoryTag(title: type == '2' ? '图文' : '视频'))
                    ],
                  ),
                ),
                SizedBox(height: setHeight(30)),
                Text(content,
                    style: buildTextStyle('#999999', 24),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis),
              ],
            ),
          ),
          ClipRRect(
            borderRadius: Radii.k6pxRadius,
            child: Container(
              width: setWidth(280),
              height: setHeight(190),
              child: imageCached(imgUrl),
            ),
          ),
        ],
      ),
      SizedBox(height: setHeight(40)),
      divider(),
    ],
  );
}

///资讯 纯文章 item
Widget newsArticleItem({String title, String content, String type}) {
  return Column(
    children: <Widget>[
      SizedBox(height: setHeight(40)),
      Row(
        children: <Widget>[
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                RichText(
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  text: TextSpan(
                    children: <InlineSpan>[
                      TextSpan(
                          text: title, style: buildTextStyle('#333333', 30)),
                      WidgetSpan(child: categoryTag(title: '文章'))
                    ],
                  ),
                ),
                SizedBox(height: setHeight(30)),
                Text(content,
                    style: buildTextStyle('#999999', 24),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis),
              ],
            ),
          ),
        ],
      ),
      SizedBox(height: setHeight(40)),
      divider(),
    ],
  );
}
