//class SearchResultModel {
//
//  String msg;
//  int code;
//  List<SearchModel> data;
//
//  SearchResultModel({this.msg, this.code, this.data});
//
//  SearchResultModel.fromJson(Map<String, dynamic> json) {
//    msg = json['msg'];
//    code = json['code'];
//    if (json['data'] != null) {
//      data = new List<SearchModel>();
//      json['data'].forEach((v) {
//        data.add(new SearchModel.fromJson(v));
//      });
//    }
//  }
//
//  Map<String, dynamic> toJson() {
//    final Map<String, dynamic> data = new Map<String, dynamic>();
//    data['msg'] = this.msg;
//    data['code'] = this.code;
//    if (this.data != null) {
//      data['data'] = this.data.map((v) => v.toJson()).toList();
//    }
//    return data;
//  }
//}
//
//class SearchModel {
//  String id;
//  String name;
//  String img;
//  String number;
//  String content;
//  String classifyOne;
//  String classifyTwo;
//  String type;
//  String state;
//  String createTime;
//  String updateTime;
//  String downState;
//
//  SearchModel(
//      {this.id,
//      this.name,
//      this.img,
//      this.number,
//      this.content,
//      this.classifyOne,
//      this.classifyTwo,
//      this.type,
//      this.state,
//      this.createTime,
//      this.updateTime,
//      this.downState});
//
//  SearchModel.fromJson(Map<String, dynamic> json) {
//    id = json['id'];
//    name = json['name'];
//    img = json['img'];
//    number = json['number'];
//    content = json['content'];
//    classifyOne = json['classifyOne'];
//    classifyTwo = json['classifyTwo'];
//    type = json['type'];
//    state = json['state'];
//    createTime = json['createTime'];
//    updateTime = json['updateTime'];
//    downState = json['downState'];
//  }
//
//  Map<String, dynamic> toJson() {
//    final Map<String, dynamic> data = new Map<String, dynamic>();
//    data['id'] = this.id;
//    data['name'] = this.name;
//    data['img'] = this.img;
//    data['number'] = this.number;
//    data['content'] = this.content;
//    data['classifyOne'] = this.classifyOne;
//    data['classifyTwo'] = this.classifyTwo;
//    data['type'] = this.type;
//    data['state'] = this.state;
//    data['createTime'] = this.createTime;
//    data['updateTime'] = this.updateTime;
//    data['downState'] = this.downState;
//    return data;
//  }
//}
