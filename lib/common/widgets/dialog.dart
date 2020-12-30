import 'package:flutter/material.dart';
import 'package:flutter_get_law/common/widgets/widgets.dart';
import 'package:flutter_get_law/pages/tab/download/download_widget.dart';
import 'package:get/get.dart';

import '../utils/utils.dart';
import '../values/values.dart';

class SelectModel {
  String id;

  String title;

  bool selected;

  SelectModel({this.id, this.title, this.selected = false});

  @override
  String toString() {
    return 'SelectModel{id: $id, title: $title, selected: $selected}';
  }
}

///确认对话框 取消+确定按钮
showMyConfirmDialog({
  String title = '提示',
  Widget contentWidget,
  String content = '',
  String cancelText = '取消',
  String okText = '确定',
  VoidCallback cancelCallback,
  @required VoidCallback okCallback,
}) {
  Get.defaultDialog(
    title: title,
    content: contentWidget,
    middleText: content,
    buttonColor: AppColors.primaryElement,
    onCancel: cancelCallback,
    onConfirm: okCallback,
    cancelTextColor: AppColors.primaryElement,
    confirmTextColor: AppColors.primaryBackground,
    textCancel: cancelText,
    textConfirm: okText,
  );
  // showDialog(
  //     context: Get.overlayContext,
  //     builder: (context) {
  //       return AlertDialog(
  //         title: Text(title),
  //         content: Text(content),
  //         actions: <Widget>[
  //           FlatButton(
  //             onPressed: cancelCallback ??
  //                 () {
  //                   Navigator.pop(context);
  //                 },
  //             child: Text(cancelText),
  //           ),
  //           FlatButton(
  //             onPressed: okCallback ?? () {},
  //             child: Text(okText),
  //           ),
  //         ],
  //       );
  //     });
}

Future<String> showMySelectDialog({
  @required BuildContext context,
  @required List<String> list,
  String title = '请选择行业',
}) async {
  if (list == null || list.isEmpty) {
    throw Exception('list不可为空');
  }

  // List<String> content = await showDialog<List<String>>(
  //     context: context,
  //     builder: (context) {
  //       return AlertDialog(
  //           title: Text(title),
  //           content: SingleChildScrollView(
  //             child: Wrap(
  //                 children: list
  //                     .map((e) => ListTile(
  //                         title: Text(e),
  //                         onTap: () {
  //                           Navigator.pop(context, <String>[e]);
  //                         }))
  //                     .toList()),
  //           ));
  //     });

  List<String> content = await Get.defaultDialog<List<String>>(
    title: title,
    content: SingleChildScrollView(
        child: Wrap(
            children: list
                .map((e) => ListTile(
                    title: Text(e),
                    onTap: () {
                      Navigator.pop(context, <String>[e]);
                    }))
                .toList())),
  );

  return content[0];
}

Future<SelectModel> showMyModelSelectDialog({
  @required BuildContext context,
  @required List<SelectModel> list,
  String title = '请选择',
}) async {
  if (list == null || list.isEmpty) {
    throw Exception('list不可为空');
  }

  List<SelectModel> content = await showDialog<List<SelectModel>>(
      context: context,
      builder: (context) {
        return AlertDialog(
            title: Text(title),
            content: SingleChildScrollView(
              child: Wrap(
                  children: list
                      .map((e) => ListTile(
                          title: Text(e.title),
                          onTap: () {
                            Navigator.pop(context, <SelectModel>[e]);
                          }))
                      .toList()),
            ));
      });

  return content[0];
}

Future<SelectModel> showMyRealSelectDialog({
  @required BuildContext context,
  @required List<SelectModel> list,
  String title = '请选择',
}) async {
  if (list == null || list.isEmpty) {
    throw Exception('list不可为空');
  }
  SelectModel result = list.first;

  List<SelectModel> content = await showDialog<List<SelectModel>>(
      context: context,
      builder: (context) {
        return StatefulBuilder(builder: (BuildContext context, StateSetter myState) {
          return AlertDialog(
            title: Center(child: Text(title)),
            titleTextStyle: buildTextStyle("#333333", 32),
            content: SingleChildScrollView(
              child: Wrap(
                  runSpacing: setHeight(40),
                  children: list
                      .map(
                        (e) => Container(
                          height: setHeight(118),
                          width: getScreenWidth(),
                          child: DownloadItem(
                            padding: EdgeInsets.only(),
                            // margin: EdgeInsets.symmetric(vertical: setHeight(40)),
                            img: e.selected ? "4.png" : "5.png",
                            title: e.title,
                            needRightIcons: true,
                            onTap: () {
                              for (var model in list) {
                                model.selected = false;
                              }
                              e.selected = true;
                              result = e;
                              myState(() {});
                            },
                          ),
                        ),
                      )
                      .toList()),
            ),
            actions: <Widget>[
              Container(
                height: setHeight(90),
                width: getScreenWidth(),
                child: readBtn(
                  title: "下载",
                  callback: () {
                    Navigator.pop(context, <SelectModel>[result]);
                  },
                ),
              )
            ],
          );
        });
      });
  print('---');
  print(content);
  print('---');
  if (content?.isNotEmpty ?? false) {
    return content[0];
  } else {
    return null;
  }
}

///输入对话框 取消+确定按钮
showMyInputDialog({
  String title = '提示',
  String content = '',
  String cancelText = '取消',
  String okText = '确定',
  String hint = "请输入新名称",
  VoidCallback cancelCallback,
  @required VoidCallback okCallback,
  @required TextEditingController controller,
}) {
  Get.defaultDialog(
    title: title,
    barrierDismissible: false,
    content: Container(
      height: setHeight(70),
      decoration: BoxDecoration(
        color: HexColor("#F3F6F7"),
        borderRadius: Radii.k10pxRadius,
      ),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
            contentPadding: EdgeInsets.only(right: setWidth(14), left: setWidth(14)),
            hintText: hint,
            border: OutlineInputBorder(
              borderRadius: Radii.k10pxRadius,
              borderSide: BorderSide.none,
            )),
      ),
    ),
    middleText: content,
    buttonColor: AppColors.primaryElement,
    onCancel: cancelCallback,
    onConfirm: okCallback,
    cancelTextColor: AppColors.primaryElement,
    confirmTextColor: AppColors.primaryBackground,
    textCancel: cancelText,
    textConfirm: okText,
  );
  //
  // showDialog(
  //     context: Get.overlayContext,
  //     barrierDismissible: false,
  //     builder: (context) {
  //       return AlertDialog(
  //         title: Text(title),
  //         content: Container(
  //           height: setHeight(70),
  //           decoration: BoxDecoration(
  //             color: HexColor("#F3F6F7"),
  //             borderRadius: Radii.k10pxRadius,
  //           ),
  //           child: TextField(
  //             controller: controller,
  //             decoration: InputDecoration(
  //                 contentPadding: EdgeInsets.only(right: setWidth(14), left: setWidth(14)),
  //                 hintText: hint,
  //                 border: OutlineInputBorder(
  //                   borderRadius: Radii.k10pxRadius,
  //                   borderSide: BorderSide.none,
  //                 )),
  //           ),
  //         ),
  //         actions: <Widget>[
  //           FlatButton(
  //             onPressed: cancelCallback ??
  //                 () {
  //                   Navigator.pop(context);
  //                 },
  //             child: Text(cancelText),
  //           ),
  //           FlatButton(
  //             onPressed: okCallback ?? () {},
  //             child: Text(okText),
  //           ),
  //         ],
  //       );
  //     });
}

class UpdateDialog extends StatefulWidget {
  final key;
  final version;
  final Function onClickWhenDownload;
  final Function onClickWhenNotDownload;

  UpdateDialog({
    this.key,
    this.version,
    this.onClickWhenDownload,
    this.onClickWhenNotDownload,
  });

  @override
  State<StatefulWidget> createState() => new UpdateDialogState();
}

class UpdateDialogState extends State<UpdateDialog> {
  var _downloadProgress = 0.0;

  @override
  Widget build(BuildContext context) {
    var _textStyle = new TextStyle(color: Theme.of(context).textTheme.body1.color);

    return AlertDialog(
      title: Text("有新的更新", style: _textStyle),
      content: _downloadProgress == 0.0
          ? Text("版本${widget.version}", style: _textStyle)
          : LinearProgressIndicator(value: _downloadProgress),
      actions: <Widget>[
        FlatButton(
          child: Text('更新', style: _textStyle),
          onPressed: () {
            if (_downloadProgress != 0.0) {
              widget.onClickWhenDownload("正在更新中");
              return;
            }
            widget.onClickWhenNotDownload();
//            Navigator.of(context).pop();
          },
        ),
        FlatButton(child: Text('取消'), onPressed: () => Navigator.of(context).pop()),
      ],
    );
  }

  set progress(_progress) {
    setState(() {
      _downloadProgress = _progress;
      if (_downloadProgress == 1) {
        Navigator.of(context).pop();
        _downloadProgress = 0.0;
      }
    });
  }
}
