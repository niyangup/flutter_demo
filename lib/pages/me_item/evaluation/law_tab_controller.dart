import 'package:flutter_get_law/common/entitys/entitys.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class LawTabController extends GetxController {
  RefreshController refreshController;
  final modelList = <CommentModel>[].obs;

  ///分页参数
  int page = 1;

  ///根据code变换相应的状态 进度条或者是没有数据 或者list列表
  int code = 0;

  @override
  void onInit() {
    super.onInit();
    refreshController = RefreshController(initialRefresh: false);
    _initListData();
  }

  _initListData() async{
    await Future.delayed(Duration(seconds: 1));
    String now = DateTime.now().toString();
    var nowTime = now.split(".")[0];
    this.modelList.clear();
    this
        .modelList
        .add(CommentModel(content: "content", replyContent: "replyContent", createTime: nowTime));
    update();
  }

  void onRefresh() async {
    await _initListData();
    refreshController.refreshCompleted();
  }
}
