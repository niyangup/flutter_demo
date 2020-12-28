class LawResult {
  String msg;
  int code;
  List<LawModel> data;

  LawResult({this.msg, this.code, this.data});

  LawResult.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    code = json['code'];
    if (json['data'] != null) {
      data = new List<LawModel>();
      json['data'].forEach((v) {
        data.add(new LawModel.fromJson(v));
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

class LawModel {
  String id;
  String userId;
  String regulationsId;
  String createTime;
  String number;
  String type;
  String img;
  String name;

  LawModel(
      {this.id,
        this.userId,
        this.regulationsId,
        this.createTime,
        this.number,
        this.type,
        this.img,
        this.name});

  LawModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['userId'];
    regulationsId = json['regulationsId'];
    createTime = json['createTime'];
    number = json['number'];
    type = json['type'];
    img = json['img'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['userId'] = this.userId;
    data['regulationsId'] = this.regulationsId;
    data['createTime'] = this.createTime;
    data['number'] = this.number;
    data['type'] = this.type;
    data['img'] = this.img;
    data['name'] = this.name;
    return data;
  }
}