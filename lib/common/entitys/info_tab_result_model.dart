class InfoTabResultMode {
  String msg;
  int code;
  List<InfoTabModel> data;

  InfoTabResultMode({this.msg, this.code, this.data});

  InfoTabResultMode.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    code = json['code'];
    if (json['data'] != null) {
      data = new List<InfoTabModel>();
      json['data'].forEach((v) {
        data.add(new InfoTabModel.fromJson(v));
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

class InfoTabModel {
  String id;
  String name;
  String createTime;

  InfoTabModel({this.id, this.name, this.createTime});

  InfoTabModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    createTime = json['createTime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['createTime'] = this.createTime;
    return data;
  }
}
