import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_get_law/common/dao/download_dao.dart';
import 'package:flutter_get_law/common/dao/folder_domain.dart';
import 'package:flutter_get_law/common/dao/law_domain.dart';
import 'package:flutter_get_law/common/utils/utils.dart';
import 'package:flutter_get_law/common/widgets/widgets.dart';
import 'package:flutter_get_law/pages/tab/download/download_widget.dart';
import 'package:flutter_swipe_action_cell/flutter_swipe_action_cell.dart';
import 'package:open_file/open_file.dart';

class DownloadDetailListPage extends StatefulWidget {
  final FolderDomain domain;

  DownloadDetailListPage({Key key, @required this.domain}) : super(key: key);

  @override
  _DownloadDetailListPageState createState() => _DownloadDetailListPageState();
}

class _DownloadDetailListPageState extends State<DownloadDetailListPage> {
  TextEditingController _controller;
  List<LawDomain> lawList = [];

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
    _initData();
  }

  _initData() async {
    var data = await DBUtil().getAllLawDomainByFolderId(widget.domain.id);
    if (data != null && data.isNotEmpty) {
      setState(() {
        lawList = data;
      });
    }
  }

  @override
  void dispose() {
    super.dispose();
    _controller?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor("#F3F3F3"),
      appBar: getWhiteAppbar("文件夹详情", context: context),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(height: setHeight(30)),
            DownloadItem(
              title: widget.domain.title,
              needRightIcons: true,
              iconTap: () {
                showMyInputDialog(
                  controller: _controller,
                  okCallback: () async {
                    if (_controller.text.isNotEmpty) {
                      var data =
                          await DBUtil().updateFolderNameById(widget.domain.id, _controller.text);
                      if (data != null && data > 0) {
                        Navigator.pop(context);
                        widget.domain.title = _controller.text;
                        _controller.clear();
                        toastInfo(msg: "修改成功");
                        setState(() {});
                      }
                    } else {
                      toastInfo(msg: "请输入新名称");
                    }
                  },
                );
              },
            ),
            SizedBox(height: setHeight(30)),
            ListView.separated(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: lawList?.length ?? 0,
              itemBuilder: (BuildContext context, int index) {
                return SwipeActionCell(
                  key: ValueKey(lawList[index]),
                  trailingActions: <SwipeAction>[
                    SwipeAction(
                      title: "删除",
                      onTap: (CompletionHandler handler) async {
                        showMyConfirmDialog(
                          content: "确认要删除吗",
                          // context: context,
                          okCallback: () async {
                            EasyLoading.show(status: "请稍后");
                            var count = await DBUtil().deleteLawDomainById(lawList[index].id);
                            if (count > 0) {
                              EasyLoading.showSuccess("删除成功");
                              Navigator.pop(context);
                              lawList.removeAt(index);
                              setState(() {});
                            } else {
                              EasyLoading.showInfo("删除失败");
                            }
                          },
                        );
                      },
                      color: Colors.red,
                    ),
                  ],
                  child: GestureDetector(
                    child: downloadLawItem(
                      backColor: Colors.white,
                      img: lawList[index].imgUrl,
                      title: lawList[index].title,
                      number: lawList[index].number,
                      type: lawList[index].type,
                      readState: lawList[index].readState,
                      callback: () async {
                        await OpenFile.open(lawList[index].fileUrl);
                        await DBUtil().updateReadStateById(int.parse(lawList[index].lawId));
                        await _initData();
                      },
                    ),
                  ),
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return divider30Px();
              },
            )
          ],
        ),
      ),
    );
  }
}
