class LawDetailResultModel {
  String msg;
  int code;
  LawDetailModel data;

  LawDetailResultModel({this.msg, this.code, this.data});

  LawDetailResultModel.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    code = json['code'];
    data =
        json['data'] != null ? new LawDetailModel.fromJson(json['data']) : null;
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

class LawDetailModel {
  String id;
  String name;
  String img;
  String number;
  String content;
  String classifyOne;
  String classifyTwo;
  String type;
  String url;
  String createTime;
  String updateTime;
  String downState;
  String fileUrl;
  String fileSize;

  LawDetailModel(
      {this.id,
      this.name,
      this.img,
      this.number,
      this.content,
      this.classifyOne,
      this.classifyTwo,
      this.type,
      this.url,
      this.createTime,
      this.updateTime,
      this.downState,
      this.fileUrl,
      this.fileSize});

  LawDetailModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    img = json['img'];
    number = json['number'];
    content = json['content'];
    classifyOne = json['classifyOne'];
    classifyTwo = json['classifyTwo'];
    type = json['type'];
    url = json['url'];
    createTime = json['createTime'];
    updateTime = json['updateTime'];
    downState = json['downState'];
    fileUrl = json['fileUrl'];
    fileSize = json['fileSize'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['img'] = this.img;
    data['number'] = this.number;
    data['content'] = this.content;
    data['classifyOne'] = this.classifyOne;
    data['classifyTwo'] = this.classifyTwo;
    data['type'] = this.type;
    data['url'] = this.url;
    data['createTime'] = this.createTime;
    data['updateTime'] = this.updateTime;
    data['downState'] = this.downState;
    data['fileUrl'] = this.fileUrl;
    data['fileSize'] = this.fileSize;
    return data;
  }
}
