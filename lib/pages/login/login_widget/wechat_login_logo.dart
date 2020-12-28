import 'package:flutter/material.dart';
import 'package:flutter_get_law/common/utils/utils.dart';
import 'package:flutter_get_law/common/widgets/widgets.dart';

///微信登录logo
class WechatLoginLogo extends StatelessWidget {
  const WechatLoginLogo({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Divider(
              color: HexColor("#EEEEEE"),
              height: 1,
            ),
            Container(
              color: Colors.white,
              padding: EdgeInsets.only(
                left: setWidth(30),
                right: setWidth(30),
              ),
              child: Text(
                '第三方登录',
                style: buildTextStyle("#999999", 26),
              ),
            ),
          ],
        ),
        SizedBox(height: setRealHeight(50)),
        UnconstrainedBox(
          child: GestureDetector(
            child: Container(
              width: setWidth(63),
              height: setHeight(50),
              child: Image.asset("images/2.png", fit: BoxFit.cover),
            ),
            onTap: () {
              toastInfo(msg: "微信登录");
            },
          ),
        ),
        SizedBox(height: setRealHeight(60)),
      ],
    );
  }
}
