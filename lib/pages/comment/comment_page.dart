import 'package:flutter/material.dart';
import 'package:flutter_get_law/common/utils/utils.dart';
import 'package:flutter_get_law/common/values/values.dart';
import 'package:flutter_get_law/common/widgets/widgets.dart';
import 'package:flutter_get_law/pages/comment/comment_controller.dart';
import 'package:get/get.dart';

///评论页面
class CommentPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CommentController());
    double height = setHeight(100);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: getWhiteAppbar('评论', context: context),
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            Align(
              alignment: Alignment.center,
              child: Obx(
                () => controller.commentListData.isEmpty
                    ? Center(child: CircularProgressIndicator())
                    : ListView.builder(
                        padding: EdgeInsets.only(
                          left: setWidth(37),
                          right: setWidth(30),
                          bottom: height,
                        ),
                        itemCount: controller.commentListData.length,
                        itemBuilder: (BuildContext context, int index) {
                          var model = controller.commentListData[index];
                          return _buildCommentItem(
                              imgUrl: model.portrait,
                              name: model.userName,
                              userLevel: model.level,
                              commentContent: model.content,
                              platformReply: model.replyContent?.trim()?.isNotEmpty ?? false,
                              replyContent: model.replyContent,
                              time: model.createTime.split(" ")[1].substring(0, 5));
                        },
                      ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                color: Colors.white,
                width: double.infinity,
                height: height,
                margin: EdgeInsets.symmetric(horizontal: setWidth(30)),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        height: setHeight(70),
                        decoration: BoxDecoration(
                          color: HexColor("#F3F6F7"),
                          borderRadius: Radii.k10pxRadius,
                        ),
                        child: TextField(
                          controller: controller.controller,
                          decoration: InputDecoration(
                              contentPadding:
                                  EdgeInsets.only(right: setWidth(14), left: setWidth(14)),
                              hintText: '请输入您的评论',
                              border: OutlineInputBorder(
                                borderRadius: Radii.k10pxRadius,
                                borderSide: BorderSide.none,
                              )),
                        ),
                      ),
                    ),
                    SizedBox(width: setWidth(20)),
                    FlatButton(
                      shape: RoundedRectangleBorder(borderRadius: Radii.k10pxRadius),
                      color: AppColors.primaryElement,
                      child: Text('发送', style: buildTextStyle('#FFFFFF', 30)),
                      onPressed: controller.handleSendComment,
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  ///评论列表item
  Widget _buildCommentItem({
    ///图片url
    String imgUrl,

    ///用户名
    String name = '春天',

    ///评论时间
    String time = '16:00',

    ///评论内容
    String commentContent = '真的很有帮助呢',

    ///平台是否回复
    bool platformReply = true,

    ///回复内容
    String replyContent = '谢谢您的支持，一个法律条文可以 表达一项或几项命令性规范',

    ///用户级别
    String userLevel = '',
  }) {
    return Container(
      padding: EdgeInsets.only(
        top: setHeight(30),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: <Widget>[
              CircleAvatar(
                backgroundImage: AssetImage(imgUrl),
                backgroundColor: Colors.white,
                radius: setWidth(74 / 2),
              ),
              SizedBox(width: setWidth(15)),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      LimitedBox(
                        maxWidth: getScreenWidth() / 2,
                        child: Text(
                          name,
                          style: buildTextStyle('#333333', 30, fontWeight: FontWeight.w500),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      SizedBox(width: setWidth(15)),
                    ],
                  ),
                  Text(time, style: buildTextStyle('#999999', 24, fontWeight: FontWeight.w500)),
                ],
              ),
              Container(
                padding: EdgeInsets.only(right: setWidth(10)),
                width: setWidth(90),
                height: setWidth(30),
                alignment: Alignment.centerRight,
                decoration: BoxDecoration(
                    image: DecorationImage(image: AssetImage('images/39.png'), fit: BoxFit.cover)),
                child: Text(userLevel, style: buildTextStyle("#FFFFFF", 22)),
              )
            ],
          ),
          SizedBox(height: setHeight(40)),
          Container(
            margin: EdgeInsets.only(
              left: setWidth(74 + 15.0),
            ),
            child: Text(
              commentContent,
              style: buildTextStyle('#333333', 32),
            ),
          ),
          _buildReply(visible: platformReply, replyContent: replyContent),
          SizedBox(height: setHeight(30)),
          Padding(
            padding: EdgeInsets.only(left: setWidth(74.0 + 15)),
            child: divider(),
          ),
        ],
      ),
    );
  }

  ///商家回复
  Widget _buildReply({
    ///是否显示商家回复
    @required bool visible,

    ///商家回复的内容
    @required String replyContent,
  }) {
    return Visibility(
      visible: visible,
      child: Container(
        margin: EdgeInsets.only(
          top: setHeight(30),
          left: setWidth(74 + 15.0),
        ),
        padding: EdgeInsets.all(setWidth(20)),
        decoration: BoxDecoration(borderRadius: Radii.k6pxRadius, color: HexColor('#FAFAFA')),
        child: RichText(
          text: TextSpan(children: <InlineSpan>[
            TextSpan(text: '平台回复: ', style: buildTextStyle('#4482FF', 28)),
            TextSpan(text: replyContent, style: buildTextStyle('#333333', 28)),
          ]),
        ),
      ),
    );
  }
}
