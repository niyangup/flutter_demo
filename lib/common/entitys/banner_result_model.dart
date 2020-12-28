class BannerResultModel {
  String msg;
  int code;
  List<BannerModel> data;

  BannerResultModel({this.msg, this.code, this.data});

  BannerResultModel.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    code = json['code'];
    if (json['data'] != null) {
      data = new List<BannerModel>();
      json['data'].forEach((v) {
        data.add(new BannerModel.fromJson(v));
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

class BannerModel {
  String id;
  String url;
  String title;
  String regulationsId;
  String state;
  String type;
  String createTime;
  String updateTime;

  BannerModel(
      {this.id,
        this.url,
        this.title,
        this.regulationsId,
        this.state,
        this.type,
        this.createTime,
        this.updateTime});

  BannerModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    url = json['url'];
    title = json['title'];
    regulationsId = json['regulationsId'];
    state = json['state'];
    type = json['type'];
    createTime = json['createTime'];
    updateTime = json['updateTime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['url'] = this.url;
    data['title'] = this.title;
    data['regulationsId'] = this.regulationsId;
    data['state'] = this.state;
    data['type'] = this.type;
    data['createTime'] = this.createTime;
    data['updateTime'] = this.updateTime;
    return data;
  }
}