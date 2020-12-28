class TwoMenuResultModel {
  String msg;
  int code;
  List<TwoMenuModel> data;

  TwoMenuResultModel({this.msg, this.code, this.data});

  TwoMenuResultModel.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    code = json['code'];
    if (json['data'] != null) {
      data = new List<TwoMenuModel>();
      json['data'].forEach((v) {
        data.add(new TwoMenuModel.fromJson(v));
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

class TwoMenuModel {
  String id;
  String code;
  String name;
  String img;
  String parentId;
  String levelId;
  String createTime;
  String updateTime;

  TwoMenuModel(
      {this.id,
      this.code,
      this.name,
      this.img,
      this.parentId,
      this.levelId,
      this.createTime,
      this.updateTime});

  TwoMenuModel.fromJson(Map<String, dynamic> json) {
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
