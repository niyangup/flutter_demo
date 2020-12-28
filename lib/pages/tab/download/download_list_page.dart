import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_get_law/common/dao/download_dao.dart';
import 'package:flutter_get_law/common/dao/law_domain.dart';
import 'package:flutter_get_law/common/utils/screen.dart';
import 'package:flutter_get_law/common/widgets/widgets.dart';
import 'package:open_file/open_file.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

///我的下载列表page
class DownLoadListPage extends StatefulWidget {
  DownLoadListPage({Key key}) : super(key: key);

  @override
  _DownLoadListPageState createState() => _DownLoadListPageState();
}

class _DownLoadListPageState extends State<DownLoadListPage> with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;
  List<LawDomain> _itemList = [];
  RefreshController _refreshController;

  TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _refreshController = RefreshController(initialRefresh: false);
    _controller = TextEditingController();
    _getAllItems();
  }

  _getAllItems() async {
    var lawDomain = await DBUtil().getAllLawDomain();
    setState(() {
      _itemList = lawDomain;
    });
  }

  void _onRefresh() async {
    await _getAllItems();
    _refreshController.refreshCompleted();
  }

  @override
  void dispose() {
    super.dispose();
    _controller?.dispose();
  }

  @override
  // ignore: must_call_super
  Widget build(BuildContext context) {
    return GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: searchAppBar(
            context,
            color: Colors.white,
            enable: true,
            controller: _controller,
            searchBtnCallback: () async {
              EasyLoading.show(status: '请稍等');
              var list = await DBUtil().getLawDomainByName(_controller.text);
              if (list.isNotEmpty) {
                EasyLoading.showSuccess('搜索完成');
              } else {
                EasyLoading.dismiss();
                toastInfo(msg: '没有数据了');
              }
              setState(() {
                this._itemList = list;
              });
            },
            needBackBtn: true,
          ),
          body: SafeArea(
            child: SmartRefresher(
              enablePullDown: true,
              enablePullUp: false,
              onRefresh: _onRefresh,
              controller: _refreshController,
              header: MaterialClassicHeader(),
              child: ListView.separated(
                itemCount: _itemList?.length,
                itemBuilder: (BuildContext context, int index) {
                  return downloadLawItem(
                    img: _itemList[index].imgUrl,
                    title: _itemList[index].title,
                    number: _itemList[index].number,
                    type: _itemList[index].type,
                    readState: _itemList[index].readState,
                    callback: () async {
                      var data = await OpenFile.open(_itemList[index].fileUrl);
                      print('---');
                      print(data.message);
                      print(data.type);
                      print('----');
                      var row =
                          await DBUtil().updateReadStateById(int.parse(_itemList[index].lawId));
                      if (row > 0) {
                        setState(() {
                          _itemList[index].readState = '已读';
                        });
                      }
                    },
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return Container(height: setHeight(30));
                },
              ),
            ),
          ),
        ));
  }
}
