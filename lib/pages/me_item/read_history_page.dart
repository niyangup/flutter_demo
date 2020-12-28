import 'package:flutter/material.dart';
import 'package:flutter_get_law/common/utils/utils.dart';
import 'package:flutter_get_law/common/values/colors.dart';
import 'package:flutter_get_law/common/widgets/widgets.dart';
import 'package:flutter_get_law/pages/me_item/controller/read_history_controller.dart';
import 'package:flutter_swipe_action_cell/flutter_swipe_action_cell.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class ReadHistoryPage extends StatefulWidget {
  ReadHistoryPage({Key key}) : super(key: key);

  @override
  _ReadHistoryPageState createState() => _ReadHistoryPageState();
}

class _ReadHistoryPageState extends State<ReadHistoryPage> {
  Widget _item(int index) {
    final ReadHistoryController readHistoryController = Get.find();
    return SwipeActionCell(
      backgroundColor: Colors.transparent,
      controller: readHistoryController.controller,
      index: index,
      isDraggable: false,
      performsFirstActionWithFullSwipe: true,
      key: ValueKey(readHistoryController.lawItemList[index]),
      unselectedIndicator: Container(
        height: setHeight(28),
        width: setWidth(28),
        child: Image.asset("images/5.png"),
      ),
      selectedIndicator: Container(
        height: setHeight(28),
        width: setWidth(28),
        child: Image.asset("images/4.png"),
      ),
      child: lawItem(
        title: readHistoryController.lawItemList[index].name,
        img: readHistoryController.lawItemList[index].img,
        number: readHistoryController.lawItemList[index].number,
        type: readHistoryController.lawItemList[index].type,
        callback: readHistoryController.handleToDetailPage,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final ReadHistoryController readHistoryController = Get.put(ReadHistoryController());
    return Scaffold(
      floatingActionButton: Obx(() => AnimatedOpacity(
            curve: Curves.linear,
            duration: Duration(milliseconds: 300),
            opacity: readHistoryController.enableDelBtn.value ? 1 : 0,
            child: FloatingActionButton(
              backgroundColor: AppColors.primaryElement,
              child: Icon(Icons.delete),
              onPressed: readHistoryController.handleOnSwitchDel,
            ),
          )),
      backgroundColor: Colors.white,
      appBar: getWhiteAppbar('阅读历史', context: context, actions: [
        IconButton(
          icon: Icon(Icons.delete, color: HexColor('#666666')),
          onPressed: readHistoryController.handleOnSwitch,
        )
      ]),
      body: SafeArea(
        child: Obx(() => readHistoryController.lawItemList.isNotEmpty
            ? SmartRefresher(
                enablePullDown: false,
                enablePullUp: true,
                controller: readHistoryController.refreshController,
                onLoading: readHistoryController.onLoading,
                child: ListView.builder(
                  padding: EdgeInsets.only(top: setHeight(40)),
                  itemCount: readHistoryController.lawItemList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return _item(index);
                  },
                ),
              )
            : Center(child: CircularProgressIndicator())),
      ),
    );
  }
}
