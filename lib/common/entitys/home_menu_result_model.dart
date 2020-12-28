class HomeMenuResultModel {
  String msg;
  int code;
  List<HomeMenuModel> data;

  HomeMenuResultModel({this.msg, this.code, this.data});

  HomeMenuResultModel.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    code = json['code'];
    if (json['data'] != null) {
      data = new List<HomeMenuModel>();
      json['data'].forEach((v) {
        data.add(new HomeMenuModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['msg'] = this.msg;
    data['code'] = this.code;
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class HomeMenuModel {
  String id;
  String code;
  String name;
  String img;
  String parentId;
  String levelId;
  String createTime;
  String updateTime;

  HomeMenuModel(
      {this.id,
      this.code,
      this.name,
      this.img,
      this.parentId,
      this.levelId,
      this.createTime,
      this.updateTime});

  HomeMenuModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    code = json['code'];
    name = json['name'];
    img = json['img'];
    parentId = json['parentId'];
    levelId = json['levelId'];
    createTime = json['createTime'];
    updateTime = json['updateTime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['code'] = this.code;
    data['name'] = this.name;
    data['img'] = this.img;
    data['parentId'] = this.parentId;
    data['levelId'] = this.levelId;
    data['createTime'] = this.createTime;
    data['updateTime'] = this.updateTime;
    return data;
  }
}
