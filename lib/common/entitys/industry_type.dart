///行业类型model
class IndustryType {
  String msg;
  int code;
  List<Type> data;

  IndustryType({this.msg, this.code, this.data});

  @override
  String toString() {
    return 'IndustryType{msg: $msg, code: $code, data: $data}';
  }

  IndustryType.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    code = json['code'];
    if (json['data'] != null) {
      data = new List<Type>();
      json['data'].forEach((v) {
        data.add(new Type.fromJson(v));
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

class Type {
  String id;
  String name;
  String createTime;
  String updateTime;

  Type({this.id, this.name, this.createTime, this.updateTime});

  Type.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    createTime = json['createTime'];
    updateTime = json['updateTime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['createTime'] = this.createTime;
    data['updateTime'] = this.updateTime;
    return data;
  }

  @override
  String toString() {
    return 'Type{id: $id, name: $name, createTime: $createTime, updateTime: $updateTime}';
  }
}
