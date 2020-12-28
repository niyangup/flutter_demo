import 'package:flutter_get_law/common/entitys/entitys.dart';
import 'package:flutter_get_law/common/utils/check.dart';
import 'package:flutter_get_law/common/widgets/dialog.dart';
import 'package:flutter_get_law/pages/law_detail/law_detail_page.dart';
import 'package:flutter_swipe_action_cell/core/controller.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class ReadHistoryController extends GetxController {
  SwipeActionController controller;
  RefreshController refreshController;

  final lawItemList = <LawModel>[].obs;
  int page = 1;

  int code = 0;

  final enableDelBtn = false.obs;

  @override
  void onInit() {
    super.onInit();
    controller = SwipeActionController();
    refreshController = RefreshController(initialRefresh: false);

    _initFirstData();
  }

  Future _initFirstData() async {
    await Future.delayed(Duration(seconds: 1));
    List<LawModel> list = [];
    getHomeLawList().forEach((element) {
      list.add(LawModel(
        img: element.img,
        number: element.id,
        type: element.type,
        name: element.name,
      ));
    });
    lawItemList.addAll(list);
  }

  Future<void> onLoading() async {
    await Future.delayed(Duration(seconds: 1));
    var list = List.of(lawItemList);
    list.shuffle();
    lawItemList.addAll(list);

    refreshController.loadComplete();
  }

  void handleOnSwitchDel() {
    List<int> selectedIndexes = controller.getSelectedIndexPaths();
    if (selectedIndexes.isNotEmpty) {
      List<LawModel> list = [];

      selectedIndexes.forEach((element) {
        list.add(lawItemList[element]);
      });

      showMyConfirmDialog(
        content: "确定要删除选中条目吗",
        okCallback: () {
          Get.back();
          list.forEach((element) {
            controller.deleteCellAt(indexPaths: selectedIndexes);
            lawItemList.remove(element);
          });
        },
      );
    } else {
      print('误触了');
    }
  }

  void handleOnSwitch() {
    controller.toggleEditingMode();
    this.enableDelBtn.value = controller.isEditing;
  }

  void handleToDetailPage() {
    Get.to(LawDetailPage());
  }
}
