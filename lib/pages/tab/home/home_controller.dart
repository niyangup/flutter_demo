
import 'package:city_pickers/city_pickers.dart';
import 'package:flutter_get_law/common/entitys/entitys.dart';
import 'package:flutter_get_law/common/utils/check.dart';
import 'package:flutter_get_law/pages/law_detail/law_detail_page.dart';
import 'package:flutter_get_law/pages/seach/search_list_page.dart';
import 'package:flutter_get_law/pages/seach/search_page.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../../global.dart';

class HomeController extends GetxController {
  ///一级分类菜单数据
  final _itemList = <HomeMenuModel>[].obs;

  List<HomeMenuModel> get itemList => _itemList.toList();

  ///轮播图数据
  final _bannerListData = <BannerModel>[].obs;

  List<BannerModel> get bannerListData => _bannerListData.toList();

  ///法律法规推荐
  RxList<HomeLawModel> _lawList = RxList<HomeLawModel>();

  List<HomeLawModel> get lawList => _lawList.toList();

  RefreshController _refreshController;

  RefreshController get refreshController => _refreshController;

  @override
  void onInit() {
    super.onInit();

    _refreshController = RefreshController(initialRefresh: false);
    _initBannerListData();
    _initHomeMenuListData();
    initHomeLawListData();
  }

  ///初始化轮播图数据
  _initBannerListData() {
    var bannerResultModel = List.generate(
        3,
        (index) => BannerModel(
              url: "images/banner_${index + 1}.jpg",
              title: index.toString(),
              id: index.toString(),
            ));

    this._bannerListData.clear();
    this._bannerListData.addAll(bannerResultModel);
  }

  ///初始化首页菜单数据
  _initHomeMenuListData() {
    List<String> nameList = [
      "工程咨询",
      "勘查设计",
      "招标代理",
      "政府采购",
      "造价咨询",
      "工程监理",
      "工程施工",
      "PPP",
      "水土保持",
      "稳评"
    ];
    var modelList = List.generate(
        10,
        (index) => HomeMenuModel(
              id: index.toString(),
              name: nameList[index],
              img: "images/grid_${index + 1}.png",
            ));
    _itemList.clear();
    _itemList.addAll(modelList);
  }

  ///初始化法律推荐数据
  initHomeLawListData() {
    _lawList.clear();
    _lawList.addAll(getHomeLawList());
  }

  void onRefresh() async {
    try {
      await Future.delayed(Duration(seconds: 2));
      _initBannerListData();
      _initHomeMenuListData();
      initHomeLawListData();
      _refreshController.refreshCompleted();
    } catch (e) {
      print(e);
      _refreshController.refreshFailed();
    }
  }

  void handleShowCityPick() async {
    Result result = await CityPickers.showCityPicker(context: Get.context);
    if (result != null && result.areaName != null) {
      Global.province = result.provinceName;
      Global.city = result.cityName;
      Global.area = result.areaName;
      update();
      initHomeLawListData();
    }
  }

  void handleTapSearch() {
    Get.to(SearchPage());
  }

  void handleTapBanner() {
    Get.to(LawDetailPage());
  }

  ///点击了一级分类
  void handleCategory() {
    Get.to(SearchListPage());
  }

  void handleLawRecommend() {
    Get.to(LawDetailPage());
  }
}
