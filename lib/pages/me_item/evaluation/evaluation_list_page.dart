import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_get_law/common/entitys/entitys.dart';
import 'package:flutter_get_law/common/utils/utils.dart';
import 'package:flutter_get_law/common/values/values.dart';
import 'package:flutter_get_law/common/widgets/widgets.dart';
import 'package:flutter_get_law/pages/me_item/evaluation/evaluation_list_controller.dart';
import 'package:flutter_get_law/pages/me_item/evaluation/law_tab_controller.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

///评价列表
class EvaluationListPage extends StatefulWidget {
  EvaluationListPage({Key key}) : super(key: key);

  @override
  _EvaluationListPageState createState() => _EvaluationListPageState();
}

class _EvaluationListPageState extends State<EvaluationListPage> {
  @override
  Widget build(BuildContext context) {
    final EvaluationListController controller = Get.put(EvaluationListController());
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: getWhiteAppbar('评价列表',
          context: context,
          bottom: TabBar(
            tabs: controller.tabValues,
            isScrollable: false,
            controller: controller.controller,
            indicatorColor: AppColors.primaryElement,
            indicatorSize: TabBarIndicatorSize.label,
            unselectedLabelStyle: buildTextStyle('#999999', 30),
            labelStyle: buildTextStyle('#333333', 30),
            labelColor: HexColor('#333333'),
            unselectedLabelColor: HexColor('#999999'),
          )),
      body: TabBarView(
        controller: controller.controller,
        children: [
          LawTabPage(type: 1),
          LawTabPage(type: 2),
        ],
      ),
    );
  }
}

///法鲁法规页面
class LawTabPage extends StatefulWidget {
  final int type;

  LawTabPage({
    Key key,
    this.type,
  }) : super(key: key);

  @override
  _LawTabPageState createState() => _LawTabPageState();
}

class _LawTabPageState extends State<LawTabPage> with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    final LawTabController controller = Get.put(LawTabController());
    return Obx(() => SafeArea(
          child: controller.modelList.isNotEmpty
              ? SmartRefresher(
                  onRefresh: controller.onRefresh,
                  controller: controller.refreshController,
                  child: ListView.builder(
                    itemCount: controller.modelList.length,
                    itemBuilder: (BuildContext context, int index) {
                      return lawCommentItem(controller.modelList[index]);
                    },
                  ),
                )
              : Center(child: CircularProgressIndicator()),
        ));
  }

  Widget lawCommentItem(CommentModel model) {
    return Container(
      padding: EdgeInsets.only(
        top: setHeight(30),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(
              left: setWidth(30),
              right: setWidth(30),
            ),
            child: Text(
              model.content,
              style: buildTextStyle('#333333', 32),
            ),
          ),
          Visibility(
              visible: model.replyContent != null && model.replyContent.isNotEmpty,
              child: _buildReply(visible: true, replyContent: model.replyContent)),
          SizedBox(height: setHeight(30)),
          Container(
            margin: EdgeInsets.only(right: setWidth(30)),
            alignment: Alignment.centerRight,
            child: Text(model.createTime, style: buildTextStyle('#999999', 28)),
          ),
          SizedBox(height: setHeight(30)),
          Padding(
            padding: EdgeInsets.only(
              left: setWidth(30),
              right: setWidth(30),
            ),
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
        width: double.infinity,
        margin: EdgeInsets.only(
          top: setHeight(30),
          left: setWidth(30),
          right: setWidth(30),
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
