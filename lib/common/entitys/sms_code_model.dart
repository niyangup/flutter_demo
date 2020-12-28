///验证码model
class SmsCodeModel {
  String msg;
  int code;
  String data;

  SmsCodeModel({this.msg, this.code, this.data});

  SmsCodeModel.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    code = json['code'];
    data = json['data'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['msg'] = this.msg;
    data['code'] = this.code;
    data['data'] = this.data;
    return data;
  }
}
