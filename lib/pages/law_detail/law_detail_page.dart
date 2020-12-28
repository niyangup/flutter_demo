
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_get_law/common/utils/screen.dart';
import 'package:flutter_get_law/common/utils/utils.dart';
import 'package:flutter_get_law/common/widgets/widgets.dart';
import 'package:flutter_get_law/pages/law_detail/law_detail_controller.dart';
import 'package:get/get.dart';

class LawDetailPage extends StatelessWidget {
  final String id;

  LawDetailPage({Key key, this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LawDetailController(id));
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: getWhiteAppbar('详情', context: context),
      body: Obx(
        () {
          if (controller.model == null) {
            return Center(child: CircularProgressIndicator());
          } else {
            if (controller.model?.value?.content?.isEmpty ?? true) {
              return Center(child: Text('暂无数据'));
            } else {
              return SafeArea(
                child: Stack(
                  children: <Widget>[
                    Align(
                      alignment: Alignment.center,
                      child: Column(
                        children: <Widget>[
                          _buildHeader(controller),
                          Expanded(
                              child: htmlWidget(
                            html: controller.model.value.content,
                            onLinkTap: (url) {},
                          )),
                          SizedBox(height: setHeight(100)),
                        ],
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        color: Colors.white,
                        width: double.infinity,
                        height: setHeight(100),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            _buildBottomItem(
                              '32',
                              '下载',
                              isDownLoaded: controller.isDownloaded,
                              onTap: controller.handleDownload,
                            ),
                            _buildBottomItem('33', '评论', onTap: controller.handleComment),
                            _buildBottomItem('34', '分享', onTap: controller.handleShare),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }
          }
        },
      ),
    );
  }

  Widget _buildBottomItem(String img, String title,
      {bool isDownLoaded = false, @required GestureTapCallback onTap}) {
    if (isDownLoaded) {
      img = '35';
      title = '已下载';
    }
    return InkWell(
      onTap: onTap,
      child: Row(
        children: <Widget>[
          Image.asset(
            "images/$img.png",
            width: setWidth(37),
            height: setWidth(37),
            fit: BoxFit.cover,
          ),
          SizedBox(width: setWidth(13)),
          Text(title, style: buildTextStyle('#333333', 30)),
        ],
      ),
    );
  }

  Container _buildHeader(LawDetailController controller) {
    return Container(
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.symmetric(horizontal: setWidth(35)),
      width: double.infinity,
      height: setHeight(160),
      color: HexColor('#F3F6F7'),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Spacer(),
          Text(
            controller.model.value.name,
            style: buildTextStyle('#333333', 38, fontWeight: FontWeight.w500),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          Text(
            '文档大小：${FileSizeUtil.conversionByteToSize(controller.model.value.fileSize)}',
            style: buildTextStyle('#999999', 28),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          Spacer(),
        ],
      ),
    );
  }
}
