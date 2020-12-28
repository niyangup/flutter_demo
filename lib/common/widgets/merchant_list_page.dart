import 'package:flutter/material.dart';
import 'package:flutter_get_law/common/utils/utils.dart';

///最上册有选择的Page
class MerchantListPage extends StatefulWidget {
  MerchantListPage({Key key}) : super(key: key);

  @override
  _MerchantListPageState createState() {
    return _MerchantListPageState();
  }
}

class _MerchantListPageState extends State<MerchantListPage> {
  bool isSelected = false;

   tap() {
    setState(() {
      isSelected = !isSelected;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('123'),
        ),
        body: Stack(
          children: <Widget>[
            ///底部的数据列表
            Align(
              child: Container(
                margin: EdgeInsets.only(
                  top: setHeight(60),
                ),
                child: ListView.builder(
                  itemCount: 30,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      title: Text('title $index'),
                    );
                  },
                ),
              ),
            ),
            Align(
              child: Column(
                children: <Widget>[
                  _buildHead(),
                  AnimatedContainer(
                    height: isSelected ? setHeight(150) : 0,
                    color: Colors.white,
                    duration: Duration(milliseconds: 300),
                    curve: Curves.linearToEaseOut,
                    child: Wrap(
                      children: <Widget>[
                        ListTile(
                          title: Text('area'),
                          trailing: Icon(Icons.done),
                        ),
                        ListTile(
                          title: Text('area'),
                          trailing: Icon(Icons.done),
                        ),
                        ListTile(
                          title: Text('area'),
                          trailing: Icon(Icons.done),
                        ),
                      ],
                    ),
                  ),
                  isSelected
                      ? Expanded(
                          child: GestureDetector(
                            child: Container(
                              color: Colors.black54,
                            ),
                            onTap: tap,
                          ),
                        )
                      : Container()
                ],
              ),
            ),
          ],
        ));
  }

  ///顶部的三层选项
  Container _buildHead() {
    return Container(
      height: setHeight(60),
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          GestureDetector(
            child: Row(
              children: <Widget>[Text('区域'), Icon(Icons.keyboard_arrow_down)],
            ),
            onTap: tap,
          ),
          GestureDetector(
            child: Row(
              children: <Widget>[Text('类型'), Icon(Icons.keyboard_arrow_down)],
            ),
            onTap: tap,
          ),
          GestureDetector(
            child: Row(
              children: <Widget>[Text('排序'), Icon(Icons.keyboard_arrow_down)],
            ),
            onTap: tap,
          ),
        ],
      ),
    );
  }
}
