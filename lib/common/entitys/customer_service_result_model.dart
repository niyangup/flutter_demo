class CustomerServiceResultModel {
  String msg;
  int code;
  CustomerServiceModel data;

  CustomerServiceResultModel({this.msg, this.code, this.data});

  CustomerServiceResultModel.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    code = json['code'];
    data = json['data'] != null
        ? new CustomerServiceModel.fromJson(json['data'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['msg'] = this.msg;
    data['code'] = this.code;
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    return data;
  }
}

class CustomerServiceModel {
  String id;
  String phone;
  String qq;
  String email;
  String createTime;
  String updateTime;

  CustomerServiceModel(
      {this.id,
      this.phone,
      this.qq,
      this.email,
      this.createTime,
      this.updateTime});

  CustomerServiceModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    phone = json['phone'];
    qq = json['qq'];
    email = json['email'];
    createTime = json['createTime'];
    updateTime = json['updateTime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['phone'] = this.phone;
    data['qq'] = this.qq;
    data['email'] = this.email;
    data['createTime'] = this.createTime;
    data['updateTime'] = this.updateTime;
    return data;
  }
}
