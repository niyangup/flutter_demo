import 'package:flutter/material.dart';
import 'package:flutter_get_law/common/dao/download_dao.dart';
import 'package:flutter_get_law/common/dao/folder_domain.dart';
import 'package:flutter_get_law/common/utils/utils.dart';
import 'package:flutter_get_law/common/widgets/widgets.dart';
import 'package:flutter_get_law/pages/tab/download/download_detail_list_page.dart';
import 'package:flutter_get_law/pages/tab/download/download_list_page.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'download_widget.dart';

class DownLoadPage extends StatefulWidget {
  DownLoadPage({Key key}) : super(key: key);

  @override
  _DownLoadPageState createState() => _DownLoadPageState();
}

class _DownLoadPageState extends State<DownLoadPage> {
  TextEditingController _controller;
  List<FolderDomain> folderList = [];

  RefreshController _refreshController;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
    _refreshController = RefreshController();
    _initData();
  }

  _initData() async {
    var data = await DBUtil().getAllFolderNames();
    if (data.isNotEmpty) {
      setState(() {
        this.folderList = data;
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
      appBar: getWhiteAppbar("我的下载", context: context, leading: Container()),
      body: SmartRefresher(
        header: MaterialClassicHeader(),
        enablePullDown: true,
        controller: _refreshController,
        onRefresh: () async {
          await _initData();
          _refreshController.refreshCompleted();
        },
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              searchAppBar(
                context,
                color: Colors.white,
                enable: false,
                textFieldCallback: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => DownLoadListPage()));
                },
                searchBtnCallback: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => DownLoadListPage()));
                },
              ),
              SizedBox(height: setHeight(30)),
              Container(
                padding: EdgeInsets.symmetric(horizontal: setWidth(34)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text('文件夹', style: buildTextStyle('#333333', 34)),
                    readBtn(
                      title: "新建文件夹",
                      callback: () {
                        showMyInputDialog(
                          title: "新建文件夹",
                          hint: "请输入新文件夹名称",
                          controller: _controller,
                          okCallback: () async {
                            if (_controller.text.isNotEmpty) {
                              var data = await DBUtil()
                                  .insertFolderDomain(FolderDomain(title: _controller.text));
                              if (data != null) {
                                toastInfo(msg: "添加成功");
                                Navigator.pop(context);
                                _controller.clear();
                                _initData();
                              }
                            } else {
                              toastInfo(msg: "请输入新文件名称");
                            }
                          },
                        );
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(height: setHeight(30)),
              ListView.separated(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: this.folderList?.length ?? 0,
                itemBuilder: (BuildContext context, int index) {
                  return DownloadItem(
                    title: folderList[index].title,
                    onTap: () async {
                      await Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  DownloadDetailListPage(domain: folderList[index])));
                      _initData();
                    },
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return Container(height: 1, color: HexColor("#F3F3F3"));
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
