import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_get_law/common/utils/screen.dart';
import 'package:flutter_get_law/common/utils/utils.dart';
import 'package:flutter_get_law/common/values/values.dart';
import 'package:flutter_get_law/common/widgets/widgets.dart';
import 'package:flutter_get_law/global.dart';
import 'package:flutter_get_law/pages/tab/home/home_controller.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class HomePage extends StatelessWidget {
  HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(HomeController());
    return HomeView();
  }
}

class HomeView extends StatefulWidget {
  HomeView({Key key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> with AutomaticKeepAliveClientMixin {
  final HomeController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return SmartRefresher(
      enablePullDown: true,
      enablePullUp: false,
      onRefresh: controller.onRefresh,
      controller: controller.refreshController,
      child: CustomScrollView(
        slivers: <Widget>[
          _buildSliverAppBar(),
          _buildGridList(),
          SliverToBoxAdapter(child: divider30Px()),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.only(left: setWidth(30), top: setHeight(30)),
              child: Text(
                '法律法规推荐',
                style: buildTextStyle('#4482FF', 38, fontWeight: FontWeight.w500),
                maxLines: 1,
                overflow: TextOverflow.clip,
              ),
            ),
          ),
          SliverToBoxAdapter(child: SizedBox(height: setHeight(30))),
          SliverList(
            delegate: SliverChildBuilderDelegate((content, index) {
              return lawItem(
                img: controller.lawList[index].img,
                title: controller.lawList[index].name,
                type: controller.lawList[index].type,
                number: controller.lawList[index].number,
                callback: controller.handleLawRecommend,
              );
            }, childCount: controller.lawList.length),
          ),
        ],
      ),
    );
  }

  Widget _buildGridList() {
    return SliverPadding(
      padding: EdgeInsets.symmetric(horizontal: setWidth(30), vertical: setHeight(8)),
      sliver: SliverGrid(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 5),
        delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
          return Container(
            child: GestureDetector(
              onTap: controller.handleCategory,
              child: Column(
                children: <Widget>[
                  Container(
                    width: setWidth(90),
                    height: setHeight(90),
                    child: Image.asset(controller.itemList[index].img, fit: BoxFit.cover),
                  ),
                  Text(controller.itemList[index].name, style: buildTextStyle('#666666', 24)),
                ],
              ),
            ),
          );
        }, childCount: controller.itemList.length),
      ),
    );
  }

  Widget _buildSliverAppBar() {
    return SliverAppBar(
      backgroundColor: AppColors.primaryElement,
      pinned: true,
      expandedHeight: setHeight(320 + 248.0),
      automaticallyImplyLeading: false,
      centerTitle: false,
      actions: <Widget>[
        Center(
          child: Container(
            padding: EdgeInsets.only(right: setWidth(37)),
            child: GestureDetector(
              child: Text(
                '搜索',
                style: TextStyle(color: HexColor("#FFFFFF"), fontSize: setFontSize(30)),
              ),
              onTap: controller.handleTapSearch,
            ),
          ),
        )
      ],
      title: Row(
        children: <Widget>[
          GestureDetector(
            child: Row(
              children: <Widget>[
                GetBuilder<HomeController>(
                  builder: (controller) {
                    return Text(Global.area.isEmpty ? Constants.city : Global.area,
                        style: buildTextStyle('#FFFFFF', 30, height: 1));
                  },
                ),
                Icon(Icons.keyboard_arrow_down, size: 22, color: AppColors.primaryBackground)
              ],
            ),
            onTap: controller.handleShowCityPick,
          ),
          SizedBox(width: setWidth(10)),
          Expanded(
            child: GestureDetector(
              child: Container(
                padding: EdgeInsets.only(left: setWidth(30)),
                height: setHeight(66),
                decoration: BoxDecoration(
                  color: AppColors.primaryElementText,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Row(
                  children: <Widget>[
                    Icon(Icons.search, color: HexColor("#D5D5D5")),
                    Text(
                      "请输入关键字",
                      style: TextStyle(color: HexColor("#999999"), fontSize: setFontSize(26)),
                    )
                  ],
                ),
              ),
              onTap: controller.handleTapSearch,
            ),
          ),
        ],
      ),
      flexibleSpace: FlexibleSpaceBar(
        background: Stack(
          children: <Widget>[
            Container(color: Colors.white),
            Image.asset(
              "images/8.png",
              width: double.infinity,
              height: setWidth(500),
              fit: BoxFit.cover,
            ),
            Align(
              alignment: Alignment.center,
              child: Container(
                height: setHeight(400),
                margin: EdgeInsets.only(
                  top: setRealHeight(120),
                  left: setWidth(30),
                  right: setWidth(30),
                  // bottom: setRealHeight(70),
                ),
                child: ClipRRect(
                  borderRadius: Radii.k6pxRadius,
                  child: Obx(() => controller.bannerListData.isNotEmpty
                      ? swiper()
                      : Center(child: CircularProgressIndicator())),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget swiper() {
    return Swiper(
      autoplay: true,
      itemCount: controller.bannerListData.length ?? 0,
      itemBuilder: (BuildContext context, int index) {
        return GestureDetector(
          child: Image.asset(controller.bannerListData[index].url, fit: BoxFit.cover),
          onTap: controller.handleTapBanner,
        );
      },
    );
  }

  @override
  bool get wantKeepAlive => true;
}
